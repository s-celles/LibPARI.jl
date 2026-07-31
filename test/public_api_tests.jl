# M14 — `pari(x)`, the exported surface, and a small facade
# (REQ-PUB-01 … REQ-PUB-13).
#
# The exported surface is deliberately tiny and locked by a test: adding a
# name to it is a breaking change for every `using LibPARI`, so it must not
# happen by accident.

@testitem "REQ-PUB-04: the exported surface is exactly four names" begin
    using LibPARI

    # `names(m)` is NOT the export list: since Julia 1.11 it also reports
    # names marked `public`, which `using` does not bring in. Only
    # `Base.isexported` answers the question that matters here — what lands
    # unqualified in a caller's namespace, and therefore what can collide
    # with another package.
    exported = filter(
        n -> n !== :LibPARI && Base.isexported(LibPARI, n),
        names(LibPARI),
    )
    @test Set(exported) == Set([:Gen, :pari, :gp_eval, :PariError])
    @test length(exported) == 4

    # The generated layer must never leak into the top-level namespace, and
    # neither may the names that belong to other packages.
    @test !Base.isexported(LibPARI, :nextprime)
    @test !Base.isexported(LibPARI, :isprime)
    @test !Base.isexported(LibPARI, :factor)
    @test !Base.isexported(LibPARI, :PARI)

    # They are still supported, and marked so where the language can say it.
    if VERSION >= v"1.11"
        @test Base.ispublic(LibPARI, :PARI)
        @test Base.ispublic(LibPARI, :gentype)
        @test Base.ispublic(LibPARI, :factors)
    end

    # `using LibPARI` really does bring them in unqualified.
    @test pari isa Function
    @test Gen isa Type
    @test PariError <: Exception
    @test gp_eval isa Function
end

