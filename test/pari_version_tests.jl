# PARI 2.19 — the library LibPARI loads, and the binding set generated from
# its `pari.desc`.
#
# The bindings are named after PARI's C-Name. PARI 2.19 moved six GP functions
# onto new `...0` C entry points (their GP-level wrappers, which take the
# optional arguments), so the generated layer follows: `PARI.nextprime`
# becomes `PARI.nextprime0`, and so on. The hand-written `LibPARI.nextprime`
# is unaffected.

@testitem "the loaded PARI library is 2.19" begin
    using LibPARI
    v = LibPARI.gp_eval("version()")
    @test (Int(v[1]), Int(v[2])) == (2, 19)
end

@testitem "bindings follow PARI 2.19's C-Names" begin
    using LibPARI
    PARI = LibPARI.PARI

    # Renamed in 2.19: the binding takes the new C-Name.
    for (old, new) in (
        :nextprime => :nextprime0,
        :polgraeffe => :polgraeffe0,
        :elleisnum => :elleisnum0,
        :ellfromeqn => :ellfromeqn0,
        :ellchangepoint => :ellchangepoint0,
        :ellchangepointinv => :ellchangepointinv0,
    )
        @test isdefined(PARI, new)
        @test !isdefined(PARI, old)
    end
    # Dropped from 2.19's pari.desc.
    @test !isdefined(PARI, :sturmpart)
    @test !isdefined(PARI, :listcreate_gp)

    # The renamed binding computes what the old one did, and its optional
    # GP argument is now reachable: the next prime ≡ 1 (mod 5).
    @test PARI.nextprime0(1000) == 1009
    @test PARI.nextprime0(1000; x2 = 5) == 1021

    # The hand-written facade keeps its name.
    @test LibPARI.nextprime(1000) == 1009
end

@testitem "a function new in PARI 2.19 is bound" begin
    using LibPARI
    # `primeisregular` first appears in 2.19's pari.desc.
    @test LibPARI.PARI.primeisregular(5) == 1
    @test LibPARI.PARI.primeisregular(37) == 0
end
