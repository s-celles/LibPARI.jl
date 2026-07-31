# ---------------------------------------------------------------------------
# Type conversions — Julia integers ↔ `Gen`, and textual representation (M5).
# Included by src/LibPARI.jl after errors.jl, before bindings.jl.
# ---------------------------------------------------------------------------

# --- Textual representation (PARI's GENtostr) ------------------------------

# Render a raw PARI `GEN` pointer to a Julia `String` via PARI's own
# `GENtostr`. `GENtostr` returns a heap-allocated C string the caller owns; it
# is copied into a Julia `String` and the C buffer freed with `pari_free`.
function _genstr(ptr::Ptr{Int})
    s = ccall((:GENtostr, PARI_jll.libpari), Cstring, (Ptr{Int},), ptr)
    s == C_NULL && return "GEN"
    str = unsafe_string(s)
    ccall((:pari_free, PARI_jll.libpari), Cvoid, (Cstring,), s)
    return str
end

# Render a `Gen` to its PARI textual representation. The capture/restore of
# `avma` discards any transient PARI-stack use; `protected_call` keeps the
# Julia/C boundary error-safe.
function _genrepr(g::Gen)
    return protected_call() do
        av = _avma()
        str = _genstr(g.ptr)
        _set_avma(av)
        return str
    end
end

# --- Julia integer → Gen ---------------------------------------------------

# Build a raw integer-valued `GEN` from a Julia `Integer`, on the PARI stack.
# Word-sized values use `stoi`/`utoi`; larger magnitudes are parsed from their
# base-10 digit string with `strtoi` (digits only — `strtoi` ignores a sign,
# so a negative value is negated afterwards with `gneg`).
function _integer_to_gen(x::Integer)
    # Routed through the concurrency-safe error trap (feature 014): these
    # PARI primitives can raise `e_STACK` on a pathological magnitude.
    z = Int(0)
    if typemin(Int) <= x <= typemax(Int)
        return _trap_call(
            Ptr{Int},
            cglobal((:stoi, PARI_jll.libpari)),
            1,
            Int(x % Int),
            z,
            z,
            z,
            z,
            z,
            z,
            z,
        )
    elseif 0 <= x <= typemax(UInt)
        return _trap_call(
            Ptr{Int},
            cglobal((:utoi, PARI_jll.libpari)),
            1,
            reinterpret(Int, x % UInt),
            z,
            z,
            z,
            z,
            z,
            z,
            z,
        )
    end
    s = string(x)
    negative = startswith(s, '-')
    digits = negative ? s[2:end] : s
    cs = Base.cconvert(Cstring, digits)
    t = GC.@preserve cs _trap_call(
        Ptr{Int},
        cglobal((:strtoi, PARI_jll.libpari)),
        1,
        reinterpret(Int, Base.unsafe_convert(Cstring, cs)),
        z,
        z,
        z,
        z,
        z,
        z,
        z,
    )
    return negative ?
           _trap_call(
        Ptr{Int},
        cglobal((:gneg, PARI_jll.libpari)),
        1,
        reinterpret(Int, t),
        z,
        z,
        z,
        z,
        z,
        z,
        z,
    ) : t
end

"""
$(TYPEDSIGNATURES)

Convert a Julia `Integer` of any magnitude to an integer-valued `Gen` (a PARI
`t_INT`).

# Examples

```jldoctest
julia> using LibPARI

julia> LibPARI.Gen(42) isa LibPARI.Gen
true
```
"""
Gen(x::Integer) = protected_call(() -> gen_from(() -> _integer_to_gen(x)))

Base.convert(::Type{Gen}, x::Integer) = Gen(x)

# --- The accepted-input set and the one conversion entry point (M12) --------

"""
$(TYPEDEF)

The Julia types LibPARI guarantees it can convert to a [`Gen`](@ref).

`PariConvertible` is an *enumerated* set, deliberately not `Number`: a rule
that accepted every `Number` would promise conversions LibPARI cannot
perform, and the failure would surface far from the call that caused it.

Support a further type by adding a method to [`gen_convert`](@ref) — that is
a method on your own type, so it is not type piracy on either side.
"""
const PariConvertible = Union{Integer,AbstractFloat,Rational,Complex}

"""
$(TYPEDEF)

Raised when a value cannot be converted to a [`Gen`](@ref).

Carries the offending type and the reason, and names
[`gen_convert`](@ref) — the extension point — rather than surfacing as a
`MethodError` inside a Base function the caller never invoked.
"""
struct ConversionError <: Exception
    type::Type
    reason::String
end

function Base.showerror(io::IO, e::ConversionError)
    print(
        io,
        "ConversionError: cannot convert a value of type ",
        e.type,
        " to a LibPARI.Gen: ",
        e.reason,
        "\nLibPARI converts an Integer, AbstractFloat, Rational or Complex; ",
        "add a `LibPARI.gen_convert(::",
        e.type,
        ")` method to support this type.",
    )
    return nothing
end