@testitem "REQ-PUB-01: pari(x) converts every documented input" begin
    using LibPARI

    @test pari(42) == Gen(42)
    @test pari(big"123456789012345678901234567890") ==
          Gen(big"123456789012345678901234567890")
    @test pari(3 // 4) == Gen(3 // 4)
    @test pari(1.25) == Gen(1.25)
    @test pari(big"1.234567890123456789") == Gen(big"1.234567890123456789")
    @test pari(3 + 4im) == Gen(3 + 4im)

    for x in (42, big(42), 3 // 4, 1.25, big"1.25", 3 + 4im, Float32(1.5), true)
        @test (@inferred pari(x)) isa Gen
    end

    # The failure mode is the M12 one — one contract, one error.
    @test_throws LibPARI.ConversionError pari(π)
    @test_throws LibPARI.ConversionError pari("41")
end

@testitem "REQ-PUB-02: pari(::Gen) returns the argument, never a clone" begin
    using LibPARI

    g = pari(42)
    @test pari(g) === g
    # Identity, so no second PARI clone and no second finalizer.
    @test pari(pari(g)) === g
    @test convert(Gen, g) === g
end

@testitem "REQ-PUB-03: a complex Gen is built without the GP parser" begin
    using LibPARI

    z = pari(3 + 4im)
    @test LibPARI.gentype(z) === LibPARI.PariType.T_COMPLEX
    @test real(z) == 3
    @test imag(z) == 4
    @test Complex(z) == 3 + 4im

    # Exact component types survive — no float round trip.
    @test LibPARI.gentype(pari(Complex(1 // 2, 1 // 3))) ===
          LibPARI.PariType.T_COMPLEX
    @test pari(Complex(1 // 2, 1 // 3)) == Gen(1 // 2) + Gen(1 // 3) * pari(im)

    # PARI normalises a zero imaginary part, so the tag is NOT preserved —
    # the value is. This is the documented limit of the contract.
    @test LibPARI.gentype(pari(Complex(1, 0))) === LibPARI.PariType.T_INT
    @test pari(Complex(1, 0)) == 1
end

@testitem "REQ-PUB-06: the Base extensions match Base's semantics" begin
    using LibPARI

    a, b = pari(12), pari(18)

    @test gcd(a, b) == 6
    @test gcd(a, 18) == 6
    @test gcd(12, b) == 6
    @test gcd(pari(0), pari(0)) == 0

    # Julia's gcdx returns (d, u, v) with d == u*a + v*b.
    d, u, v = gcdx(a, b)
    @test d == 6
    @test u * a + v * b == d
    @test (d, u, v) == gcdx(a, 18)

    @test numerator(pari(3 // 4)) == 3
    @test denominator(pari(3 // 4)) == 4
    @test numerator(pari(5)) == 5
    @test denominator(pari(5)) == 1

    @test factorial(pari(10)) == 3628800
    @test factorial(pari(30)) == factorial(big(30))
end

@testitem "REQ-PUB-07: the facade refuses what Base cannot mean" begin
    using LibPARI

    # PARI answers `denominator(x/2 + 1/3) == 1` for a polynomial: a domain
    # answer with no Base meaning. The wrapper refuses rather than relay it.
    p = gp_eval("x/2 + 1/3")
    @test_throws ArgumentError numerator(p)
    @test_throws ArgumentError denominator(p)

    # `factorial` is only defined on a non-negative integer.
    @test_throws ArgumentError factorial(pari(-1))
    @test_throws ArgumentError factorial(pari(3 // 4))
    @test_throws ArgumentError factorial(pari(1.5))
end

@testitem "REQ-PUB-08: the unexported number-theory facade" begin
    using LibPARI

    # Not exported: `isprime` and `factor` are Primes.jl's names, so a
    # `using LibPARI` next to a `using Primes` must not collide.
    @test !Base.isexported(LibPARI, :isprime)
    @test !Base.isexported(LibPARI, :factor)

    @test LibPARI.isprime(pari(1009)) === true
    @test LibPARI.isprime(pari(1000)) === false
    @test LibPARI.isprime(1009) === true

    @test LibPARI.nextprime(pari(1000)) == 1009
    @test LibPARI.nextprime(1000) == 1009
    @test LibPARI.prevprime(1000) == 997

    # `factor` returns PARI's own 2-column t_MAT; `factors` is the Julia
    # shape.
    f = LibPARI.factor(pari(60))
    @test LibPARI.gentype(f) === LibPARI.PariType.T_MAT

    fs = LibPARI.factors(60)
    @test fs isa Vector{Pair{Gen,Gen}}
    @test length(fs) == 3
    @test first.(fs) == [pari(2), pari(3), pari(5)]
    @test last.(fs) == [pari(2), pari(1), pari(1)]
    @test prod(p^BigInt(e) for (p, e) in fs) == 60

    @test LibPARI.factors(1) == Pair{Gen,Gen}[]
    @test (@inferred LibPARI.isprime(pari(7))) isa Bool
end

@testitem "REQ-PUB-05: the supported-but-unexported names are marked public" begin
    using LibPARI

    # `public` needs Julia 1.11; on the 1.10 LTS floor the declaration is
    # skipped, so this only asserts what the running version can express.
    if VERSION >= v"1.11"
        for n in (:PARI, :gentype, :isexact, :nbits2prec, :factors)
            @test Base.ispublic(LibPARI, n)
            @test !Base.isexported(LibPARI, n)
        end
        # An exported name is public by definition.
        for n in (:pari, :Gen, :gp_eval, :PariError)
            @test Base.ispublic(LibPARI, n)
        end
    else
        @test true
    end
end

# Found by the M12–M14 review pass: the facade was relaying PARI's answer
# outside the domain where Base's meaning holds — the same defect class that
# `numerator`/`denominator` were already guarded against.
@testitem "REQ-PUB-07: gcd, gcdx and factor stay inside Base's domain" begin
    using LibPARI

    # PARI computes a gcd for reals, complex values and polynomials.
    # `Base.gcd` is defined for Integer and Rational only, so relaying those
    # would put a PARI meaning under a Julia name — `gcd(12, 1.5)` answered
    # `1` before this guard.
    @test_throws ArgumentError gcd(pari(12), 1.5)
    @test_throws ArgumentError gcd(pari(3 + 4im), pari(2))
    @test_throws ArgumentError gcd(gp_eval("x^2-1"), gp_eval("x-1"))
    @test_throws ArgumentError gcdx(pari(1.5), pari(2.5))

    # The domains Base does define keep working, and agree with Base.
    @test Rational(gcd(pari(3 // 4), pari(1 // 2))) == gcd(3 // 4, 1 // 2)
    @test BigInt(gcd(pari(-12), pari(18))) == gcd(-12, 18)
    for (a, b) in ((12, 18), (-12, 18), (12, -18), (0, 5), (5, 0), (0, 0))
        d, u, v = gcdx(pari(a), pari(b))
        @test BigInt(d) == gcdx(big(a), big(b))[1]
        @test u * pari(a) + v * pari(b) == d
    end

    # Zero has no prime factorization. PARI answers `[0 1]`, which names no
    # prime; the facade refuses it rather than relay it.
    @test_throws ArgumentError LibPARI.factor(pari(0))
    @test_throws ArgumentError LibPARI.factors(0)

    # A negative argument carries the unit, as Primes.jl does.
    @test first(LibPARI.factors(-12)) == (pari(-1) => pari(1))
    @test prod(BigInt(p)^BigInt(e) for (p, e) in LibPARI.factors(-12)) == -12
end

@testitem "REQ-PUB-09: modular arithmetic uses Julia's conventions" begin
    using LibPARI

    @test string(LibPARI.Mod(5, 7)) == "Mod(5, 7)"
    @test LibPARI.lift(LibPARI.Mod(12, 7)) == 5
    @test LibPARI.gentype(LibPARI.Mod(5, 7)) === LibPARI.PariType.T_INTMOD

    # The one that matters: PARI's `%` always answers in [0, |n|), so
    # `PARI.gmod(7, -3)` is 1 where Julia's `mod(7, -3)` is -2. Wrapping
    # `gmod` verbatim under a Julia name would have been wrong.
    for (a, n) in ((7, 3), (-7, 3), (7, -3), (-7, -3), (0, 5), (10, 5))
        @test BigInt(LibPARI.pari_mod(a, n)) == mod(a, n)
    end
    @test BigInt(LibPARI.PARI.gmod(pari(7), pari(-3))) == 1  # PARI's answer
    @test BigInt(LibPARI.pari_mod(7, -3)) == -2       # Julia's

    @test BigInt(powermod(pari(2), 10, pari(1000))) == powermod(2, 10, 1000)
    @test BigInt(powermod(pari(3), 100, pari(7))) == powermod(3, 100, 7)
    @test BigInt(invmod(pari(3), pari(7))) == invmod(3, 7)
    @test_throws LibPARI.PariError invmod(pari(2), pari(4))

    @test_throws ArgumentError LibPARI.Mod(5, 0)
    @test_throws DivideError LibPARI.pari_mod(5, 0)
    @test_throws ArgumentError LibPARI.Mod(1.5, 7)
end

@testitem "REQ-PUB-10: the polynomial facade adds Julia semantics" begin
    using LibPARI

    p = gp_eval("x^3 + 2*x + 5")

    # A Julia `Int`, not a Gen — that is the semantics being added.
    @test LibPARI.degree(p) === 3
    @test LibPARI.degree(pari(5)) === 0
    @test LibPARI.coeff(p, 0) == 5
    @test LibPARI.coeff(p, 1) == 2
    @test LibPARI.coeff(p, 3) == 1
    @test LibPARI.coeff(p, 9) == 0

    # PARI answers -oo for the zero polynomial; there is no Int for it, and
    # a sentinel would be a trap.
    @test_throws DomainError LibPARI.degree(pari(0))
    @test_throws ArgumentError LibPARI.coeff(p, -1)

    # Substitution finds the main variable, whichever it is.
    @test LibPARI.subst(gp_eval("x^2"), pari(3)) == 9
    @test LibPARI.subst(gp_eval("y^3"), pari(2)) == 8
    @test string(LibPARI.subst(gp_eval("x^2+1"), gp_eval("y"))) == "y^2 + 1"

    # Roots follow the precision scope like every other precision-taking call.
    r = LibPARI.polroots(gp_eval("x^2 - 2"))
    @test LibPARI.gentype(r) === LibPARI.PariType.T_COL
    hi = setprecision(
        () -> LibPARI.polroots(gp_eval("x^2 - 2")),
        LibPARI.Gen,
        512,
    )
    # The roots are t_COMPLEX with t_REAL components, so they carry the
    # working precision — and follow the scope like every other
    # precision-taking call.
    @test precision(LibPARI.PARI.compo(hi, 2)) >
          precision(LibPARI.PARI.compo(r, 2))
    @test !LibPARI.isexact(LibPARI.PARI.compo(r, 2))

    @test_throws ArgumentError LibPARI.polroots(pari(5))
end
