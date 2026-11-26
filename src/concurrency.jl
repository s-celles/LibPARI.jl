# ---------------------------------------------------------------------------
# Concurrency — one PARI context per Julia OS thread (feature 013).
# Included first by src/LibPARI.jl.
# ---------------------------------------------------------------------------
#
# PARI's working state (`avma`, the main stack, the recursion-depth base) is
# thread-local. To use PARI from many Julia threads at once, each thread runs
# on its own **PARI context**: the primary context created by `pari_init`,
# and one secondary context per other thread, set up with PARI's per-thread
# API (`pari_thread_alloc` / `pari_thread_start`).
#
# LibPARI owns those contexts through a **pool of sticky worker tasks, one
# pinned to each Julia OS thread**. A `libpari` call is marshalled to the
# worker for the caller's thread; calls from different threads run on
# different workers, on different cores — genuinely in parallel. This
# generalizes milestone M9 (a single worker) to N; with one thread it *is*
# M9. Worker arrays are indexed by `Threads.threadid()` and sized to
# `Threads.maxthreadid()` — thread ids are not assumed to be `1:nthreads()`
# (Julia thread pools).
#
# PARI's clone/block list is THREAD-LOCAL (`cur_block`, `root_block` and
# `next_block` are `THREAD` statics in libpari's init.c): a block must be
# freed on the thread that created it. Every `gclone`/`gunclone` therefore
# runs on the primary worker, so the primary's list is the only one used,
# while the heavy computation runs on each context's own stack.

# A unit of libpari work for a worker. `reply === nothing` is fire-and-forget
# (used by `Gen` finalization, which must not block); otherwise the worker
# delivers `(true, result)` or `(false, exception)` on `reply`.
struct _PariJob
    work::Function
    reply::Union{Channel{Tuple{Bool,Any}},Nothing}
end

# The worker pool. All are mutable synchronization state, so they are created
# fresh in `__init__` (`_start_pari_worker_pool!`) — never at module
# definition time, which would bake a stale object into the precompile image.
# `_PARI_REQUESTS` and `_PARI_WORKERS` are indexed by `Threads.threadid()`.
const _PARI_REQUESTS = Ref{Vector{Union{Channel{_PariJob},Nothing}}}()
const _PARI_WORKERS = Ref{Vector{Union{Task,Nothing}}}()
const _PARI_PRIMARY = Ref{Int}(0)        # threadid of the primary worker
const _PARI_READY = Ref{Base.Event}()    # primary "PARI is up" signal

# Clones of finalized `Gen`s, waiting for the primary worker to `gunclone`
# them. A finalizer must neither block nor switch tasks — Julia forbids a task
# switch inside a finalizer, and `put!` on a `Channel` waits (yields) whenever
# the channel's lock is held — so `Gen` finalization only pushes the pointer
# here, under a spin lock (which never yields, so finalizers may take it).
# The primary worker frees the queue before each job it runs
# (`_drain_unclones!`). Nothing allocates while the lock is held except the
# `push!` in `_defer_gunclone`, which runs in a finalizer, where the
# collector does not run finalizers again.
const _PENDING_UNCLONES = Ref{Vector{Ptr{Int}}}(Ptr{Int}[])
const _PENDING_LOCK = Threads.SpinLock()
const _PENDING_COUNT = Threads.Atomic{Int}(0)

# The shared job loop: serve `chan` one job at a time. `invokelatest` — the
# worker task's world age is frozen at its creation, but jobs carry closures
# defined later in caller code, which must run in the latest world.
function _serve(chan::Channel{_PariJob}; primary::Bool = false)
    for job in chan
        primary && _drain_unclones!()
        if job.reply === nothing
            try
                Base.invokelatest(job.work)   # fire-and-forget (a `gunclone`)
            catch
            end
        else
            put!(job.reply, try
                (true, Base.invokelatest(job.work))
            catch e
                (false, e)
            end)
        end
    end
    return nothing
end

# The primary worker: it initializes PARI **on its own task** — so `pari_init`
# records this task's C-stack base — then owns the primary context and serves
# its queue.
function _pari_primary_loop(parisize::Integer, chan::Channel{_PariJob})
    try
        _init_libpari!(parisize, _DEFAULT_MAXPRIME)
        _install_error_handlers!()
    finally
        notify(_PARI_READY[])   # release `__init__`, success or not
    end
    _serve(chan; primary = true)
    return nothing