"""
$(TYPEDSIGNATURES)

Convert `x` to a [`Gen`](@ref) — the single conversion entry point.

Every hand-written conversion, every mixed-operand arithmetic method and
every `convert(Gen, x)` funnels through here, so one type is converted in
exactly one way. A `Gen` argument is returned unchanged, never re-cloned.

A value outside [`PariConvertible`](@ref), or one whose conversion fails,
raises a [`ConversionError`](@ref) naming the type — never a `MethodError`
from inside a Base function the caller did not invoke.

# Examples

```jldoctest
julia> using LibPARI

julia> LibPARI.gen_convert(42) == LibPARI.Gen(42)
true
```
"""
gen_convert(g::Gen) = g

function gen_convert(x::PariConvertible)
    try
        return Gen(x)
    catch e
        # A `Gen` constructor exists for the abstract type but failed on this
        # concrete one — a foreign `AbstractFloat` with no `BigFloat` route,
        # say. Report it at the boundary instead of leaking a Base MethodError.
        e isa MethodError || rethrow(e)
        throw(ConversionError(typeof(x), "no LibPARI conversion for this type"))
    end
end

gen_convert(x) =
    throw(ConversionError(typeof(x), "not one of the convertible Julia types"))

# `Irrational` is a `Number` with no exact PARI value: converting it needs a
# working precision, which LibPARI will not pick silently. Refuse it here so
# the message names the type (M13 may offer an explicit-precision route).
gen_convert(x::Irrational) = throw(
    ConversionError(
        typeof(x),
        "an irrational has no exact PARI value; it needs an explicit " *
        "precision — use LibPARI.gp_eval or a PARI constant such as " *
        "LibPARI.PARI.mppi",
    ),
)

Gen(x::Irrational) = gen_convert(x)

Base.convert(::Type{Gen}, x::Irrational) = gen_convert(x)

# --- Gen integer → Julia ---------------------------------------------------

"""
$(TYPEDSIGNATURES)

Convert an integer-valued `Gen` to an exact Julia `BigInt`.

Throws `InexactError` when `g` is not an integer — a fraction, a real with a
fractional part, or a non-numeric value.

# Examples

```jldoctest
julia> using LibPARI

julia> BigInt(LibPARI.Gen(-123456789))
-123456789
```
"""
function Base.BigInt(g::Gen)
    return protected_call() do
        out = Ref{Ptr{Int}}(C_NULL)
        av = _avma()
        flag = ccall(
            (:isint, PARI_jll.libpari),
            Int,
            (Ptr{Int}, Ref{Ptr{Int}}),
            g.ptr,
            out,
        )
        if flag == 0
            _set_avma(av)
            throw(InexactError(:BigInt, BigInt, g))
        end
        str = _genstr(out[])
        _set_avma(av)
        return parse(BigInt, str)
    end
end

# --- Gen integer → fixed-width Julia integer -------------------------------

"""
$(TYPEDSIGNATURES)

Convert an integer-valued `Gen` to a fixed-width Julia integer type `T`.

`T` is one of Julia's built-in integer types (`Base.BitInteger`), `BigInt`
or `Bool` — the set LibPARI can validate. A third-party `Integer` subtype
still works, through `T(BigInt(g))`, but warns: LibPARI cannot check that
its construction from a `BigInt` is exact (REQ-PROM-09).

Throws `InexactError` when `g` is not an integer, or when its value lies
outside the range of `T`.

# Examples

```jldoctest
julia> using LibPARI

julia> Int(LibPARI.Gen(255))
255
```
"""
(::Type{T})(g::Gen) where {T<:Base.BitInteger} = T(BigInt(g))

Base.Bool(g::Gen) = Bool(BigInt(g))

Base.Integer(g::Gen) = BigInt(g)

# A third-party `Integer`: the semantics are unchanged for a well-behaved
# `T`, so this stays rather than breaking downstream code — but LibPARI is
# not promising it, hence the warning (REQ-PROM-09).
function (::Type{T})(g::Gen) where {T<:Integer}
    @warn "LibPARI does not validate conversion of a Gen to $T; the result \
           goes through BigInt" maxlog = 1
    return T(BigInt(g))
end

Base.convert(::Type{T}, g::Gen) where {T<:Integer} = T(g)

# --- t_REAL → Julia floating point -----------------------------------------

# Decompose a PARI `t_REAL` with PARI's own `mantissa_real`: it returns the
# mantissa as a `t_INT` `m` and sets `e` so that the value is exactly
# `m * 2^-e`. This replaces `parse(Float64, _genrepr(g))`, which was not
# merely lossy but broken — PARI prints a space before the exponent, so every
# real large or small enough to be printed with one raised `ArgumentError`
# (REQ-TYPE-08, a REQ-CONV-04 violation).
function _real_mantissa(g::Gen)
    e = Ref{Clong}(0)
    m = protected_call(
        () -> gen_from(
            () -> ccall(
                (:mantissa_real, PARI_jll.libpari),
                Ptr{Int},
                (Ptr{Int}, Ref{Clong}),
                g.ptr,
                e,
            ),
        ),
    )
    return (BigInt(m), Int(e[]))
end

