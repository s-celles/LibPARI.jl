# M11 — the honest type contract for `Gen` (REQ-TYPE-01 … REQ-TYPE-13).
# One concrete `Gen` wraps *every* PARI object — matrices, strings and
# closures included — so `Gen` is a `PariObject`, not a Julia `Number`.
# Everything Base's `Number` fallbacks used to supply silently is asserted
# here as an explicit two-argument method with a *computed value*.

@testitem "REQ-TYPE-01: Gen is a concrete PariObject, not a Number" begin
    using LibPARI

    @test isabstracttype(LibPARI.PariObject)
    @test LibPARI.Gen <: LibPARI.PariObject
    @test !(LibPARI.Gen <: Number)

    # REQ-MEM-02 is unchanged: concrete, mutable, single-field and
    # unparameterised — no `Gen{T}` per PARI type tag.
    @test isconcretetype(LibPARI.Gen)
    @test ismutabletype(LibPARI.Gen)
    @test fieldcount(LibPARI.Gen) == 1
    @test !(LibPARI.Gen isa UnionAll)
end

@testitem "REQ-TYPE-10: a t_MAT, t_STR or t_CLOSURE Gen is not a Number" begin
    using LibPARI

    m = LibPARI.gp_eval("[1,2;3,4]")
    s = LibPARI.gp_eval("\"abc\"")
    c = LibPARI.gp_eval("(x) -> x^2")

    @test LibPARI.gentype(m) === LibPARI.PariType.T_MAT
    @test LibPARI.gentype(s) === LibPARI.PariType.T_STR
    @test LibPARI.gentype(c) === LibPARI.PariType.T_CLOSURE

    # The concrete dishonesty M11 removes: all three answered `true` here
    # while `Gen <: Number` held.
    @test !(m isa Number)
    @test !(s isa Number)
    @test !(c isa Number)

    # A numeric `Gen` is no more a `Number` than a matrix one — the wrapper
    # type carries no numeric claim at all.
    @test !(LibPARI.Gen(42) isa Number)
end

