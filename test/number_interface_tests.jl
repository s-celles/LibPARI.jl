# Tests for the numeric surface `Gen` offers (feature 015, restated for
# M11): mixed arithmetic and identities, comparison/ordering/hashing,
# predicates, elementary operations, and conversions.
#
# `Gen <: Number` no longer holds — REQ-TYPE-01 withdraws it. Every
# behaviour below is now carried by an explicit method on `Gen`, not by a
# Base `Number` fallback; the supertype itself is asserted in
# test/type_contract_tests.jl.

# REQ-TYPE-02 supersedes the promotion whitelist this once relied on: the
# accepted operand set is enumerated, not "every Julia number type" — see
# test/type_contract_tests.jl for the operands that must now fail cleanly.
@testitem "Gen mixes with the documented Julia number types" begin
    using LibPARI
    g = LibPARI.Gen(6)
    @test BigInt(g + 1) == 7
    @test BigInt(2 * g) == 12               # other operand order
    @test BigInt(g - 4) == 2
    @test BigInt(g + big(10)^30) == big(10)^30 + 6
    @test Rational(g + 1 // 2) == 13 // 2
    @test Float64(g + 2.5) == 8.5
    @test string(g + big(2.5)) == string(g + LibPARI.Gen(2.5))
    @test g + 1im isa LibPARI.Gen
    @test BigInt(1 + g) == 7
end

@testitem "Gen zero/one and generic numeric code" begin
    using LibPARI
    @test iszero(zero(LibPARI.Gen))
    @test isone(one(LibPARI.Gen))
    @test zero(LibPARI.Gen(9)) == LibPARI.Gen(0)
    @test BigInt(sum(LibPARI.Gen.(1:10))) == 55
    @test BigInt(prod(LibPARI.Gen.(1:5))) == 120
    # A generic function written for `Number`, run unchanged with `Gen` —
    # it needs `zero`, `+` and `*` on `Gen`, not the `Number` supertype.
    horner(x, c) = foldr((ci, acc) -> ci + x * acc, c; init = zero(x))
    @test BigInt(horner(LibPARI.Gen(2), LibPARI.Gen.([3, 0, 1]))) == 7
end

@testitem "Gen comparison, ordering, and sorting" begin
    using LibPARI
    @test LibPARI.Gen(2) < LibPARI.Gen(3)
    @test LibPARI.Gen(3) > LibPARI.Gen(2)
    @test LibPARI.Gen(2) <= LibPARI.Gen(2)
    @test LibPARI.Gen(5) < 7                # Gen vs Int
    @test 1 < LibPARI.Gen(2)                # Int vs Gen
    @test LibPARI.Gen(2) == 2
    @test sort(LibPARI.Gen.([3, 1, 2])) == LibPARI.Gen.([1, 2, 3])
    # REQ-TYPE-04: `isless` gains the two mixed methods `<` already had, so
    # ordering and sorting agree on which mixed calls are legal.
    @test isless(LibPARI.Gen(5), 7)
    @test isless(1, LibPARI.Gen(2))
    @test sort(Any[LibPARI.Gen(2), 1])[1] == 1
end

@testitem "Gen hashing and use as a collection key" begin
    using LibPARI
    @test hash(LibPARI.Gen(2)) == hash(2)             # across the boundary
    @test hash(LibPARI.Gen(2)) == hash(LibPARI.Gen(2))
    d = Dict(LibPARI.Gen(7) => "seven")
    @test d[7] == "seven"                             # look up with an Int
    @test d[LibPARI.Gen(7)] == "seven"
    s = Set([LibPARI.Gen(1), LibPARI.Gen(1), LibPARI.Gen(2)])
    @test length(s) == 2

    # REQ-TYPE-09: `hash` is total over every PARI type. It routed a
    # `t_REAL` through `Float64` and so threw on a large-exponent real,
    # which made such a `Gen` unusable as a `Dict`/`Set` key at all.
    big400 = LibPARI.gp_eval("1.0*10^400")
    @test hash(big400) isa UInt
    @test hash(big400) == hash(LibPARI.gp_eval("1.0*10^400"))
    @test hash(LibPARI.gp_eval("[1,2;3,4]")) isa UInt
    @test hash(LibPARI.gp_eval("\"abc\"")) isa UInt
    @test hash(LibPARI.gp_eval("x^2 + 1")) isa UInt

    # The `a == b => hash(a) == hash(b)` invariant, across PARI types.
    for (a, b) in (
        (LibPARI.Gen(2), LibPARI.Gen(2.0)),
        (LibPARI.Gen(1) / LibPARI.Gen(4), LibPARI.Gen(0.25)),
        (LibPARI.Gen(3), LibPARI.Gen(6) / LibPARI.Gen(2)),
    )
        @test a == b
        @test hash(a) == hash(b)
    end
end

@testitem "Gen numeric predicates" begin
    using LibPARI
    @test iszero(LibPARI.Gen(0))
    @test !iszero(LibPARI.Gen(5))
    @test isone(LibPARI.Gen(1))
    @test isinteger(LibPARI.Gen(4))
    @test !isinteger(LibPARI.Gen(1) / LibPARI.Gen(2))
    @test isfinite(LibPARI.Gen(7))
    @test isreal(LibPARI.Gen(3))
    @test !isnan(LibPARI.Gen(3))

    # REQ-TYPE-10: a `Gen` of a non-numeric PARI type is no longer a
    # `Number`, so each predicate is restated per `gentype` — it still
    # answers with a `Bool` for every PARI type rather than throwing.
    s = LibPARI.gp_eval("\"abc\"")
    m = LibPARI.gp_eval("[1,2;3,4]")
    @test !isreal(s)
    @test !isreal(m)
    @test !iszero(s)
    @test !iszero(m)
    @test !isinteger(m)
    @test isfinite(s)
    @test !isnan(m)
end

@testitem "Gen elementary operations" begin
    using LibPARI
    @test BigInt(abs(LibPARI.Gen(-9))) == 9
    @test BigInt(sign(LibPARI.Gen(-3))) == -1
    @test BigInt(sign(LibPARI.Gen(4))) == 1
    @test -LibPARI.Gen(5) == LibPARI.Gen(-5)
    @test inv(LibPARI.Gen(4)) == LibPARI.Gen(1) / LibPARI.Gen(4)
    @test BigInt(real(LibPARI.Gen(8))) == 8
    @test iszero(imag(LibPARI.Gen(8)))
end

@testitem "Gen <-> Julia numeric conversions" begin
    using LibPARI
    @test Float64(LibPARI.Gen(1) / LibPARI.Gen(4)) == 0.25
    @test Float64(LibPARI.Gen(7)) == 7.0
    @test Rational(LibPARI.Gen(3) / LibPARI.Gen(8)) == 3 // 8
    @test BigFloat(LibPARI.Gen(2)) == big(2.0)
    @test Complex(LibPARI.Gen(5)) == 5.0 + 0.0im
    @test LibPARI.Gen(2.5) isa LibPARI.Gen
    @test LibPARI.Gen(3 // 4) isa LibPARI.Gen
    @test LibPARI.Gen(1 + 2im) isa LibPARI.Gen

    # REQ-TYPE-08: a `t_REAL` converts through PARI instead of parsing its
    # printed form. PARI prints a space before the exponent, so the old
    # `parse` path raised `ArgumentError` on perfectly ordinary values.
    @test Float64(LibPARI.Gen(1e-10)) == 1e-10
    @test Float64(LibPARI.gp_eval("1.0*10^400")) == Inf
    @test isfinite(BigFloat(LibPARI.gp_eval("1.0*10^400")))
    @test BigFloat(LibPARI.gp_eval("1.0*10^400")) > big(10.0)^399
    @test BigFloat(LibPARI.gp_eval("1.0*10^400")) < big(10.0)^401
end

@testitem "operations inapplicable to a Gen's PARI type fail cleanly" begin
    using LibPARI
    p = LibPARI.gp_eval("x^2 + 1")          # a polynomial Gen
    q = LibPARI.gp_eval("x + 1")            # another polynomial Gen
    # REQ-TYPE-07/08 tighten these from `Exception` (which also matched a
    # `StackOverflowError`) to the exact promised types.
    @test_throws LibPARI.PariError p < q    # polynomials are not ordered
    @test_throws InexactError Float64(p)    # a polynomial is not a real
    @test_throws InexactError BigFloat(p)
    @test_throws InexactError Float64(LibPARI.gp_eval("\"abc\""))
    # `BigInt` reaches PARI's `isint` first, which rejects a `t_POL` itself:
    # a `PariError`, not an `InexactError`. Both are catchable and named —
    # M11 does not change this path, so it is pinned as it stands.
    @test_throws LibPARI.PariError BigInt(p)
end