end

# A secondary worker: activate its own PARI context on this OS thread
# (`pari_thread_start`), signal readiness, then serve its queue.
function _pari_secondary_loop(
    pt::Ptr{Cvoid},
    chan::Channel{_PariJob},
    ready::Channel{Bool},
)
    ccall((:pari_thread_start, PARI_jll.libpari), Ptr{Int}, (Ptr{Cvoid},), pt)
    put!(ready, true)
    _serve(chan)
    ccall((:pari_thread_close, PARI_jll.libpari), Cvoid, ())
    return nothing
end

# Allocate a `struct pari_thread` (over-allocated — the real struct is well
# under 512 bytes) and reserve its PARI stack. Called after `pari_init`.
function _pari_thread_alloc(parisize::Integer)
    pt = Libc.malloc(512)
    ccall(:memset, Ptr{Cvoid}, (Ptr{Cvoid}, Cint, Csize_t), pt, 0, 512)
    ccall(
        (:pari_thread_alloc, PARI_jll.libpari),
        Cvoid,
        (Ptr{Cvoid}, Csize_t, Ptr{Int}),
        pt,
        Csize_t(parisize),
        C_NULL,
    )
    return pt
end

# Start the worker pool — one sticky worker per Julia OS thread — and block
# until every worker has its PARI context. Called once, from `__init__`.
function _start_pari_worker_pool!(parisize::Integer)
    _PARI_READY[] = Base.Event()
    maxN = Threads.maxthreadid()
    reqs = Vector{Union{Channel{_PariJob},Nothing}}(nothing, maxN)
    workers = Vector{Union{Task,Nothing}}(nothing, maxN)

    # The primary worker — sticky (`@async`) to the thread `__init__` runs on.
    primary = Threads.threadid()
    _PARI_PRIMARY[] = primary
    reqs[primary] = Channel{_PariJob}(Inf)
    workers[primary] =
        @async _pari_primary_loop(parisize, reqs[primary]::Channel{_PariJob})
    _PARI_REQUESTS[] = reqs
    _PARI_WORKERS[] = workers
    wait(_PARI_READY[])          # PARI is initialized

    # A shim that built and loaded must also catch: check it on the primary
    # context before relying on it for secondary ones.
    if _TRAP_AVAILABLE[] && !_run_on_primary(_trap_selftest)
        _TRAP_AVAILABLE[] = false
        _TRAP_STATUS[] = "loaded, but the self-test error was not caught by it"
    end

    # Discover the default-pool thread ids (a `:static` loop runs iteration
    # i on thread i, so each body sees a distinct real `threadid()`).
    poolids = fill(0, Threads.nthreads())
    Threads.@threads :static for i = 1:Threads.nthreads()
        poolids[i] = Threads.threadid()
    end
    # Secondary contexts need the trap shim. Without it, `pari_err` reaches
    # `mt_err_recover` before LibPARI's fallback callback, and on a context
    # started by `pari_thread_start` — which PARI counts as a worker of its
    # parallel engine — that dereferences PARI's NULL parallel state: any
    # PARI error on a non-primary thread would kill the process. So without
    # the shim no secondary context is started, and every thread's calls
    # fall back to the primary worker (`_worker_slot`): serial, but safe.
    secondary = _TRAP_AVAILABLE[] ? filter(t -> t != primary, poolids) : Int[]

    # Allocate a PARI context for each secondary thread. `pari_thread_alloc`
    # snapshots the *calling* thread's PARI global state, so it MUST run on
    # the primary worker (the only thread with a live context yet).
    pts = Dict{Int,Ptr{Cvoid}}()
    for tid in secondary
        pts[tid] = _run_on_primary(() -> _pari_thread_alloc(parisize))
    end

    # Spawn one sticky secondary worker per secondary thread — pinned by
    # spawning it from inside a `:static` loop body running on that thread.
    ready = Channel{Bool}(Inf)
    Threads.@threads :static for i = 1:Threads.nthreads()
        tid = Threads.threadid()
        if tid in secondary
            ch = Channel{_PariJob}(Inf)
            reqs[tid] = ch
            workers[tid] = @async _pari_secondary_loop(pts[tid], ch, ready)
        end
    end
    for _ in secondary
        take!(ready)             # every secondary context is up
    end
    return nothing