@testitem "REQ-TYPE-11: the arithmetic matrix over Julia number types" begin
    using LibPARI

    gen = LibPARI.Gen
    g = gen(12)
    # One operand of each documented Julia number kind (REQ-TYPE-02).
    operands = (3, big(3), 3.0, big(3.0), 3 // 1, 3 + 0im)

    for x in operands
        gx = gen(x)
        # Each mixed method must route to the very same PARI operation as
        # the `Gen`/`Gen` operator, in both operand orders. Comparing the
        # printed values shows both sides on a failure.
        @test string(g + x) == string(g + gx)
        @test string(x + g) == string(gx + g)
        @test string(g - x) == string(g - gx)
        @test string(x - g) == string(gx - g)
        @test string(g * x) == string(g * gx)
        @test string(x * g) == string(gx * g)
        @test string(g / x) == string(g / gx)
        @test string(x / g) == string(gx / g)
        # `g^(3//1)` currently reaches Base's `^(::Number, ::Rational)`,
        # which drops to a float power ("1728.0000000000000006"). With the
        # explicit table it is `g^Gen(3//1)` — PARI's exact `gpow`.
        @test string(g^x) == string(g^gx)
        @test string(x^g) == string(gx^g)
        @test string(g \ x) == string(g \ gx)
        @test string(x \ g) == string(gx \ g)
    end
end

@testitem "REQ-TYPE-11: mixed arithmetic computes the documented values" begin
    using LibPARI

    g = LibPARI.Gen(12)

    @test BigInt(g + 3) == 15
    @test BigInt(3 + g) == 15
    @test BigInt(g - 3) == 9
    @test BigInt(3 - g) == -9
    @test BigInt(g * 3) == 36
    @test BigInt(3 * g) == 36
    @test BigInt(g / 3) == 4
    @test Rational(3 / g) == 1 // 4
    @test BigInt(g^3) == 1728
    @test BigInt(3^g) == 531441
    @test BigInt(g \ 36) == 3
    @test BigInt(3 \ g) == 4

    # One value per remaining Julia number kind.
    @test BigInt(g + big(10)^30) == big(10)^30 + 12
    @test Float64(g + 2.5) == 14.5
    # See the note in test/number_interface_tests.jl: comparing the printed
    # forms compared PRECISIONS, and only matched because `Gen(::BigFloat)`
    # used to truncate to 53 bits. M13 (REQ-PREC-08) preserves the operand's
    # precision, so the values match and the widths deliberately do not.
    @test g + big(2.5) == g + LibPARI.Gen(2.5)
    @test precision(g + big(2.5)) >= precision(big(2.5))
    @test Rational(g + 1 // 2) == 25 // 2
    @test BigInt(g + (3 + 0im)) == 15
    @test string(g + (3 + 4im)) == string(g + LibPARI.Gen(3 + 4im))
end

@testitem "REQ-TYPE-03: mixed equality is PARI equality, never `===`" begin
    using LibPARI

    g = LibPARI.Gen(12)

    # Without explicit methods Base's `==(x, y) = x === y` fallback makes
    # every one of these silently `false` — a wrong answer, not an error.
    @test g == 12
    @test 12 == g
    @test g == big(12)
    @test big(12) == g
    @test g == 12.0
    @test 12.0 == g
    @test g == big(12.0)
    @test big(12.0) == g
    @test g == 12 // 1
    @test 12 // 1 == g
    @test g == 12 + 0im
    @test 12 + 0im == g

    # The negative direction must be a computed `false`, not a fallback one.
    @test (g == 13) == false
    @test (13 == g) == false
    @test g != 13
    @test 13 != g

    # PARI's equality is mathematical, and holds across PARI types.
    @test LibPARI.Gen(2) == LibPARI.Gen(2.0)
    @test LibPARI.Gen(1) / LibPARI.Gen(4) == 0.25
end

@testitem "REQ-TYPE-04: mixed <, <= and isless in both operand orders" begin
    using LibPARI

    g = LibPARI.Gen(12)
    # Ordering applies to the real Julia number kinds only.
    smaller = (3, big(3), 3.0, big(3.0), 3 // 1)

    for x in smaller
        @test g > x
        @test x < g
        @test !(g < x)
        @test !(x > g)
        @test g >= x
        @test x <= g
        @test isless(x, g)
        @test !isless(g, x)
    end

    @test LibPARI.Gen(3) <= 3
    @test 3 <= LibPARI.Gen(3)
    @test !isless(LibPARI.Gen(3), 3)
    @test !isless(3, LibPARI.Gen(3))

    # A non-ordered operand still fails as a catchable `PariError`.
    @test_throws LibPARI.PariError g < 1im
    @test_throws LibPARI.PariError isless(g, 1im)
end

@testitem "REQ-TYPE-04: sorting a mixed Gen / Julia-number array" begin
    using LibPARI

    # Each `sort` stays inside its own `@test` so that a missing `isless`
    # method is one recorded error, not an abort of the whole test item.
    @test sort(Any[LibPARI.Gen(2), 1])[1] == 1
    @test sort(Any[LibPARI.Gen(2), 1])[2] == 2
    @test string(sort(Any[3, LibPARI.Gen(1), 2.5])[1]) == "1"
    @test string(sort(Any[3, LibPARI.Gen(1), 2.5])[2]) == "2.5"
    @test string(sort(Any[3, LibPARI.Gen(1), 2.5])[3]) == "3"

    # `Gen`-only sorting is unchanged.
    @test sort(LibPARI.Gen.([3, 1, 2])) == LibPARI.Gen.([1, 2, 3])
end

@testitem "REQ-TYPE-03: a Gen and an equal Julia number are one key" begin
    using LibPARI

    d = Dict(LibPARI.Gen(7) => "s")
    @test d[7] == "s"
    @test d[LibPARI.Gen(7)] == "s"
    @test haskey(d, 7)

    @test LibPARI.Gen(2) in Set([2])
    @test 2 in Set([LibPARI.Gen(2)])
    @test length(Set([LibPARI.Gen(1), LibPARI.Gen(1), LibPARI.Gen(2)])) == 2

    # Julia's `a == b => hash(a) == hash(b)` invariant, across the boundary.
    @test hash(LibPARI.Gen(7)) == hash(7)
    @test hash(LibPARI.Gen(2.0)) == hash(LibPARI.Gen(2))
end

@testitem "REQ-TYPE-05: a Gen broadcasts as a scalar" begin
    using LibPARI

    # Base's `Number` whitelist is gone; without `broadcastable(g) = Ref(g)`
    # the generic fallback is `collect(g)`, which a `Gen` cannot satisfy.
    @test Base.broadcastable(LibPARI.Gen(2)) isa Ref

    r = LibPARI.Gen(2) .+ [1, 2]
    @test r isa Vector{LibPARI.Gen}
    @test BigInt.(r) == [3, 4]
    @test BigInt.(LibPARI.Gen.([1, 2]) .* LibPARI.Gen(3)) == [3, 6]
    @test string.(LibPARI.Gen(5)) == "5"
end

@testitem "REQ-TYPE-06: the Number conveniences re-implemented on Gen" begin
    using LibPARI

    g = LibPARI.Gen(3)

    @test BigInt(+g) == 3                          # unary `+`
    @test BigInt(LibPARI.Gen(2) \ LibPARI.Gen(4)) == 2
    @test float(LibPARI.Gen(2)) === 2.0            # value and type kept
    @test BigInt(abs2(g)) == 9
    @test BigInt(adjoint(g)) == 3
    @test BigInt(transpose(g)) == 3

    # `adjoint` conjugates, `transpose` does not.
    z = LibPARI.Gen(1 + 2im)
    @test string(adjoint(z)) == string(conj(z))
    @test string(transpose(z)) == string(z)

    # Identity elements are unaffected by the supertype change.
    @test iszero(zero(LibPARI.Gen))
    @test isone(one(LibPARI.Gen))
    @test isone(oneunit(LibPARI.Gen))
end

@testitem "REQ-TYPE-07: an operand with no Gen constructor errors cleanly" begin
    using LibPARI

    # `Gen(1) + π` used to recurse through `promote_type`/`convert` and die
    # with a `StackOverflowError`, which corrupts program state. The two
    # failure modes are now distinct and both exact — M12 (REQ-PROM-03)
    # replaced the loose `Union{MethodError,ArgumentError}` this test
    # originally admitted:
    #   * an arithmetic operand outside `PariConvertible` fails dispatch,
    #     because the mixed-operand table has no method for it;
    #   * an explicit conversion reports the type it cannot convert.
    @test_throws MethodError LibPARI.Gen(1) + π
    @test_throws MethodError π + LibPARI.Gen(1)
    @test_throws LibPARI.ConversionError LibPARI.Gen(π)
    @test_throws LibPARI.ConversionError convert(LibPARI.Gen, π)

    # PARI stays usable afterwards — the failure is a plain exception.
    @test BigInt(LibPARI.Gen(2) + LibPARI.Gen(3)) == 5
end

@testitem "REQ-TYPE-13: the mixed-operand methods are type-stable" begin
    using LibPARI

    g = LibPARI.Gen(6)

    @test (@inferred g + 1) isa LibPARI.Gen
    @test (@inferred 1 + g) isa LibPARI.Gen
    @test (@inferred g - 1.5) isa LibPARI.Gen
    @test (@inferred 1.5 - g) isa LibPARI.Gen
    @test (@inferred g * (3 // 4)) isa LibPARI.Gen
    @test (@inferred (3 // 4) * g) isa LibPARI.Gen
    @test (@inferred g / 2) isa LibPARI.Gen
    @test (@inferred 2 / g) isa LibPARI.Gen
    @test (@inferred g^2) isa LibPARI.Gen
    @test (@inferred g \ 12) isa LibPARI.Gen
    @test (@inferred g == 6) isa Bool
    @test (@inferred 6 == g) isa Bool
    @test (@inferred g < 7) isa Bool
    @test (@inferred 7 < g) isa Bool
    @test (@inferred g <= 7) isa Bool
    @test (@inferred isless(g, 7)) isa Bool
    @test (@inferred isless(7, g)) isa Bool
    @test (@inferred Base.broadcastable(g)) isa Ref
    @test (@inferred +g) isa LibPARI.Gen
    @test (@inferred abs2(g)) isa LibPARI.Gen
    @test (@inferred float(g)) isa Float64
    @test (@inferred adjoint(g)) isa LibPARI.Gen
end

# The methods REQ-TYPE-06 re-declares must not carry over the scalar
# assumption M11 exists to withdraw: the `Number` fallbacks they replace were
# silently wrong for a container.
@testitem "REQ-TYPE-06: transpose, adjoint and \\ respect the PARI type" begin
    using LibPARI

    m = LibPARI.gp_eval("[1,2;3,4]")
    @test string(LibPARI.transpose(m)) == string(LibPARI.gp_eval("[1,3;2,4]"))

    # A `t_VEC` transposes to a `t_COL`, as it does in GP.
    v = LibPARI.gp_eval("[1,2,3]")
    @test LibPARI.gentype(LibPARI.transpose(v)) === LibPARI.PariType.T_COL
    @test LibPARI.gentype(v) === LibPARI.PariType.T_VEC

    # `adjoint` is the conjugate transpose, not `conj` alone.
    zc = LibPARI.gp_eval("[1+I,2;3,4-I]")
    @test string(zc') == string(LibPARI.gp_eval("[1-I,3;2,4+I]"))

    # A scalar keeps the Base meaning: transpose is the identity.
    @test LibPARI.transpose(LibPARI.Gen(7)) == LibPARI.Gen(7)
    @test LibPARI.Gen(3 + 4im)' == LibPARI.Gen(3 - 4im)

    # `a \ b` is `a⁻¹·b`. PARI's `gdiv` is `b·a⁻¹`, so the two disagree
    # whenever multiplication does not commute.
    a = LibPARI.gp_eval("[1,2;3,4]")
    b = LibPARI.gp_eval("[1,1;0,1]")
    @test (a \ b) == LibPARI.PARI.ginv(a) * b
    @test (a \ b) != b / a
    @test LibPARI.Gen(2) \ LibPARI.Gen(4) == LibPARI.Gen(2)
    @test 2 \ LibPARI.Gen(4) == LibPARI.Gen(2)

    # `abs2` is elementwise in PARI, which is neither Base's scalar `abs2`
    # nor a norm, so a container is refused rather than answered wrongly.
    @test_throws ArgumentError abs2(m)
    @test abs2(LibPARI.Gen(3 + 4im)) == LibPARI.Gen(25)
end

# REQ-TYPE-08: a `t_REAL` is decomposed with PARI's own mantissa, so a value
# wider than the ambient `BigFloat` precision survives the conversion.
@testitem "REQ-TYPE-08: a wide t_REAL converts without losing mantissa" begin
    using LibPARI

    hp = LibPARI.gp_eval("sqrt(precision(2., 200))")
    m, _ = LibPARI._real_mantissa(hp)
    bits = ndigits(m; base = 2)
    @test bits > precision(BigFloat)          # wider than Julia's default

    bf = BigFloat(hp)
    @test precision(bf) >= bits               # the widening is not discarded
    # PARI prints its own value; the two must agree digit for digit.
    @test startswith(string(bf), first(string(hp), 30))

    # Magnitudes outside the Float64 range convert instead of raising.
    @test Float64(LibPARI.Gen(1e-10)) === 1.0e-10
    @test Float64(LibPARI.gp_eval("1.0*10^400")) === Inf
    @test hash(LibPARI.gp_eval("1.0*10^400")) isa UInt
end

# REQ-TYPE-03: the closed operand set must not let a `Number` outside it fall
# through to Base's `==(x, y) = x === y`, which answers `false` — a wrong
# answer rather than an error, and one `isequal` and `Dict` inherit.
@testitem "REQ-TYPE-03: comparing with an unsupported Number errors" begin
    using LibPARI

    g = LibPARI.Gen(6)
    @test_throws ArgumentError g == π
    @test_throws ArgumentError π == g
    # The supported set is unaffected.
    @test g == 6
    @test !(g == 7)
end
