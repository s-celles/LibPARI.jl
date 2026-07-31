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
