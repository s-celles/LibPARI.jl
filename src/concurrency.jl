# ---------------------------------------------------------------------------
# Concurrency — every libpari call runs on one dedicated thread (M9).
# Included first by src/LibPARI.jl.
# ---------------------------------------------------------------------------
#
# PARI's working state (`avma`, the main stack) is thread-local, and PARI's
# recursion-depth check is tied to the C-stack base recorded by `pari_init`.
# A libpari call is therefore valid only on the task/thread where `pari_init`
# ran. To make LibPARI safe under multi-threaded Julia, a single sticky
# **worker task** initializes PARI on itself and then owns it: every libpari
# call is marshalled to that worker and awaits its result. The worker runs
# jobs one at a time, so libpari is also serialized.

# A unit of libpari work for the worker. `reply === nothing` is
# fire-and-forget (used by `Gen` finalization, which must not block);
# otherwise the worker delivers `(true, result)` or `(false, exception)` on
# `reply`.
struct _PariJob
    work::Function
    reply::Union{Channel{Tuple{Bool,Any}},Nothing}
end

# The worker's job queue, the worker task, and the "PARI is up" signal. The
# queue and the signal are mutable synchronization primitives, so they are
# created fresh in `__init__` (see `_start_pari_worker!`) — never at module
# definition time, which would bake a stale object into the precompile image.
const _PARI_REQUESTS = Ref{Channel{_PariJob}}()
const _PARI_WORKER = Ref{Union{Task,Nothing}}(nothing)
const _PARI_READY = Ref{Base.Event}()

# The worker loop. It first initializes PARI **on its own task** — so
# `pari_init` records this task's C-stack base and PARI's recursion-depth
# check is correct for every later libpari call, which also runs here — then
# serves jobs from the queue one at a time.
function _pari_worker_loop(parisize::Integer)
    try
        _init_libpari!(parisize, _DEFAULT_MAXPRIME)
        _install_error_handlers!()
    finally
        notify(_PARI_READY[])    # release `__init__`, success or not
    end
    for job in _PARI_REQUESTS[]
        # `invokelatest`: the worker task's world age is frozen at its
        # creation (`__init__`), but jobs carry closures defined later, in
        # caller code — they must be invoked in the latest world.
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

# Start the PARI worker — a task sticky (`@async`) to the current thread —
# and block until it has initialized PARI. Called once, from `__init__`.
function _start_pari_worker!(parisize::Integer)
    _PARI_REQUESTS[] = Channel{_PariJob}(Inf)
    _PARI_READY[] = Base.Event()
    _PARI_WORKER[] = @async _pari_worker_loop(parisize)
    wait(_PARI_READY[])
    return nothing
end

# Run `f` on the PARI worker thread and return its result. Reached from
# arbitrary Julia threads. Runs `f` directly — no marshalling — when there is
# no worker yet (precompilation, the `__init__` bootstrap) or when already
# executing inside the worker (a nested libpari call). `Base.promote_op`
# recovers `f`'s concrete return type across the marshalling boundary, so the
# whole binding/conversion surface stays type-stable (milestone M8).
function _run_on_pari(f::F) where {F}
    worker = _PARI_WORKER[]
    if worker === nothing || current_task() === worker || istaskdone(worker)
        return f()
    end
    reply = Channel{Tuple{Bool,Any}}(1)
    put!(_PARI_REQUESTS[], _PariJob(f, reply))
    ok, payload = take!(reply)
    ok || throw(payload)
    return payload::Base.promote_op(f)
end

# Enqueue `f` on the PARI worker without awaiting a result — for `Gen`
# finalization, which must not block. Runs `f` directly when there is no
# usable worker.
function _enqueue_on_pari(f)
    worker = _PARI_WORKER[]
    if worker === nothing || current_task() === worker || istaskdone(worker)
        f()
    else
        put!(_PARI_REQUESTS[], _PariJob(f, nothing))
    end
    return nothing
end
