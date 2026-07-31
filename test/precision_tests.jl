# M13 — precision-safe reals and a bit-based precision API
# (REQ-PREC-01 … REQ-PREC-12).
#
# Units, pinned against PARI 2.17's own headers: the `p` and `b` prototype
# arguments are BIT counts (`pariinl.h`: `prec2nbits(long x) { return x; }`),
# and PARI allocates `nbits2prec(x) = ceil(x/64)*64` bits. The generator's
# historical `prec = 4` therefore asked for 4 bits and got PARI's 64-bit
# minimum — not "4 words".

@testitem "REQ-PREC-01: the precision units are bits" begin
    using LibPARI

    # Requested bits → allocated bits, rounded up to a multiple of 64.
    @test LibPARI.nbits2prec(1) == 64
    @test LibPARI.nbits2prec(4) == 64
    @test LibPARI.nbits2prec(64) == 64
    @test LibPARI.nbits2prec(65) == 128
    @test LibPARI.nbits2prec(128) == 128
    @test LibPARI.nbits2prec(200) == 256
end

@testitem "REQ-PREC-02: precision and isexact report the PARI value" begin
    using LibPARI

    # An exact value has no finite precision; asking is an error, not a
    # made-up number.
    @test LibPARI.isexact(LibPARI.Gen(42))
    @test LibPARI.isexact(LibPARI.Gen(3 // 4))
    @test !LibPARI.isexact(LibPARI.Gen(1.5))
    @test_throws ArgumentError precision(LibPARI.Gen(42))

    # A t_REAL reports its own accuracy, in bits, as a multiple of 64.
    p = precision(LibPARI.Gen(1.5))
    @test p isa Int
    @test p >= 64
    @test p % 64 == 0

    @test (@inferred precision(LibPARI.Gen(1.5))) isa Int
    @test (@inferred LibPARI.isexact(LibPARI.Gen(42))) isa Bool
end

@testitem "REQ-PREC-03: the default precision is documented, not magic" begin
    using LibPARI

    # In bits, and a sane default — not the undocumented `_DEFAULT_PREC = 4`
    # that asked PARI for its bare minimum.
    @test LibPARI.default_precision() isa Int
    @test LibPARI.default_precision() >= 64
    @test precision(LibPARI.Gen) == LibPARI.default_precision()

    # `Gen^Gen` is the hand-written call that consumes it.
    two = LibPARI.Gen(2)
    r = two^(LibPARI.Gen(1) / LibPARI.Gen(2))
    @test precision(r) >= LibPARI.default_precision()
end

@testitem "REQ-PREC-05: setprecision scopes, nests and restores" begin
    using LibPARI

    outer = precision(LibPARI.Gen)

    v = setprecision(LibPARI.Gen, 256) do
        @test precision(LibPARI.Gen) == 256
        # A nested scope wins, and unwinds back to the enclosing one.
        setprecision(LibPARI.Gen, 512) do
            @test precision(LibPARI.Gen) == 512
        end
        @test precision(LibPARI.Gen) == 256
        precision(LibPARI.Gen)
    end

    @test v == 256
    @test precision(LibPARI.Gen) == outer

    # The scope unwinds even when the body throws.
    @test_throws ErrorException setprecision(LibPARI.Gen, 256) do
        error("boom")
    end
    @test precision(LibPARI.Gen) == outer

    # It is a working precision in bits: a wider scope buys real digits.
    lo = setprecision(() -> LibPARI.PARI.mppi(), LibPARI.Gen, 64)
    hi = setprecision(() -> LibPARI.PARI.mppi(), LibPARI.Gen, 512)
    @test precision(hi) > precision(lo)
    @test abs(BigFloat(hi) - BigFloat(lo)) < 1e-15
end

@testitem "REQ-PREC-06: the scope crosses the PARI worker boundary" begin
    using LibPARI

    # Every libpari call is marshalled onto a sticky per-thread worker task.
    # The precision must be read in the CALLER's task and carried into the
    # closure, or a scope set here would be invisible where the work runs.
    inside = setprecision(LibPARI.Gen, 320) do
        precision(LibPARI.PARI.mppi())
    end
    @test inside >= 320

    # Task-local, so a scope does not leak into an unrelated task...
    outer = precision(LibPARI.Gen)
    t = setprecision(LibPARI.Gen, 512) do
        fetch(Threads.@spawn precision(LibPARI.Gen))
    end
    # ...which is a documented limitation on Julia 1.10 (no ScopedValues):
    # a spawned child does NOT inherit the scope.
    @test t == outer

    # And a value computed inside the scope keeps its precision afterwards.
    g = setprecision(() -> LibPARI.PARI.mppi(), LibPARI.Gen, 448)
    @test precision(g) >= 448
end

@testitem "REQ-PREC-08: Gen(::BigFloat) is exact, never via Float64" begin
    using LibPARI

    # The value that used to collapse: 30 significant digits, silently
    # crushed to 53 bits by `Cdouble(x)`.
    x = big"1.00000000000000000000000000000001"
    g = LibPARI.Gen(x)
    @test !(BigFloat(g) == 1.0)
    @test BigFloat(g) == x
    @test precision(g) >= precision(x)

    # Round-trips over several precisions, both directions, bit-exact.
    for bits in (53, 64, 113, 256, 512, 1024, 4096)
        y = setprecision(BigFloat, bits) do
            sqrt(BigFloat(2))
        end
        gy = LibPARI.Gen(y)
        @test precision(gy) >= bits
        @test setprecision(() -> BigFloat(gy), BigFloat, bits) == y
    end

    # Signs, zero and tiny/huge exponents survive.
    for y in (big"-1.5", big"0.0", big"1e-400", big"1e400", big"-1e-400")
        @test BigFloat(LibPARI.Gen(y)) == y
    end

    # An IEEE float is exact too, and stays cheap.
    @test Float64(LibPARI.Gen(0.1)) === 0.1
    @test Float64(LibPARI.Gen(Float32(0.1))) === Float64(Float32(0.1))

    # No path from a BigFloat may go through Cdouble.
    src = read(joinpath(pkgdir(LibPARI), "src", "precision.jl"), String)
    @test !occursin("Cdouble(x)", src) || occursin("IEEEFloat", src)
end

@testitem "REQ-PREC-07: BigFloat(::Gen) takes an explicit precision" begin
    using LibPARI

    g = setprecision(() -> LibPARI.PARI.mppi(), LibPARI.Gen, 512)

    # The keyword wins over the ambient default.
    @test precision(BigFloat(g; precision = 256)) == 256
    @test precision(BigFloat(g; precision = 1024)) == 1024

    # Asking for less than PARI computed rounds; asking for more does not
    # invent digits beyond PARI's value.
    lo = BigFloat(g; precision = 64)
    hi = BigFloat(g; precision = 512)
    @test abs(hi - lo) < 1e-15
    @test BigFloat(g; precision = 512) == BigFloat(g; precision = 512)
end

@testitem "REQ-PREC-12: gp_eval follows PARI's global precision" begin
    using LibPARI

    # The scope is LibPARI's, applied to the calls LibPARI makes. It does
    # NOT reach into the GP interpreter, which reads PARI's process-global
    # `realprecision`. Documenting that is the point of this test.
    outside = LibPARI.gp_eval("Pi")
    inside = setprecision(() -> LibPARI.gp_eval("Pi"), LibPARI.Gen, 1024)
    @test precision(inside) == precision(outside)
end