end

# The worker index (into `_PARI_WORKERS` / `_PARI_REQUESTS`) serving the
# given thread: its own worker, or the primary as a fallback (e.g. a call
# from an interactive-pool thread that has no dedicated worker).
@inline function _worker_slot(tid::Integer)
    workers = _PARI_WORKERS[]
    if 1 <= tid <= length(workers) && workers[tid] !== nothing
        return Int(tid)
    end
    return _PARI_PRIMARY[]
end

# Run `f` on the PARI worker for the calling thread and return its result.
# Reached from arbitrary Julia threads; calls from different threads land on
# different workers and run in parallel. Runs `f` directly — no marshalling —
# when there is no pool yet (precompilation, the `__init__` bootstrap) or
# when already executing inside the target worker (a nested libpari call).
# `Base.promote_op` recovers `f`'s concrete return type across the
# marshalling boundary, keeping the binding/conversion surface type-stable.
function _run_on_pari(f::F) where {F}
    isassigned(_PARI_WORKERS) || return f()
    slot = _worker_slot(Threads.threadid())
    worker = _PARI_WORKERS[][slot]
    if worker === nothing || current_task() === worker || istaskdone(worker)
        return f()
    end
    reply = Channel{Tuple{Bool,Any}}(1)
    put!(_PARI_REQUESTS[][slot]::Channel{_PariJob}, _PariJob(f, reply))
    ok, payload = take!(reply)
    ok || throw(payload)
    return payload::Base.promote_op(f)
end

# Enqueue `f` on the calling thread's PARI worker without awaiting a result —
# for `Gen` finalization, which must not block. Runs `f` directly when there
# is no usable worker.
function _enqueue_on_pari(f)
    if !isassigned(_PARI_WORKERS)
        f()
        return nothing
    end
    slot = _worker_slot(Threads.threadid())
    worker = _PARI_WORKERS[][slot]
    if worker === nothing || current_task() === worker || istaskdone(worker)
        f()
    else
        put!(_PARI_REQUESTS[][slot]::Channel{_PariJob}, _PariJob(f, nothing))
    end
    return nothing
end

# Run `f` on the **primary** worker specifically — used for `pari_close`,
# which must run on the context `pari_init` created.
function _run_on_primary(f)
    if !isassigned(_PARI_WORKERS)
        _drain_unclones!()
        return f()
    end
    primary = _PARI_WORKERS[][_PARI_PRIMARY[]]
    if primary === nothing || current_task() === primary || istaskdone(primary)
        _drain_unclones!()
        return f()
    end
    reply = Channel{Tuple{Bool,Any}}(1)
    put!(
        _PARI_REQUESTS[][_PARI_PRIMARY[]]::Channel{_PariJob},
        _PariJob(f, reply),
    )
    ok, payload = take!(reply)
    ok || throw(payload)
    return payload
end

# Queue the clone `ptr` of a finalized `Gen` for the primary worker to
# `gunclone`. Called from finalizers: takes only a spin lock, never blocks,
# never switches tasks. PARI's clone/block list is thread-local; freeing
# every clone on the primary worker (which also makes every `gclone`, via
# `_run_on_primary`) frees each block on the thread that created it.
function _defer_gunclone(ptr::Ptr{Int})
    lock(_PENDING_LOCK)
    try
        push!(_PENDING_UNCLONES[], ptr)
        Threads.atomic_add!(_PENDING_COUNT, 1)
    finally
        unlock(_PENDING_LOCK)
    end
    return nothing
end

# On the primary worker (or with no pool yet): `gunclone` the queued clones.
# The batch is swapped out under the spin lock without allocating in it, and
# freed outside it. After `pari_close` the clones are already gone with PARI's
# memory, so they are dropped rather than freed twice.
function _drain_unclones!()
    _PENDING_COUNT[] == 0 && return nothing
    fresh = Ptr{Int}[]
    lock(_PENDING_LOCK)
    batch = _PENDING_UNCLONES[]
    _PENDING_UNCLONES[] = fresh
    _PENDING_COUNT[] = 0
    unlock(_PENDING_LOCK)
    if library_state() == LibraryState.INITIALIZED
        foreach(_gunclone, batch)
    end
    return nothing
end

# Number of clones queued for freeing (for tests and diagnostics).
_pending_unclones() = _PENDING_COUNT[]
