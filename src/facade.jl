# ---------------------------------------------------------------------------
# The public entry point and a small high-level facade (M14).
# Included by src/LibPARI.jl after precision.jl, before evaluator.jl.
# ---------------------------------------------------------------------------
#
# LibPARI exposes PARI at three levels: the idiomatic Julia surface in this
# file and its neighbours, the ~1200 generated bindings under `LibPARI.PARI`,
# and `gp_eval` for anything neither covers. Only the first is a small,
# stable, hand-reviewed surface — and only four names are exported.
#
# The facade is deliberately tiny. It exists where a wrapper *adds meaning* —
# a Julia return type, a domain check, Julia's own sign convention — never to
# rename a PARI function.

"""
$(TYPEDSIGNATURES)

Convert `x` to a PARI value — the entry point to LibPARI.

`pari` accepts the Julia types listed in [`PariConvertible`](@ref):
integers of any size, rationals, floats (including `BigFloat`, exactly),
and complex numbers of those. A [`Gen`](@ref) is returned unchanged, so
`pari` is cheap to apply defensively and never clones twice.

Anything else raises [`ConversionError`](@ref) naming the type.

# Examples

```jldoctest
julia> using LibPARI

julia> pari(42)
42

julia> pari(3 // 4) + 1
7/4

julia> g = pari(2)^100
1267650600228229401496703205376

julia> pari(g) === g
true
```
"""
pari(x) = gen_convert(x)

# --- Extensions of Base, where the semantics match exactly -----------------
#
# Each of these is `Base.<f>` because PARI's operation *is* Julia's, not
# merely similar. Where PARI's answer differs from Julia's meaning — the
# polynomial domain of `numerator`, PARI's `%` sign convention — the wrapper
# refuses or corrects rather than relay a different meaning under a Julia
# name (REQ-PUB-07).

# Restrict a facade function to the PARI types on which Base's meaning holds.
function _require_type(f::Symbol, g::Gen, allowed::Tuple)
    t = gentype(g)
    t in allowed || throw(
        ArgumentError(
            "$f is not defined for a PARI $t; Base's meaning does not " *
            "carry over. Use the LibPARI.PARI bindings for PARI's own " *
            "answer on this type.",
        ),
    )
    return t
end

"""
$(TYPEDSIGNATURES)

The greatest common divisor, as PARI computes it.

Accepts an integer- or rational-valued [`Gen`](@ref), or any
[`PariConvertible`](@ref) value of those kinds, on either side; returns a
`Gen`. Matches `Base.gcd`, which is defined for `Integer` and `Rational`.

Throws `ArgumentError` on any other PARI type. PARI answers for reals,
complex numbers and polynomials too — `gcd(12, 1.5)` is `1` there — but
those are PARI's domain, not Julia's; reach them as `LibPARI.PARI.ggcd0`.

# Examples

```jldoctest
julia> using LibPARI

julia> gcd(pari(12), 18)
6
```
"""
function Base.gcd(a::Gen, b::Gen)
    _require_type(:gcd, a, (PariType.T_INT, PariType.T_FRAC))
    _require_type(:gcd, b, (PariType.T_INT, PariType.T_FRAC))
    return PARI.ggcd0(a; x2 = b)
end

"""
$(TYPEDSIGNATURES)

The extended greatest common divisor: `(d, u, v)` with `d == u*a + v*b`,
in Julia's argument order.

PARI's `gcdext` returns `[u, v, d]`; this reorders it to match `Base.gcdx`
so the result can be destructured the usual way.

Restricted to integer- and rational-valued arguments, like
[`gcd`](@ref) — PARI computes a Bézout identity over the reals too, which
`Base.gcdx` does not mean.

# Examples

```jldoctest
julia> using LibPARI

julia> d, u, v = gcdx(pari(12), pari(18));

julia> d == u * pari(12) + v * pari(18)
true
```
"""
function Base.gcdx(a::Gen, b::Gen)
    _require_type(:gcdx, a, (PariType.T_INT, PariType.T_FRAC))
    _require_type(:gcdx, b, (PariType.T_INT, PariType.T_FRAC))
    r = PARI.gcdext0(a, b)
    return (PARI.compo(r, 3), PARI.compo(r, 1), PARI.compo(r, 2))
