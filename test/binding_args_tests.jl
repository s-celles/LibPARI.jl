# M15 — generated bindings accept Julia scalars where PARI's prototype
# expects a GEN (REQ-ARG-01 … REQ-ARG-12).
#
# `PARI.nextprime(1000)` instead of `PARI.nextprime(pari(1000))`, through
# generator changes only — one method per binding, one conversion per
# argument, and an existing `Gen` never copied.

@testitem "REQ-ARG-03: a binding takes a Julia scalar in a G slot" begin
    using LibPARI
    const PARI = LibPARI.PARI

    @test PARI.nextprime(1000) == 1009
    @test PARI.eulerphi(100) == 40
    @test PARI.gmodulo(5, 7) == PARI.gmodulo(pari(5), pari(7))

    # Every documented input kind reaches a G slot.
    for x in (1000, big(1000), Int8(100), UInt(1000), true)
        @test PARI.nextprime(x) == PARI.nextprime(pari(x))
    end
    @test PARI.gfloor(3 // 2) == 1
    @test PARI.gfloor(1.5) == 1
end

@testitem "REQ-ARG-08: a scalar argument agrees with its Gen form" begin
    using LibPARI
    const PARI = LibPARI.PARI

    # All four return conventions: Gen, scalar, void-ish, and the `&`-tuple.
    @test PARI.nextprime(1000) == PARI.nextprime(pari(1000))          # Gen
    @test PARI.gsigne(-5) == PARI.gsigne(pari(-5))                    # Int
    @test PARI.glength(gp_eval("[1,2,3]")) == 3
    @test LibPARI.gentype(PARI.nextprime(1000)) ===
          LibPARI.gentype(PARI.nextprime(pari(1000)))

    # An unsupported argument fails at dispatch, not deep inside the ccall.
    @test_throws MethodError PARI.nextprime("1000")
    @test_throws MethodError PARI.nextprime(nothing)
end

@testitem "REQ-ARG-04: an optional G keyword accepts a scalar too" begin
    using LibPARI
    const PARI = LibPARI.PARI

    # `D<G>` keywords used to be untyped `x = nothing`, so a wrong type
    # failed late with `type Int64 has no field ptr`.
    @test PARI.ggcd0(12; x2 = 18) == 6
    @test PARI.ggcd0(pari(12); x2 = 18) == 6
    @test PARI.ggcd0(12; x2 = pari(18)) == 6
    @test PARI.ggcd0(12) == 12
    # A typed KEYWORD rejects with `TypeError`, where a typed positional
    # rejects with `MethodError` — Julia converts keyword arguments to their
    # declared type rather than dispatching on them. Both are early and name
    # the expected type, which is the point: the untyped `x2 = nothing` this
    # replaces failed late, inside the ccall, as "no field ptr".
    @test_throws TypeError PARI.ggcd0(12; x2 = "18")
end

@testitem "REQ-ARG-02: an existing Gen is never copied" begin
    using LibPARI
    const PARI = LibPARI.PARI

    g = pari(1000)
    # The conversion helper returns the very same object for a `Gen`.
    @test LibPARI.gen_convert(g) === g
    # And the binding's result is unaffected by which form was passed.
    @test PARI.nextprime(g) == PARI.nextprime(1000)
end

@testitem "REQ-ARG-09: no method explosion — one method per binding" begin
    using LibPARI
    const PARI = LibPARI.PARI

    callable = filter(names(LibPARI.PARI; all = true)) do s
        startswith(string(s), "#") && return false
        s in (:eval, :include) && return false
        isdefined(LibPARI.PARI, s) || return false
        getfield(LibPARI.PARI, s) isa Function
    end
    @test !isempty(callable)

    offenders = String[]
    for s in callable
        n = length(methods(getfield(LibPARI.PARI, s)))
        n == 1 || push!(offenders, "$s has $n methods")
    end
    @test isempty(offenders)
end

@testitem "REQ-ARG-10: scalar-argument calls stay type-stable" begin
    using LibPARI
    using Test
    const PARI = LibPARI.PARI

    @test (@inferred PARI.nextprime(1000)) isa LibPARI.Gen
    @test (@inferred PARI.nextprime(pari(1000))) isa LibPARI.Gen
    @test (@inferred PARI.gsigne(-5)) isa Int
    @test (@inferred PARI.eulerphi(100)) isa LibPARI.Gen
    # `Base.infer_return_type` is Julia 1.11+; `return_types` works on the
    # 1.10 LTS floor this package supports.
    @test only(Base.return_types(PARI.nextprime, Tuple{Int})) === LibPARI.Gen
    @test only(Base.return_types(PARI.gsigne, Tuple{Int})) === Int
end

@testitem "REQ-ARG-05: a scalar argument leaks no PARI stack" begin
    using LibPARI
    const PARI = LibPARI.PARI

    # The scalar-return branch had no `avma` capture: a converted temporary
    # would accumulate on PARI's transient stack, call after call.
    PARI.gsigne(5)
    av = LibPARI._avma()
    for _ = 1:20_000
        PARI.gsigne(5)
        PARI.nextprime(1000)
    end
    GC.gc()
    @test LibPARI._avma() == av
end

@testitem "REQ-ARG-12: the accepted set is what the docs claim" begin
    using LibPARI
    const PARI = LibPARI.PARI

    # A vector is NOT accepted in a G slot: t_VEC versus t_COL is a genuine
    # user choice, so it stays explicit (build it with gp_eval or a PARI
    # constructor).
    @test_throws MethodError PARI.nextprime([1, 2, 3])
    # A string is not accepted either — it would be ambiguous against the
    # `s`/`r` prototype codes, which mean a GP variable name.
    @test_throws MethodError PARI.gsigne("x")
end
