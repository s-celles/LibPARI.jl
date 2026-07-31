# ---------------------------------------------------------------------------
# Working precision — a bit-based API over PARI's real arithmetic (M13).
# Included by src/LibPARI.jl after numeric.jl, before evaluator.jl.
# ---------------------------------------------------------------------------
#
# UNITS. PARI 2.17's `p` and `b` prototype arguments are **bit** counts, not
# word counts: `pariinl.h` defines `prec2nbits(long x) { return x; }`. PARI
# then allocates
#
#     nbits2prec(x) = ceil(x / BITS_IN_LONG) * BITS_IN_LONG
#
# bits — the requested count rounded up to a whole number of machine words
# (`pariinl.h:1634`). So a request for 4 bits, which is what the generator's
# historical `prec = 4` asked for, yields PARI's 64-bit minimum. The old
# comment calling it "word precision" was wrong, and the value was not a
# deliberate choice.
#
# LibPARI therefore speaks bits everywhere on its own surface, and converts
# only at the `ccall` boundary.

# PARI's word size in bits, `BITS_IN_LONG`. PARI redefines `long` to
# `long long` on Windows 64-bit, so the PARI word is pointer-sized on every
# platform LibPARI supports — which is what `Int` measures.
const _BITS_IN_LONG = 8 * sizeof(Int)

"""
$(TYPEDSIGNATURES)

Round a request of `bits` up to the precision PARI will actually allocate —
a whole number of machine words.

This mirrors PARI's own `nbits2prec`.

# Examples

```jldoctest
julia> using LibPARI

julia> LibPARI.nbits2prec(65)
128
```
"""
nbits2prec(bits::Integer) =
    Int(cld(max(Int(bits), 1), _BITS_IN_LONG) * _BITS_IN_LONG)

# --- The default working precision and its scope ---------------------------

# GP's own default `realbitprecision` is 128 bits (≈ 38 decimal digits, the
# width PARI prints by default). LibPARI matches it so that the same
# expression gives the same answer in `gp` and in LibPARI — the least
# surprising choice for a wrapper. Tracking `precision(BigFloat)` (256) was
# the alternative; it would have made LibPARI disagree with the library it
# wraps. Override per call site with `setprecision(Gen, bits)`.
const _DEFAULT_PRECISION_BITS = 128

# The scope is **task-local**. On the Julia 1.10 LTS floor there is no
# `Base.ScopedValues`, so a scope nests and unwinds correctly but is NOT
# inherited by a task spawned inside it — a documented limitation, pinned by
# a test, to revisit when the compat floor reaches 1.11.
const _PRECISION_KEY = :libpari_precision_bits

"""
$(TYPEDSIGNATURES)

The working precision LibPARI supplies to PARI, **in bits**, when a caller
does not give one.

Defaults to 128 bits — GP's own `realbitprecision` default — so that an
expression evaluates to the same thing in `gp` and in LibPARI. Change it for
a dynamic extent with `setprecision(Gen, bits)`.

# Examples

```jldoctest
julia> using LibPARI

julia> LibPARI.default_precision()
128
```
"""
default_precision() = _DEFAULT_PRECISION_BITS

"""
$(TYPEDSIGNATURES)

The working precision in force for the current task, in bits.

Equal to [`default_precision`](@ref) outside any
`setprecision(Gen, bits)` scope.

# Examples

```jldoctest
julia> using LibPARI

julia> precision(LibPARI.Gen) == LibPARI.default_precision()
true
```
"""
Base.precision(::Type{Gen}) =
    get(task_local_storage(), _PRECISION_KEY, default_precision())::Int

"""
$(TYPEDSIGNATURES)

Run `f` with LibPARI's working precision set to `bits`, then restore it.

Scopes nest, and unwind even when `f` throws. The setting is **task-local**:
the calls `f` makes are marshalled onto LibPARI's PARI worker tasks, and the
precision is read in the *calling* task and carried across that boundary —
but a task spawned inside the scope does not inherit it (Julia 1.10 has no
`ScopedValues`).

The scope governs the calls LibPARI itself makes. It does **not** reach into
the GP interpreter: [`gp_eval`](@ref) follows PARI's process-global
`realprecision`.

# Examples

```jldoctest
julia> using LibPARI

julia> setprecision(LibPARI.Gen, 256) do
           precision(LibPARI.Gen)
       end
256
```
"""
function Base.setprecision(f::Function, ::Type{Gen}, bits::Integer)
    bits > 0 || throw(ArgumentError("precision must be positive, got $bits"))
    store = task_local_storage()
    had = haskey(store, _PRECISION_KEY)
    old = get(store, _PRECISION_KEY, 0)
    store[_PRECISION_KEY] = Int(bits)
    try
        return f()
    finally
        had ? (store[_PRECISION_KEY] = old) : delete!(store, _PRECISION_KEY)
    end
end

# --- Precision of a value --------------------------------------------------

"""
$(TYPEDSIGNATURES)

Whether `g` is an exact PARI value — an integer, a rational, or any other
type PARI stores without a working precision.

# Examples

```jldoctest
julia> using LibPARI

julia> LibPARI.isexact(LibPARI.Gen(42))
true
```
"""
isexact(g::Gen) = gentype(g) !== PariType.T_REAL

