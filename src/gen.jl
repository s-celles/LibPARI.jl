# ---------------------------------------------------------------------------
# `Gen` — the PARI object wrapper — and PARI stack memory management (M2).
# Included by src/LibPARI.jl.
# ---------------------------------------------------------------------------

# --- Low-level libpari memory primitives -----------------------------------

# Clone a GEN off PARI's transient stack into its persistent storage.
_gclone(x::Ptr{Int}) =
    ccall((:gclone, PARI_jll.libpari), Ptr{Int}, (Ptr{Int},), x)

# Free a cloned GEN.
_gunclone(x::Ptr{Int}) =
    ccall((:gunclone, PARI_jll.libpari), Cvoid, (Ptr{Int},), x)

# Read PARI's transient-stack pointer `avma`. `avma` is a thread-local
# variable, so it MUST be read through PARI's `get_avma` function — each
# worker then reads its own context's `avma`. (Reading it via `cglobal`
# would resolve one fixed address and corrupt every secondary context.)
_avma() = ccall((:get_avma, PARI_jll.libpari), UInt, ())

# Restore PARI's transient-stack pointer to `av`.
_set_avma(av::UInt) = ccall((:set_avma, PARI_jll.libpari), Cvoid, (UInt,), av)

# --- The `Gen` value type --------------------------------------------------

"""
$(TYPEDEF)

The supertype of every PARI object LibPARI exposes to Julia.

`PariObject` exists so that `Gen` can name what it is. A `Gen` wraps *any*
PARI `GEN` — an integer, a real, a matrix, a string, a closure — so it cannot
honestly be a Julia `Number` (REQ-TYPE-01). Julia code that must accept a
PARI object generically dispatches on `PariObject`.

# Examples

```jldoctest
julia> using LibPARI

julia> LibPARI.Gen <: LibPARI.PariObject
true
```
"""
abstract type PariObject end

"""
$(TYPEDEF)

A Julia value wrapping one PARI object (a PARI `GEN`).

`Gen` is a concrete, mutable type. Each `Gen` owns a private clone of its PARI
object in PARI's persistent storage; a garbage-collection finalizer frees that
clone exactly once. Every PARI object that LibPARI exposes to Julia is a
`Gen`.

`Gen` is a [`PariObject`](@ref), **not** a Julia `Number`: one concrete `Gen`
wraps every PARI type, matrices, strings and closures included, so a `Number`
supertype would be a false claim (REQ-TYPE-01). The arithmetic, equality and
ordering that Base's `Number` fallbacks used to supply are declared
explicitly on `Gen` instead — see `src/numeric.jl`.

# Examples

```jldoctest
julia> using LibPARI

julia> isconcretetype(LibPARI.Gen)
true
```
"""
mutable struct Gen <: PariObject
    ptr::Ptr{Int}

    function Gen(raw::Ptr{Int})
        raw == C_NULL && throw(ArgumentError("cannot wrap a null GEN"))
        # `gclone` splices PARI's process-global clone list — run it on the
        # primary worker so the list is only ever touched by one thread.
        # `raw` lives on the producing worker's stack, which stays stable
        # (that worker is blocked awaiting this result).
        cloned = _run_on_primary(() -> _gclone(raw))::Ptr{Int}
        g = new(cloned)
        finalizer(_finalize!, g)
        return g
    end
end

# Idempotent finalizer: free the clone at most once (REQ-MEM-06).
#
# The clone is freed only while PARI is `INITIALIZED`. At process exit the
# `pari_close` atexit hook (M1) may already have released all of PARI's
# memory — every clone included — so a `gunclone` afterwards would be a
# double free. Skipping it then leaks nothing: `pari_close` already freed it.
function _finalize!(g::Gen)
    if g.ptr != C_NULL
        if library_state() == LibraryState.INITIALIZED
            ptr = g.ptr
            # `gunclone` splices the process-global clone list — funnel it
            # to the primary worker, the single thread that owns the list.
            _enqueue_on_primary(() -> _gunclone(ptr))
        end
        g.ptr = C_NULL
    end
    return nothing
end

"""
Build a `Gen` from `producer`, a function that returns a raw PARI `GEN`
computed on the transient stack.

`gen_from` captures PARI's stack pointer, runs `producer`, clones the result
into persistent storage, restores the stack pointer, and returns the `Gen`.
This capture → produce → clone → restore discipline keeps the PARI stack
leak-free (REQ-MEM-03, REQ-MEM-05); it is the pattern every generated binding
(M4) will reuse.

# Examples

```jldoctest
julia> using LibPARI

julia> LibPARI.gen_from isa Function
true
```
"""
function gen_from(producer)
    return _run_on_pari() do
        av = _avma()
        raw = producer()::Ptr{Int}
        g = Gen(raw)        # the constructor clones `raw`
        _set_avma(av)       # discard the transient stack
        return g
    end::Gen
end

# --- PARI value types ------------------------------------------------------

"""
Module-scoped enum of PARI's value types — the `t_*` type tags.

`PariType.T` has one value per PARI object type (`T_INT`, `T_REAL`, `T_POL`,
`T_VEC`, …). Each value's integer equals PARI's own `t_*` constant, so a type
tag read from a `GEN` converts directly to `PariType.T`. See `gentype`.
"""
module PariType

@enum T begin
    T_INT = 1
    T_REAL = 2
    T_INTMOD = 3
    T_FRAC = 4
    T_FFELT = 5
    T_COMPLEX = 6
    T_PADIC = 7
    T_QUAD = 8
    T_POLMOD = 9
    T_POL = 10
    T_SER = 11
    T_RFRAC = 13
    T_QFB = 15
    T_VEC = 17
    T_COL = 18
    T_MAT = 19
    T_LIST = 20
    T_STR = 21
    T_VECSMALL = 22
    T_CLOSURE = 23
    T_ERROR = 24
    T_INFINITY = 25
end

end  # module PariType

# Bit position of the PARI type tag within a GEN's first machine word
# (BITS_IN_LONG − TYPnumBITS; TYPnumBITS = 7).
const _TYPSHIFT = 8 * sizeof(UInt) - 7

"""
$(TYPEDSIGNATURES)

Return the PARI value type of `g` as a `PariType.T` — `T_INT`, `T_REAL`,
`T_POL`, `T_VEC`, and so on.

# Examples

```jldoctest
julia> using LibPARI

julia> LibPARI.gentype isa Function
true
```
"""
function gentype(g::Gen)
    word = unsafe_load(Ptr{UInt}(g.ptr))
    return PariType.T(word >> _TYPSHIFT)
end
