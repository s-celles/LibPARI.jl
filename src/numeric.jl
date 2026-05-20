# ---------------------------------------------------------------------------
# Idiomatic numeric API — `Gen` as a Julia `Number` (M6).
# Included by src/LibPARI.jl after conversions.jl, before bindings.jl.
# ---------------------------------------------------------------------------

# Default word precision supplied to PARI's general power `gpow` (used only
# for an inexact power, e.g. a non-integer exponent).
const _DEFAULT_PREC = Clong(4)

# Run a GEN-producing PARI computation: error-safe (`protected_call`) and
# leak-free (`gen_from` clones the result and restores the PARI stack).
_genresult(producer) = protected_call(() -> gen_from(producer))

# --- Arithmetic operators --------------------------------------------------

Base.:+(a::Gen, b::Gen) = _genresult(
    () -> ccall(
        (:gadd, PARI_jll.libpari),
        Ptr{Clong},
        (Ptr{Clong}, Ptr{Clong}),
        a.ptr,
        b.ptr,
    ),
)

Base.:-(a::Gen, b::Gen) = _genresult(
    () -> ccall(
        (:gsub, PARI_jll.libpari),
        Ptr{Clong},
        (Ptr{Clong}, Ptr{Clong}),
        a.ptr,
        b.ptr,
    ),
)

Base.:*(a::Gen, b::Gen) = _genresult(
    () -> ccall(
        (:gmul, PARI_jll.libpari),
        Ptr{Clong},
        (Ptr{Clong}, Ptr{Clong}),
        a.ptr,
        b.ptr,
    ),
)

Base.:/(a::Gen, b::Gen) = _genresult(
    () -> ccall(
        (:gdiv, PARI_jll.libpari),
        Ptr{Clong},
        (Ptr{Clong}, Ptr{Clong}),
        a.ptr,
        b.ptr,
    ),
)

Base.:-(a::Gen) = _genresult(
    () ->
        ccall((:gneg, PARI_jll.libpari), Ptr{Clong}, (Ptr{Clong},), a.ptr),
)

# --- Exponentiation --------------------------------------------------------

# `Gen ^ Integer`: PARI's `gpowgs` (exact, handles negative/zero exponents)
# for a word-sized exponent; an out-of-word exponent goes via `Gen ^ Gen`.
function Base.:^(a::Gen, n::Integer)
    if typemin(Clong) <= n <= typemax(Clong)
        return _genresult(
            () -> ccall(
                (:gpowgs, PARI_jll.libpari),
                Ptr{Clong},
                (Ptr{Clong}, Clong),
                a.ptr,
                n % Clong,
            ),
        )
    end
    return a^Gen(n)
end

# `Gen ^ Gen`: PARI's general power `gpow`, supplying the default precision.
Base.:^(a::Gen, b::Gen) = _genresult(
    () -> ccall(
        (:gpow, PARI_jll.libpari),
        Ptr{Clong},
        (Ptr{Clong}, Ptr{Clong}, Clong),
        a.ptr,
        b.ptr,
        _DEFAULT_PREC,
    ),
)

# Route a literal power (`g^2`, `g^0`, `g^-1`) through PARI rather than
# Base's power-by-squaring / `one` / `inv` fallbacks.
Base.literal_pow(::typeof(^), a::Gen, ::Val{p}) where {p} = a^p

# --- Non-integer Gen construction (extends M5's integer-only conversions) ---

"""
$(TYPEDSIGNATURES)

Convert a Julia floating-point number to a `Gen` (a PARI real value).

# Examples

```jldoctest
julia> using LibPARI

julia> LibPARI.Gen(1.5) isa LibPARI.Gen
true
```
"""
Gen(x::AbstractFloat) = protected_call(
    () -> gen_from(
        () -> ccall(
            (:dbltor, PARI_jll.libpari),
            Ptr{Clong},
            (Cdouble,),
            Cdouble(x),
        ),
    ),
)

"""
$(TYPEDSIGNATURES)

Convert a Julia `Rational` to a `Gen` (a reduced PARI rational value).

# Examples

```jldoctest
julia> using LibPARI

julia> LibPARI.Gen(3 // 4) isa LibPARI.Gen
true
```
"""
Gen(x::Rational) = Gen(numerator(x)) / Gen(denominator(x))

# --- Promotion: mixed Gen / Julia-number expressions -----------------------

# With `Gen <: Number`, Base's generic `op(::Number, ::Number)` dispatches a
# mixed expression through `promote`; these two rules make that land on the
# `Gen`/`Gen` operators above.
Base.promote_rule(::Type{Gen}, ::Type{<:Number}) = Gen

Base.convert(::Type{Gen}, x::Number) = Gen(x)

# --- Equality --------------------------------------------------------------

# `==` returns PARI's own mathematical-equality result (`gequal`) as a Bool.
# Mixed `Gen`/number `==` reaches here through the promotion above; `!=`
# follows automatically from `==`.
Base.:(==)(a::Gen, b::Gen) = protected_call(
    () ->
        ccall(
            (:gequal, PARI_jll.libpari),
            Clong,
            (Ptr{Clong}, Ptr{Clong}),
            a.ptr,
            b.ptr,
        ) != 0,
)