"""
$(TYPEDSIGNATURES)

The accuracy of a real `Gen`, in bits.

PARI stores a `t_REAL` to a whole number of machine words, so the answer is
a multiple of the word size. An **exact** `Gen` has no finite precision and
raises `ArgumentError` rather than returning an invented number — test with
[`isexact`](@ref) first.

# Examples

```jldoctest
julia> using LibPARI

julia> precision(LibPARI.Gen(1.5)) >= 64
true
```
"""
function Base.precision(g::Gen)
    isexact(g) && throw(
        ArgumentError(
            "a PARI $(gentype(g)) is exact and has no working precision; " *
            "use LibPARI.isexact to test for this",
        ),
    )
    # A `t_REAL`'s length lives in the low `LGnumBITS` of its first word:
    # `lg(z)` counts the two header words plus the mantissa words, so the
    # accuracy is `(lg(z) - 2) * BITS_IN_LONG` bits (PARI's `bit_accuracy`).
    word = unsafe_load(Ptr{UInt}(g.ptr))
    lg = Int(word & _LGBITS)
    return (lg - 2) * _BITS_IN_LONG
end

# Mask of the length field in a GEN's first word: everything below the type
# tag and the sign/valp bits — PARI's `LGBITS`, `LGnumBITS = BITS_IN_LONG -
# 1 - TYPnumBITS` wide, with `TYPnumBITS = 7` (mirrors `_TYPSHIFT` in
# src/gen.jl).
const _LGBITS = (UInt(1) << (_BITS_IN_LONG - 1 - 7)) - 1

# --- Precision-preserving Julia float → Gen --------------------------------

# Build a `t_REAL` of `bits` bits from an integer-valued `Gen`, through
# PARI's `gtofp`.
_int_to_real(g::Gen, bits::Integer) = _genresult(
    () -> ccall(
        (:gtofp, PARI_jll.libpari),
        Ptr{Int},
        (Ptr{Int}, Int),
        g.ptr,
        nbits2prec(bits),
    ),
)

"""
$(TYPEDSIGNATURES)

Convert a Julia floating-point number to a `Gen` (a PARI `t_REAL`),
preserving the value exactly.

An `IEEEFloat` (`Float16`, `Float32`, `Float64`) goes through PARI's
`dbltor`, which is exact. Any wider float — a `BigFloat`, or a third-party
`AbstractFloat` — is decomposed into its exact integer significand and
binary exponent and rebuilt at a precision that holds every bit, so nothing
passes through `Cdouble` (REQ-PREC-08).

`Inf`, `-Inf` and `NaN` raise `InexactError`: PARI's `t_INFINITY` does not
take part in general arithmetic (REQ-PROM-10).

# Examples

```jldoctest
julia> using LibPARI

julia> BigFloat(LibPARI.Gen(big"1.00000000000000000000000000000001")) ==
           big"1.00000000000000000000000000000001"
true
```
"""
function Gen(x::AbstractFloat)
    isfinite(x) || throw(InexactError(:Gen, Gen, x))
    if x isa Base.IEEEFloat
        # Exact: every IEEE float is representable in PARI's 64-bit minimum.
        return protected_call(
            () -> gen_from(
                () -> ccall(
                    (:dbltor, PARI_jll.libpari),
                    Ptr{Int},
                    (Cdouble,),
                    Cdouble(x),
                ),
            ),
        )
    end
    return _wide_float_to_gen(BigFloat(x; precision = precision(x)))
end

# `x` is exactly `n * 2^-k` with `n` an integer of `precision(x)` bits:
# scaling by a power of two is exact, so the integer round-trip loses
# nothing. The `t_REAL` is then built at the source's own precision and
# scaled back with `gmul2n`, which is again an exact binary shift.
function _wide_float_to_gen(x::BigFloat)
    iszero(x) && return Gen(0.0)
    p = precision(x)
    k = p - 1 - exponent(x)
    # `ldexp` allocates its result at the AMBIENT default precision, not at
    # `x`'s — so scaling outside this scope silently truncates a significand
    # wider than the default, which is the very defect this path exists to
    # fix. The scope must wrap the scaling, not just a constructor.
    n = setprecision(BigFloat, p) do
        BigInt(ldexp(x, k))
    end
    return PARI.gmul2n(_int_to_real(Gen(n), p), -k)
end

# --- PARI's process-global precision ---------------------------------------

"""
$(TYPEDSIGNATURES)

Set PARI's **process-global** working precision, in bits — the default the
GP interpreter reads.

This is the setting [`gp_eval`](@ref) follows; the
`setprecision(Gen, bits)` scope deliberately does not touch it. Unlike that
scope it is global and shared by every thread and task in the process, so
prefer the scope unless you specifically need to change what GP itself
does.

Returns the requested `bits`.

This replaces the 47 zero-argument `sd_*` bindings the generator used to
emit for PARI's `Class: default` records. Those called C functions declared
`(const char *, long)` with no arguments set, which is undefined behaviour;
they are no longer generated (REQ-PREC-13).

# Examples

```jldoctest
julia> using LibPARI

julia> old = LibPARI.set_global_precision!(256);

julia> precision(LibPARI.gp_eval("Pi")) >= 256
true

julia> LibPARI.set_global_precision!(old);  # always restore: it is global

```
"""
function set_global_precision!(bits::Integer)
    bits > 0 || throw(ArgumentError("precision must be positive, got \$bits"))
    previous = precision(gp_eval("Pi"))
    protected_call() do
        av = _avma()
        key = Base.cconvert(Cstring, "realbitprecision")
        val = Base.cconvert(Cstring, string(Int(bits)))
        GC.@preserve key val ccall(
            (:default0, PARI_jll.libpari),
            Ptr{Int},
            (Cstring, Cstring),
            Base.unsafe_convert(Cstring, key),
            Base.unsafe_convert(Cstring, val),
        )
        _set_avma(av)
        return nothing
    end
    return previous
end
