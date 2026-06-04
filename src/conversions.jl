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

Throws `InexactError` when `g` is not an integer, or when its value lies
outside the range of `T`.

# Examples

```jldoctest
julia> using LibPARI

julia> Int(LibPARI.Gen(255))
255
```
"""
(::Type{T})(g::Gen) where {T<:Integer} = T(BigInt(g))

Base.convert(::Type{T}, g::Gen) where {T<:Integer} = T(g)

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

Convert a real-valued `Gen` to a Julia `Float64`.

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
        return parse(Float64, _genrepr(g))
    else
        throw(InexactError(:Float64, Float64, g))
    end
end

Base.AbstractFloat(g::Gen) = Float64(g)

"""
$(TYPEDSIGNATURES)

Convert a real-valued `Gen` to a Julia `BigFloat`.

Throws `InexactError` when `g` is not a real number.
"""
function Base.BigFloat(g::Gen)
    t = gentype(g)
    if t === PariType.T_INT
        return BigFloat(BigInt(g))
    elseif t === PariType.T_FRAC
        return BigFloat(Rational(g))
    elseif t === PariType.T_REAL
        return parse(BigFloat, _genrepr(g))
    else
        throw(InexactError(:BigFloat, BigFloat, g))
    end
end

"""
$(TYPEDSIGNATURES)

Convert a numeric `Gen` to a Julia `Complex{Float64}` — the real and
imaginary parts of `g` as `Float64`s.
"""
Base.Complex(g::Gen) = Complex(Float64(real(g)), Float64(imag(g)))

# --- Display ---------------------------------------------------------------

# A `Gen` shows, prints, and interpolates as PARI's own textual rendering.
Base.show(io::IO, g::Gen) = print(io, _genrepr(g))

Base.print(io::IO, g::Gen) = print(io, _genrepr(g))
