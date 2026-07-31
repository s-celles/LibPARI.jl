# ---------------------------------------------------------------------------
# Idiomatic numeric API — the arithmetic surface of `Gen` (M6, M11).
# Included by src/LibPARI.jl after conversions.jl, before bindings.jl.
#
# `Gen` is a `PariObject`, not a Julia `Number` (REQ-TYPE-01), so nothing here
# is inherited: every mixed `Gen`/Julia-number operation Base used to supply
# through `Number` promotion is declared explicitly below.
# ---------------------------------------------------------------------------

# Default word precision supplied to PARI's general power `gpow` (used only
# for an inexact power, e.g. a non-integer exponent).
const _DEFAULT_PREC = Int(4)

# Run a GEN-producing PARI computation: error-safe (`protected_call`) and
# leak-free (`gen_from` clones the result and restores the PARI stack).
_genresult(producer) = protected_call(() -> gen_from(producer))

# --- Arithmetic operators --------------------------------------------------

Base.:+(a::Gen, b::Gen) = _genresult(
    () -> ccall(
        (:gadd, PARI_jll.libpari),
        Ptr{Int},
        (Ptr{Int}, Ptr{Int}),
        a.ptr,
        b.ptr,
    ),
)

Base.:-(a::Gen, b::Gen) = _genresult(
    () -> ccall(
        (:gsub, PARI_jll.libpari),
        Ptr{Int},
        (Ptr{Int}, Ptr{Int}),
        a.ptr,
        b.ptr,
    ),
)

Base.:*(a::Gen, b::Gen) = _genresult(
    () -> ccall(
        (:gmul, PARI_jll.libpari),
        Ptr{Int},
        (Ptr{Int}, Ptr{Int}),
        a.ptr,
        b.ptr,
    ),
)

Base.:/(a::Gen, b::Gen) = _genresult(
    () -> ccall(
        (:gdiv, PARI_jll.libpari),
        Ptr{Int},
        (Ptr{Int}, Ptr{Int}),
        a.ptr,
        b.ptr,
    ),
)

Base.:-(a::Gen) = _genresult(
    () -> ccall((:gneg, PARI_jll.libpari), Ptr{Int}, (Ptr{Int},), a.ptr),
)

# Unary `+` and left division `\` were Base `Number` fallbacks; they are
# re-declared on `Gen` (REQ-TYPE-06).
Base.:+(a::Gen) = a

# `a \ b` is `a⁻¹·b`. For a scalar that is `b / a`, which is what Base's
# `Number` fallback computed — but PARI's `gdiv` is `b·a⁻¹`, so on a `t_MAT`
# the fallback silently answered the *right* division. A matrix left-hand
# operand therefore goes through PARI's linear solver `gauss`.
Base.:\(a::Gen, b::Gen) =
    gentype(a) === PariType.T_MAT ? PARI.gauss(a, b) : b / a

# --- Exponentiation --------------------------------------------------------

# `Gen ^ Integer`: PARI's `gpowgs` (exact, handles negative/zero exponents)
# for a word-sized exponent; an out-of-word exponent goes via `Gen ^ Gen`.
function Base.:^(a::Gen, n::Integer)
    if typemin(Int) <= n <= typemax(Int)
        return _genresult(
            () -> ccall(
                (:gpowgs, PARI_jll.libpari),
                Ptr{Int},
                (Ptr{Int}, Int),
                a.ptr,
                n % Int,
            ),
        )
    end
    return a^Gen(n)
end

