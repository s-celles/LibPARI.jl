# ---------------------------------------------------------------------------
# PARI library lifecycle — initialization, shutdown, and state (milestone M1).
# Included by src/LibPARI.jl.
# ---------------------------------------------------------------------------

"""
Lifecycle states of the embedded PARI library.

`LibraryState.T` is a module-scoped enum with three values:

  - `UNINITIALIZED` — `pari_init` has not (successfully) run
  - `INITIALIZED`   — PARI is ready; a process-exit shutdown is registered
  - `CLOSED`        — `pari_close` has run at process exit
"""
module LibraryState

@enum T UNINITIALIZED INITIALIZED CLOSED

end  # module LibraryState

# Process-global lifecycle state — the single source of truth for the guard.
const _STATE = Ref(LibraryState.UNINITIALIZED)

# Main-stack size, in bytes, passed to `pari_init` (recorded for `stack_size`).
const _STACK_SIZE = Ref(0)

# Default PARI main-stack size in bytes (8 MiB), used when `LIBPARI_STACK_SIZE`
# is not set.
const _DEFAULT_STACK_SIZE = 8 * 1024 * 1024

# Smallest PARI main-stack size the wrapper accepts (1 MiB).
const _MIN_STACK_SIZE = 1024 * 1024

# Precomputed-prime-table limit passed to `pari_init_opts`. Fixed in M1 —
# only the stack size is user-configurable (REQ-INI-04).
const _DEFAULT_MAXPRIME = 500_000

# Option flags for `pari_init_opts`:
#   INIT_JMPm   (1)  — install PARI's error-recovery longjmp
#   INIT_DFTm   (4)  — initialize PARI's default parameters
#   INIT_noIMTm (16) — do NOT start PARI's pthread multithreading engine
# INIT_SIGm (2) is deliberately omitted so PARI does NOT install its own
# signal handlers — those would clobber Julia's runtime signal handling
# (Julia uses SIGSEGV for GC safepoints). INIT_noIMTm keeps PARI
# single-threaded: M1 uses no PARI parallelism, and PARI's pthread engine
# can conflict with the Julia runtime. See research.md D10.
const _INIT_OPTS = 0x1 | 0x4 | 0x10

# Environment variable that configures the PARI main-stack size, in bytes.
const STACK_SIZE_ENV = "LIBPARI_STACK_SIZE"

"""
Validate a candidate PARI main-stack size `n` (bytes) and return it as an
`Int`. Throw `ArgumentError` when `n` is below the 1 MiB minimum.
"""
function _validate_parisize(n::Integer)
    n >= _MIN_STACK_SIZE || throw(
        ArgumentError(
            "PARI stack size must be an integer of at least " *
            "$(_MIN_STACK_SIZE) bytes, got $(n)",
        ),
    )
    return Int(n)
end

"""
Return the PARI main-stack size (bytes) for this process: the value of the
`LIBPARI_STACK_SIZE` environment variable when set, otherwise the 8 MiB
default. Throw `ArgumentError` when the variable holds an invalid value.
"""
function _configured_stack_size()
    haskey(ENV, STACK_SIZE_ENV) || return _DEFAULT_STACK_SIZE
    raw = strip(ENV[STACK_SIZE_ENV])
    n = tryparse(Int, raw)
    n === nothing && throw(
        ArgumentError(
            "$(STACK_SIZE_ENV)=\"$(raw)\" is not a valid integer byte count",
        ),
    )
    return _validate_parisize(n)
end

"""
Release PARI's resources by calling `pari_close`, but only while the library
is `INITIALIZED`. Idempotent — a second invocation is a no-op. Registered with
`atexit` so it runs once at process exit (REQ-INI-05).
"""
function _close_libpari!()
    if _STATE[] == LibraryState.INITIALIZED
        # Mark CLOSED first: any `Gen` finalizer that runs during shutdown
        # then skips its `gunclone` (no marshalling into a winding-down
        # runtime).
        _STATE[] = LibraryState.CLOSED
        # `pari_close` is invoked only when the primary is the sole PARI
        # context (single-threaded Julia — the milestone-M1 path). With
        # secondary worker contexts live, calling `pari_close` during
        # Julia's own shutdown segfaults; the operating system reclaims
        # every context and stack at process exit regardless, so it is
        # skipped then.
        nworkers =
            isassigned(_PARI_WORKERS) ? count(!isnothing, _PARI_WORKERS[]) : 0
        if nworkers <= 1
            _run_on_primary(
                () -> ccall((:pari_close, PARI_jll.libpari), Cvoid, ()),
            )
        end
    end
    return nothing
end