end

"""
$(TYPEDSIGNATURES)

The numerator of an integer or rational `Gen`.

Throws `ArgumentError` for any other PARI type: PARI answers
`denominator(x/2 + 1/3) == 1` in the polynomial domain, which is a
different question from Julia's `numerator`.
"""
function Base.numerator(g::Gen)
    _require_type(:numerator, g, (PariType.T_INT, PariType.T_FRAC))
    return PARI.numerator(g)
end

"""
$(TYPEDSIGNATURES)

The denominator of an integer or rational `Gen`; `1` for an integer.

Throws `ArgumentError` for any other PARI type — see [`numerator`](@ref).
"""
function Base.denominator(g::Gen)
    _require_type(:denominator, g, (PariType.T_INT, PariType.T_FRAC))
    return PARI.denominator(g)
end

"""
$(TYPEDSIGNATURES)

The factorial of a non-negative integer `Gen`, computed by PARI.

Throws `ArgumentError` for a negative or non-integer argument — PARI's own
`mpfact` is not checked for a negative input, so the wrapper validates
first.

# Examples

```jldoctest
julia> using LibPARI

julia> factorial(pari(20))
2432902008176640000
```
"""
function Base.factorial(g::Gen)
    _require_type(:factorial, g, (PariType.T_INT,))
    n = BigInt(g)
    n >= 0 || throw(ArgumentError("factorial is not defined for $n"))
    return PARI.mpfact(n)
end

# Mixed `Gen` / Julia-number methods, declared explicitly rather than left to
# promotion — the facade must not depend on the `Gen <: Number` question.
for f in (:gcd, :gcdx)
    @eval begin
        Base.$f(a::Gen, b::PariConvertible) = $f(a, gen_convert(b))
        Base.$f(a::PariConvertible, b::Gen) = $f(gen_convert(a), b)
    end
end

# --- Number theory (unexported) --------------------------------------------
#
# `isprime` and `factor` are Primes.jl's names, so LibPARI does not export
# them; a hard dependency on Primes.jl is rejected for a wrapper this small.
# Reach them as `LibPARI.isprime`, or add a package extension downstream.

"""
$(TYPEDSIGNATURES)

Whether `n` is prime, as a Julia `Bool`.

Accepts a [`Gen`](@ref) or any [`PariConvertible`](@ref) integer. Uses
PARI's `isprime`, which is a proof, not a probabilistic test.

Not exported: the name belongs to Primes.jl.

# Examples

```jldoctest
julia> using LibPARI

julia> LibPARI.isprime(1009)
true
```
"""
function isprime(n::Gen)
    _require_type(:isprime, n, (PariType.T_INT,))
    return !iszero(PARI.gisprime(n))
end

"""
$(TYPEDSIGNATURES)

The smallest prime `>= n`.

PARI documents this as the next *pseudoprime*; for the sizes reachable here
it is a proven prime.
"""
function nextprime(n::Gen)
    _require_type(:nextprime, n, (PariType.T_INT, PariType.T_REAL))
    return PARI.nextprime(n)
end

"""
$(TYPEDSIGNATURES)

The largest prime `<= n`.
"""
function prevprime(n::Gen)
    _require_type(:prevprime, n, (PariType.T_INT, PariType.T_REAL))
    return PARI.precprime(n)
end

"""
$(TYPEDSIGNATURES)

The factorization of a non-zero integer `Gen`, in PARI's own shape: a
two-column `t_MAT` of primes and exponents.

A negative argument carries the unit `-1` as its first factor, as it does
in Primes.jl. Zero raises `ArgumentError`: it has no factorization, and
PARI's own answer for it (`[0 1]`) does not name a prime.

See [`factors`](@ref) for the Julia shape.
"""
function factor(n::Gen)
    _require_type(:factor, n, (PariType.T_INT,))
    # PARI answers `[0 1]` for zero — "0 to the power 1", which is not a
    # prime factorization at all. Zero has none, so it is refused rather
    # than relayed under a name that promises primes.
    iszero(n) && throw(ArgumentError("0 has no prime factorization"))
    return PARI.factorint(n)