# `Gen ^ Gen`: PARI's general power `gpow`, supplying the default precision.
Base.:^(a::Gen, b::Gen) = _genresult(
    () -> ccall(
        (:gpow, PARI_jll.libpari),
        Ptr{Int},
        (Ptr{Int}, Ptr{Int}, Int),
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

`Inf`, `-Inf` and `NaN` have no PARI real counterpart and raise
`InexactError` — PARI's `t_INFINITY` exists but does not take part in
general arithmetic, so mapping onto it would produce values that fail
later, far from this call (REQ-PROM-10).

!!! warning "Precision"
    This conversion currently routes through `Cdouble`, so a `BigFloat`
    argument is silently reduced to 53 bits. Fixing that is M13
    (REQ-PREC-08); until then, `BigFloat(Gen(x)) == x` holds only for a
    value representable in double precision.

# Examples

```jldoctest
julia> using LibPARI

julia> LibPARI.Gen(1.5) isa LibPARI.Gen
true
```
"""
function Gen(x::AbstractFloat)
    isfinite(x) || throw(InexactError(:Gen, Gen, x))
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

# --- Equality --------------------------------------------------------------

# `==` returns PARI's own mathematical-equality result (`gequal`) as a Bool.
# The mixed `Gen`/number methods are generated below; `!=` follows
# automatically from `==`.
Base.:(==)(a::Gen, b::Gen) = protected_call(
    () ->
        ccall(
            (:gequal, PARI_jll.libpari),
            Int,
            (Ptr{Int}, Ptr{Int}),
            a.ptr,
            b.ptr,
        ) != 0,
)

# --- Complex Gen construction (extends M5/M6's conversions) -----------------

"""
$(TYPEDSIGNATURES)

Convert a Julia `Complex` number to a `Gen` (a PARI complex value).

# Examples

```jldoctest
julia> using LibPARI

julia> LibPARI.Gen(3 + 4im) isa LibPARI.Gen
true
```
"""
Gen(z::Complex) = Gen(real(z)) + Gen(imag(z)) * gp_eval("I")

# --- Identity elements -----------------------------------------------------

# `zero`/`one` (type and instance) — generic algorithms that need identity
# elements (`sum`, `prod`, powering, matrix routines) accept `Gen`.
Base.zero(::Type{Gen}) = Gen(0)
Base.one(::Type{Gen}) = Gen(1)
Base.oneunit(::Type{Gen}) = Gen(1)
Base.zero(::Gen) = Gen(0)
Base.one(::Gen) = Gen(1)
Base.oneunit(::Gen) = Gen(1)

# --- Ordering --------------------------------------------------------------

# `gsigne(a - b)` is the sign of `a - b`. PARI raises a catchable `PariError`
# when the values are not comparable (a complex value, a polynomial, …).
# `>` / `>=` and `!=` follow automatically from `<` / `<=` and `==`.
Base.:<(a::Gen, b::Gen) = PARI.gsigne(a - b) < 0
Base.:<=(a::Gen, b::Gen) = PARI.gsigne(a - b) <= 0

# `isless` is the ordering `sort` uses; it must exist wherever `<` does, or
# `sort(Any[Gen(2), 1])` raises a `MethodError` (REQ-TYPE-04).
Base.isless(a::Gen, b::Gen) = a < b

# --- Mixed Gen / Julia-number operands -------------------------------------

# The mixed matrix dispatches on `PariConvertible` (src/conversions.jl) — the
# public, enumerated accepted-input set — and converts through the single
# `gen_convert` entry point (REQ-PROM-01, REQ-PROM-05). It is deliberately not
# `Number`: with `Gen <: PariObject` there is no Base fallback behind it, so an
# operand LibPARI cannot build a `Gen` from must fail at dispatch rather than
# recurse through `promote`/`convert` into a `StackOverflowError`
# (REQ-TYPE-07).

# One table generates the whole mixed matrix (REQ-TYPE-02/03/04). Each method
# builds a `Gen` from the Julia operand and calls the `Gen`/`Gen` operator
# above, so `g + 1` and `g + Gen(1)` are the same PARI call. `^(::Gen,
# ::Integer)` above stays more specific than the generated `^` and keeps its
# exact `gpowgs` path.
for op in (:+, :-, :*, :/, :^, :\, :(==), :<, :<=, :isless)
    @eval begin
        Base.$op(a::Gen, b::PariConvertible) = $op(a, gen_convert(b))
        Base.$op(a::PariConvertible, b::Gen) = $op(gen_convert(a), b)
    end
end

# A `Number` outside the enumerated set must not reach Base's
# `==(x, y) = x === y`, which would answer `false` — a wrong answer rather
# than an error, and one `isequal`/`Dict` inherit silently. The arithmetic
# operators need no such guard: they have no `Number` fallback and already
# raise a `MethodError`. M12 replaces this with `ConversionError`
# (REQ-PROM-03).
_no_gen(x) = throw(
    ArgumentError(
        "cannot compare a Gen with a $(typeof(x)): LibPARI builds a Gen " *
        "from an Integer, AbstractFloat, Rational or Complex only",
    ),
)

Base.:(==)(::Gen, b::Number) = _no_gen(b)
Base.:(==)(a::Number, ::Gen) = _no_gen(a)

# `promote_rule`/`convert` survive, narrowed from `Number` to the same
# enumerated set. They are no longer load-bearing for arithmetic — the table
# above dispatches directly — but they are what types an array literal
# (`[Gen(1), 2]::Vector{Gen}`) and a `Vector{Gen}` assignment. Narrowing is
# what breaks the `Gen(1) + π` cycle: the blanket `convert(::Type{Gen},
# ::Number) = Gen(x)` promised a conversion for every `Number`, including
# ones with no `Gen` constructor. M12 revisits both (REQ-PROM-05).
Base.promote_rule(::Type{Gen}, ::Type{<:PariConvertible}) = Gen

Base.convert(::Type{Gen}, x::PariConvertible) = gen_convert(x)

# --- Base conveniences no longer inherited from `Number` -------------------

# A `Gen` broadcasts as a scalar. Base's `broadcastable` whitelists `Number`;
# without this method the generic fallback is `collect(g)`, which a
# non-iterable `Gen` cannot satisfy (REQ-TYPE-05).
Base.broadcastable(g::Gen) = Ref(g)

# Re-implemented `Number` conveniences (REQ-TYPE-06). `float` keeps Base's
# meaning — the nearest Julia floating-point value.
#
# These must NOT assume a `Gen` is a scalar — that assumption is exactly what
# M11 withdraws. The `Number` fallbacks they replace were silently wrong for a
# container: `transpose` returned the matrix unchanged, `adjoint` conjugated
# without transposing, and `a \ b` computed `b·a⁻¹` instead of `a⁻¹·b`. Each
# one therefore dispatches on the runtime PARI type.
#
# Deliberately *not* re-implemented, and therefore a documented loss: the
# `Number` fallbacks for `widen`, `signbit`, `flipsign`/`copysign`,
# `divrem`/`fld`/`cld`, `fma`, `angle`, `complex(x)`, `first`/`in`,
# `size`/`ndims`
# /`length`/`iterate` on a scalar, and `Number`-bounded generic algorithms
# (`T<:Number` methods in LinearAlgebra and other packages) no longer accept
# a `Gen`. Use the `LibPARI.PARI` bindings, or convert to a Julia number.
# (`cmp` and `muladd` keep working: Base defines them generically, over
# `isless` and over `*`/`+`, not over `Number`.)

# The PARI types for which the linear-algebra reading applies.
_iscontainer(g::Gen) =
    gentype(g) in (PariType.T_VEC, PariType.T_COL, PariType.T_MAT)

Base.float(g::Gen) = Float64(g)

# `abs2` is PARI's `gnorm` — `x^2` for a real, `re^2 + im^2` for a complex
# value. On a container `gnorm` is elementwise, which is neither Base's scalar
# `abs2` nor a norm, so a container is refused rather than answered wrongly.
function Base.abs2(g::Gen)
    _iscontainer(g) && throw(
        ArgumentError(
            "abs2 is not defined for a PARI $(gentype(g)); use " *
            "LibPARI.PARI.gnorml2 for the squared L2 norm",
        ),
    )
    return PARI.gnorm(g)
end

# `transpose` is PARI's `gtrans` for a container (a `t_VEC` transposes to a
# `t_COL`), the identity for a scalar.
Base.transpose(g::Gen) = _iscontainer(g) ? PARI.gtrans(g) : g

# `adjoint` is the conjugate transpose; on a scalar that is just `conj`.
Base.adjoint(g::Gen) = _iscontainer(g) ? conj(PARI.gtrans(g)) : conj(g)

# --- Hashing ---------------------------------------------------------------

# Hash by the `Gen`'s canonical Julia value, so a `Gen` and an equal Julia
# number hash equal — they are interchangeable as `Dict`/`Set` keys, which
# Julia's `a == b => hash(a) == hash(b)` invariant requires.
#
# `hash` is total over every PARI type (REQ-TYPE-09). A `t_REAL` goes through
# `BigFloat`, not `Float64`: the `Float64` route threw on a real outside the
# double range, which made such a `Gen` unusable as a key at all. Julia hashes
# equal `Real`s alike, so the `BigInt`/`Rational`/`BigFloat` routes agree with
# each other and with the equal Julia number.
function Base.hash(g::Gen, h::UInt)
    t = gentype(g)
    if t === PariType.T_INT
        return hash(BigInt(g), h)
    elseif t === PariType.T_FRAC
        return hash(Rational(g), h)
    elseif t === PariType.T_REAL
        return hash(BigFloat(g), h)
    else
        return hash(_genrepr(g), h)
    end
end

# --- Predicates ------------------------------------------------------------

# Every predicate returns a `Bool` for any `Gen`, including a non-number
# PARI type — never throws.
Base.iszero(g::Gen) = g == Gen(0)
Base.isone(g::Gen) = g == Gen(1)
Base.isinteger(g::Gen) = gentype(g) === PariType.T_INT
Base.isfinite(g::Gen) = gentype(g) !== PariType.T_INFINITY
Base.isinf(g::Gen) = gentype(g) === PariType.T_INFINITY
Base.isnan(::Gen) = false
Base.isreal(g::Gen) =
    gentype(g) in (PariType.T_INT, PariType.T_REAL, PariType.T_FRAC)

# --- Elementary operations -------------------------------------------------

# Thin wrappers over PARI bindings. An operation that does not apply to a
# `Gen`'s PARI type (e.g. `sign` of a complex value) raises a catchable
# `PariError`.
Base.abs(g::Gen) = PARI.gabs(g)
Base.sign(g::Gen) = Gen(PARI.gsigne(g))
Base.inv(g::Gen) = PARI.ginv(g)
Base.conj(g::Gen) = PARI.gconj(g)
Base.real(g::Gen) = PARI.greal(g)
Base.imag(g::Gen) = PARI.gimag(g)
