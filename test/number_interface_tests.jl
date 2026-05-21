# Tests for `Gen`'s completed Julia `Number` interface (feature 015):
# mixed arithmetic and identities, comparison/ordering/hashing, predicates,
# elementary operations, and conversions.

@testitem "Gen mixes with every Julia number type" begin
    using LibPARI
    g = LibPARI.Gen(6)
    @test BigInt(g + 1) == 7
    @test BigInt(2 * g) == 12               # other operand order
    @test BigInt(g - 4) == 2
    @test BigInt(g + big(10)^30) == big(10)^30 + 6
    @test Rational(g + 1 // 2) == 13 // 2
    @test Float64(g + 2.5) == 8.5
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
    # A generic function written for `Number`, run unchanged with `Gen`.
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
end

@testitem "operations inapplicable to a Gen's PARI type fail cleanly" begin
    using LibPARI
    p = LibPARI.gp_eval("x^2 + 1")          # a polynomial Gen
    q = LibPARI.gp_eval("x + 1")            # another polynomial Gen
    @test_throws Exception p < q            # polynomials are not ordered
    @test_throws Exception Float64(p)       # a polynomial is not a real
end
