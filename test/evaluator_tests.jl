# M7 — GP expression evaluator: `gp_eval` over arbitrary GP strings, the
# closure-function escape hatch, and malformed-input errors.

@testitem "gp_eval evaluates GP expressions to Gen results" begin
    using LibPARI

    @test LibPARI.gp_eval("2 + 2") isa LibPARI.Gen
    @test BigInt(LibPARI.gp_eval("2 + 2")) == 4
    @test BigInt(LibPARI.gp_eval("3^50")) == big(3)^50

    # A non-scalar result is still a Gen.
    @test LibPARI.gentype(LibPARI.gp_eval("[1, 2, 3]")) ===
          LibPARI.PariType.T_VEC
end

@testitem "gp_eval reaches GP-closure-argument functions (escape hatch)" begin
    using LibPARI

    # `sum` and `prod` take a GP-closure argument — M4 emitted no binding
    # for them; gp_eval reaches them through the GP language.
    @test BigInt(LibPARI.gp_eval("sum(X = 1, 10, X^2)")) == 385
    @test BigInt(LibPARI.gp_eval("prod(X = 1, 6, X)")) == 720
end

@testitem "gp_eval shares one GP environment across calls" begin
    using LibPARI

    LibPARI.gp_eval("m7var = 21")
    @test BigInt(LibPARI.gp_eval("m7var * 2")) == 42
end

@testitem "a gp_eval result equals the equivalent binding call" begin
    using LibPARI

    via_gp = LibPARI.gp_eval("nextprime(1000)")
    via_binding = LibPARI.PARI.nextprime(LibPARI.Gen(1000))
    @test via_gp == via_binding
end

@testitem "a malformed GP expression raises a catchable PariError" begin
    using LibPARI

    # A syntactically invalid string → PariError describing the parse error.
    err = try
        LibPARI.gp_eval("2 +")
        nothing
    catch e
        e
    end
    @test err isa LibPARI.PariError
    @test err isa LibPARI.PariError && err.category === LibPARI.PariErr.e_SYNTAX
    @test err isa LibPARI.PariError && !isempty(err.message)

    # A runtime failure also surfaces as a catchable PariError.
    @test_throws LibPARI.PariError LibPARI.gp_eval("1/0")

    # The library stays usable after a failed evaluation.
    @test BigInt(LibPARI.gp_eval("6 * 7")) == 42
end