# A `t_REAL` as an exact `BigFloat`: the working precision is widened to hold
# PARI's mantissa in full, so the only rounding is the caller's. Choosing the
# output precision explicitly is M13's job (REQ-PREC-07, REQ-PREC-09).
#
# The widening must wrap the *whole* computation, not just the `BigFloat(m)`
# constructor: `ldexp` allocates its result at the ambient default precision,
# so scaling outside the scope would silently round a wide mantissa back down.
function _real_to_bigfloat(g::Gen)
    m, e = _real_mantissa(g)
    p = max(precision(BigFloat), ndigits(m; base = 2))
    return setprecision(BigFloat, p) do
        ldexp(BigFloat(m), -e)
    end
end

# --- Gen → Julia rational / floating-point / complex -----------------------

"""
$(TYPEDSIGNATURES)

Convert a rational- or integer-valued `Gen` to a Julia `Rational{BigInt}`.

Throws `InexactError` when `g` is not a rational number.
"""
function Base.Rational(g::Gen)
    return BigInt(PARI.numerator(g)) // BigInt(PARI.denominator(g))
end

"""
$(TYPEDSIGNATURES)

Convert a rational- or integer-valued `Gen` to a `Rational{T}`.

Throws `InexactError` when `g` is not rational, or when its numerator or
denominator lies outside the range of `T` (REQ-PROM-08).
"""
Base.Rational{T}(g::Gen) where {T<:Integer} = Rational{T}(Rational(g))

"""
$(TYPEDSIGNATURES)

Convert a real-valued `Gen` to a Julia `Float64`.

A PARI real too large for `Float64` converts to `±Inf`, as any other Julia
floating-point conversion would.

Throws `InexactError` when `g` is not a real number (a complex value, a
polynomial, a vector, …).
"""
function Base.Float64(g::Gen)
    t = gentype(g)
    if t === PariType.T_INT
        return Float64(BigInt(g))
    elseif t === PariType.T_FRAC
        return Float64(Rational(g))
    elseif t === PariType.T_REAL
        return Float64(_real_to_bigfloat(g))
    else
        throw(InexactError(:Float64, Float64, g))
    end
end

Base.AbstractFloat(g::Gen) = Float64(g)

"""
$(TYPEDSIGNATURES)

Convert a real-valued `Gen` to a narrower Julia float — `Float16` or
`Float32`.

The value is read at full PARI precision and rounded once to `F`
(REQ-PROM-08).
"""
Base.Float32(g::Gen) = Float32(_narrow_float(g))

Base.Float16(g::Gen) = Float16(_narrow_float(g))

# A `t_INT` or `t_FRAC` is exact, so it narrows directly; a `t_REAL` goes
# through its full-precision `BigFloat`, so the narrowing rounds exactly once.
function _narrow_float(g::Gen)
    t = gentype(g)
    if t === PariType.T_INT
        return BigFloat(BigInt(g))
    elseif t === PariType.T_FRAC
        return BigFloat(Rational(g))
    elseif t === PariType.T_REAL
        return _real_to_bigfloat(g)
    else
        throw(InexactError(:AbstractFloat, AbstractFloat, g))
    end
end

"""
$(TYPEDSIGNATURES)

Convert a real-valued `Gen` to a Julia `BigFloat`.

With no `precision` keyword a `t_REAL` converts **exactly**: the result
carries PARI's own mantissa, at whatever precision that takes — which may
exceed the ambient `precision(BigFloat)`. Pass `precision` to round once to
a chosen width instead (REQ-PREC-07).

Throws `InexactError` when `g` is not a real number.

# Examples

```jldoctest
julia> using LibPARI

julia> precision(BigFloat(LibPARI.Gen(1.5); precision = 256))
256
```
"""
function Base.BigFloat(g::Gen; precision::Union{Nothing,Integer} = nothing)
    t = gentype(g)
    value = if t === PariType.T_INT
        BigFloat(BigInt(g))
    elseif t === PariType.T_FRAC
        BigFloat(Rational(g))
    elseif t === PariType.T_REAL
        _real_to_bigfloat(g)
    else
        throw(InexactError(:BigFloat, BigFloat, g))
    end
    precision === nothing && return value
    return setprecision(() -> BigFloat(value), BigFloat, precision)
end

"""
$(TYPEDSIGNATURES)

Convert a numeric `Gen` to a Julia `Complex{Float64}` — the real and
imaginary parts of `g` as `Float64`s.
"""
Base.Complex(g::Gen) = Complex(Float64(real(g)), Float64(imag(g)))

"""
$(TYPEDSIGNATURES)

Convert a numeric `Gen` to a `Complex{T}` — its real and imaginary parts
each converted to `T` (REQ-PROM-08).
"""
Base.Complex{T}(g::Gen) where {T<:Real} = Complex{T}(T(real(g)), T(imag(g)))

# --- Display ---------------------------------------------------------------

# A `Gen` shows, prints, and interpolates as PARI's own textual rendering.
Base.show(io::IO, g::Gen) = print(io, _genrepr(g))

Base.print(io::IO, g::Gen) = print(io, _genrepr(g))