end

"""
$(TYPEDSIGNATURES)

The factorization of an integer as a `Vector{Pair{Gen,Gen}}` of
prime => exponent, in increasing order of prime.

Returns an empty vector for `1`, which has no prime factors. A negative
argument carries `-1 => 1` first. Zero raises `ArgumentError`.

# Examples

```jldoctest
julia> using LibPARI

julia> LibPARI.factors(60)
3-element Vector{Pair{Gen, Gen}}:
 Gen(2) => Gen(2)
 Gen(3) => Gen(1)
 Gen(5) => Gen(1)
```
"""
function factors(n::Gen)
    m = factor(n)
    # A t_MAT is a list of columns: column 1 holds the primes, column 2 the
    # exponents. `compo` reaches a component without exposing a pointer.
    primes = PARI.compo(m, 1)
    exps = PARI.compo(m, 2)
    k = PARI.glength(primes)
    return Pair{Gen,Gen}[
        PARI.compo(primes, i) => PARI.compo(exps, i) for i = 1:k
    ]
end

# The same accepted-input set as everywhere else.
for f in (:isprime, :nextprime, :prevprime, :factor, :factors)
    @eval $f(n::PariConvertible) = $f(gen_convert(n))
end

# --- Modular arithmetic (unexported) ---------------------------------------

"""
$(TYPEDSIGNATURES)

The class of `a` modulo `n` — PARI's `Mod(a, n)`, a `t_INTMOD`.

Use [`lift`](@ref) to recover a representative as a plain integer.

# Examples

```jldoctest
julia> using LibPARI

julia> LibPARI.Mod(5, 7)
Mod(5, 7)
```
"""
function Mod(a::Gen, n::Gen)
    _require_type(:Mod, a, (PariType.T_INT,))
    _require_type(:Mod, n, (PariType.T_INT,))
    iszero(n) && throw(ArgumentError("the modulus must be non-zero"))
    return PARI.gmodulo(a, n)
end

"""
$(TYPEDSIGNATURES)

Lift a `t_INTMOD` (or `t_POLMOD`) to a representative in its base ring.

# Examples

```jldoctest
julia> using LibPARI

julia> LibPARI.lift(LibPARI.Mod(12, 7))
5
```
"""
lift(g::Gen) = PARI.lift0(g)

"""
$(TYPEDSIGNATURES)

`a mod n`, with **Julia's** sign convention: the result takes the sign of
`n`.

PARI's own `%` does not. It always answers in `[0, |n|)`, so
`PARI.gmod(7, -3)` is `1` where `mod(7, -3)` is `-2` in Julia. This
wrapper corrects for that; PARI's operator stays reachable as
`LibPARI.PARI.gmod`.

Restricted to integer-valued arguments, where `Base.mod`'s meaning is the
one being matched.

# Examples

```jldoctest
julia> using LibPARI

julia> LibPARI.pari_mod(7, -3) == mod(7, -3)
true
```
"""
function pari_mod(a::Gen, n::Gen)
    _require_type(:pari_mod, a, (PariType.T_INT,))
    _require_type(:pari_mod, n, (PariType.T_INT,))
    iszero(n) && throw(DivideError())
    r = PARI.gmod(a, n)
    # PARI answers in [0, |n|); Julia wants the sign of `n`.
    return (n < 0 && !iszero(r)) ? r + n : r
end

"""
$(TYPEDSIGNATURES)

`x^p mod m`, matching `Base.powermod`. A negative exponent inverts `x`
modulo `m` first, and raises a `PariError` when it is not invertible.
"""
function Base.powermod(x::Gen, p::Integer, m::Gen)
    _require_type(:powermod, x, (PariType.T_INT,))
    _require_type(:powermod, m, (PariType.T_INT,))
    return lift(Mod(x, m)^p)