"""
Initialize the PARI library for this process.

Initializes PARI exactly once: when the library is not `UNINITIALIZED` this
is a no-op (the guard for REQ-INI-02 / REQ-INI-06). `parisize` is validated
first; an invalid value throws before PARI is initialized, leaving the state
`UNINITIALIZED` (REQ-INI-07). On success the state becomes `INITIALIZED`, the
size is recorded, and `pari_close` is registered to run at process exit.

Uses `pari_init_opts` (not plain `pari_init`) with `INIT_SIGm` cleared, so
PARI leaves Julia's signal handlers intact (research.md D10), and pins
`nbthreads` to 1 afterwards — see [`_pin_nbthreads!`](@ref).
"""
function _init_libpari!(parisize::Integer, maxprime::Integer)
    _STATE[] == LibraryState.UNINITIALIZED || return nothing
    size = _validate_parisize(parisize)
    # Bootstrap: this runs on the thread that becomes the PARI-owning thread
    # (the worker is started just after, sticky to it) — no marshalling.
    ccall(
        (:pari_init_opts, PARI_jll.libpari),
        Cvoid,
        (Csize_t, UInt, UInt),
        size,
        maxprime,
        _INIT_OPTS,
    )
    _pin_nbthreads!()
    _STACK_SIZE[] = size
    _STATE[] = LibraryState.INITIALIZED
    atexit(_close_libpari!)
    return nothing
end

# The value `nbthreads` is pinned to. 1 means "no parallel dispatch", which is
# what `INIT_noIMTm` already intends; 0, which is what PARI is left holding
# otherwise, means nothing coherent at all.
const _NBTHREADS = 1

"""
Pin PARI's `nbthreads` to 1, immediately after `pari_init_opts`.

`_INIT_OPTS` sets `INIT_noIMTm`, so PARI's pthread engine never starts. That
is deliberate — LibPARI parallelises at the Julia level, one PARI context per
OS thread, and PARI's own pthreads would conflict with the Julia runtime.

But `INIT_noIMTm` alone leaves `nbthreads` at **0**, and PARI's parallel code
paths do not read 0 as "serial": they dispatch into a worker pool that was
never created, and dereference it. `qflll` reaches one of them
(`ZM_flatter` → `FpM_ratlift_parallel`) on a large structured lattice, and the
result is a `SIGSEGV` — not a PARI error, so [`protected_call`](@ref) never
sees it, so it is not catchable and the process dies.

`gp` itself never holds 0, because it always starts the engine, so
`INIT_noIMTm` + `nbthreads == 0` is a combination PARI does not exercise.

Set through `sd_nbthreads`, PARI's own setter for the `nbthreads` default,
which is declared in `paridecl.h` — not by writing the `pari_mt_nbthreads`
global directly.
"""
function _pin_nbthreads!()
    ccall(
        (:sd_nbthreads, PARI_jll.libpari),
        Cstring,
        (Cstring, Cint),
        string(_NBTHREADS),
        0,                 # d_SILENT: set it, print nothing
    )
    return nothing
end

"""
$(TYPEDSIGNATURES)

PARI's `nbthreads` — the number of threads its own parallel dispatch will use.

LibPARI pins this to 1 at initialization: PARI's threading engine is
deliberately not started (`INIT_noIMTm`), and the value PARI is otherwise left
holding, 0, makes its parallel code paths crash. See [`_pin_nbthreads!`](@ref).

# Examples

```jldoctest
julia> using LibPARI

julia> LibPARI.nbthreads()
1
```
"""
function nbthreads()
    return Int(BigInt(gp_eval("default(nbthreads)")))
end

"""
$(TYPEDSIGNATURES)

Return `true` when the PARI library has been successfully initialized in this
process and not yet closed.

# Examples

```jldoctest
julia> using LibPARI

julia> LibPARI.is_initialized()
true
```
"""
is_initialized() = _STATE[] === LibraryState.INITIALIZED

"""
$(TYPEDSIGNATURES)

Return the current lifecycle state of the PARI library as a `LibraryState.T`
value (`UNINITIALIZED`, `INITIALIZED`, or `CLOSED`).

# Examples

```jldoctest
julia> using LibPARI

julia> LibPARI.library_state() === LibPARI.LibraryState.INITIALIZED
true
```
"""
library_state() = _STATE[]

"""
$(TYPEDSIGNATURES)

Return the size, in bytes, of PARI's main stack — the value passed to
`pari_init` for this process (the 8 MiB default, or a `LIBPARI_STACK_SIZE`
override). Returns `0` before initialization.

# Examples

```jldoctest
julia> using LibPARI

julia> LibPARI.stack_size() isa Integer
true

julia> LibPARI.stack_size() >= 1024 * 1024
true
```
"""
stack_size() = _STACK_SIZE[]