end

"""
$(TYPEDSIGNATURES)

The inverse of `x` modulo `m`, matching `Base.invmod`.

Raises a catchable [`PariError`](@ref) when `x` is not invertible modulo
`m` — PARI reports the offending common factor in its message.
"""
function Base.invmod(x::Gen, m::Gen)
    _require_type(:invmod, x, (PariType.T_INT,))
    _require_type(:invmod, m, (PariType.T_INT,))
    return pari_mod(lift(inv(Mod(x, m))), m)
end

# --- Polynomials (unexported) ----------------------------------------------

"""
$(TYPEDSIGNATURES)

The degree of a polynomial `Gen`, as a Julia `Int`.

Raises `DomainError` on the zero polynomial, where PARI answers `-oo`:
there is no `Int` for it, and returning a sentinel would be a trap.
"""
function degree(g::Gen)
    _require_type(:degree, g, (PariType.T_POL, PariType.T_INT, PariType.T_FRAC))
    iszero(g) && throw(DomainError(g, "the zero polynomial has no degree"))
    return Int(BigInt(PARI.gppoldegree(g)))
end

"""
$(TYPEDSIGNATURES)

The coefficient of `x^k` in a polynomial `Gen`, as a `Gen`.
"""
function coeff(g::Gen, k::Integer)
    _require_type(:coeff, g, (PariType.T_POL, PariType.T_INT, PariType.T_FRAC))
    k >= 0 || throw(ArgumentError("the exponent must be non-negative, got $k"))
    return PARI.polcoef(g, k)
end

"""
$(TYPEDSIGNATURES)

Substitute `y` for the main variable of `g`.
"""
function subst(g::Gen, y::Gen)
    _require_type(:subst, g, (PariType.T_POL, PariType.T_RFRAC, PariType.T_SER))
    return PARI.gsubst(g, _mainvar(g), y)
end

# The variable number PARI's `gsubst` expects. `gvar` is not in the
# generated layer — `pari.desc` has no record for it — so it is called
# directly, through the same protected boundary as everything else.
_mainvar(g::Gen) = protected_call() do
    Int(ccall((:gvar, PARI_jll.libpari), Int, (Ptr{Int},), g.ptr))
end

"""
$(TYPEDSIGNATURES)

The complex roots of a polynomial `Gen`, as a `t_COL` of `t_COMPLEX`
values, computed at the current working precision.

The precision follows `setprecision(Gen, bits)` like every other
precision-taking call.
"""
function polroots(g::Gen)
    _require_type(:polroots, g, (PariType.T_POL,))
    return PARI.roots(g)
end

for f in (:lift, :degree, :polroots)
    @eval $f(x::PariConvertible) = $f(gen_convert(x))
end
Mod(a::PariConvertible, n) = Mod(gen_convert(a), gen_convert(n))
Mod(a::Gen, n::PariConvertible) = Mod(a, gen_convert(n))
pari_mod(a::PariConvertible, n) = pari_mod(gen_convert(a), gen_convert(n))
pari_mod(a::Gen, n::PariConvertible) = pari_mod(a, gen_convert(n))
coeff(g::PariConvertible, k::Integer) = coeff(gen_convert(g), k)
subst(g::Gen, y::PariConvertible) = subst(g, gen_convert(y))
# Every mixed method keeps a `Gen` in its signature. An untyped trailing
# argument would make `powermod(::Integer, ::Integer, ::Any)` and
# `invmod(::Integer, ::Any)` methods over Base types only — type piracy,
# which would hijack `invmod(3, 7)` in unrelated code. Aqua catches it.
Base.powermod(x::PariConvertible, p::Integer, m::Gen) =
    powermod(gen_convert(x), p, m)
Base.powermod(x::Gen, p::Integer, m::PariConvertible) =
    powermod(x, p, gen_convert(m))
Base.invmod(x::PariConvertible, m::Gen) = invmod(gen_convert(x), m)
Base.invmod(x::Gen, m::PariConvertible) = invmod(x, gen_convert(m))
