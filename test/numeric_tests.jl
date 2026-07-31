# M6 — idiomatic numeric API: arithmetic operators, mixed-type operands,
# equality, and display continuity. M11 withdrew the `Gen <: Number` claim
# these tests were written against; the operators themselves are unchanged.

# REQ-TYPE-01 supersedes REQ-API-01 (`Gen <: Number`, M6/0.7.0): one
# concrete `Gen` wraps every PARI object, so it is a `PariObject`. The
# `Gen <: PariObject` half is asserted in test/type_contract_tests.jl.
@testitem "Gen's declared supertype" begin
    using LibPARI

    @test !(LibPARI.Gen <: Number)
    @test isconcretetype(LibPARI.Gen)
end

@testitem "arithmetic operators compute through PARI" begin
    using LibPARI

    a = LibPARI.Gen(20)
    b = LibPARI.Gen(8)

    @test a + b isa LibPARI.Gen
    @test BigInt(a + b) == 28
    @test BigInt(a - b) == 12
    @test BigInt(a * b) == 160
    @test BigInt(a ^ 3) == 8000
    @test BigInt(-a) == -20

    # `/` is PARI's exact division — a rational when not evenly divisible.
    @test string(a / b) == "5/2"
    @test BigInt(LibPARI.Gen(12) / LibPARI.Gen(4)) == 3
end

@testitem "exponentiation: integer, zero, and negative powers" begin
    using LibPARI

    @test BigInt(LibPARI.Gen(2) ^ 10) == 1024
    @test BigInt(LibPARI.Gen(5) ^ 0) == 1
    @test string(LibPARI.Gen(2) ^ -2) == "1/4"

    n = 7                                  # variable exponent
    @test BigInt(LibPARI.Gen(3) ^ n) == 2187
end

# REQ-TYPE-02 supersedes the `promote`-based routing this asserted: the
# mixed operators are now explicit `(Gen, Number)` / `(Number, Gen)`
# methods. The computed values below are unchanged by that.
@testitem "mixed Gen / Julia-number arithmetic" begin
    using LibPARI

    g = LibPARI.Gen(100)

    # Integer operand, both orders.
    @test g + 5 isa LibPARI.Gen
    @test BigInt(g + 5) == 105
    @test BigInt(5 + g) == 105
    @test BigInt(g - 1) == 99
    @test BigInt(2 * g) == 200
    @test BigInt(g * 2) == 200

    # Floating-point operand — promoted to a PARI real.
    @test g + 1.5 isa LibPARI.Gen
    @test string(g + 1.5) == string(LibPARI.Gen(100) + LibPARI.Gen(1.5))

    # Rational operand — promoted to a PARI rational.
    @test BigInt(g * (3 // 4)) == 75
    @test BigInt((3 // 4) * g) == 75
    @test string(g / 8) == string(LibPARI.Gen(100) / LibPARI.Gen(8))
end

@testitem "== returns PARI's mathematical-equality result" begin
    using LibPARI

    @test LibPARI.Gen(7) == LibPARI.Gen(7)
    @test (LibPARI.Gen(7) == LibPARI.Gen(8)) == false
    @test LibPARI.Gen(7) != LibPARI.Gen(8)

    # Mixed Gen / Julia-number equality, in either order. REQ-TYPE-03
    # supersedes promotion here with explicit `==` methods — without them
    # Base's `==(x, y) = x === y` fallback answers `false` silently.
    @test LibPARI.Gen(42) == 42
    @test 0 == LibPARI.Gen(0)

    # PARI's equality is across types — an integer equals an equal real.
    @test LibPARI.Gen(2) == LibPARI.Gen(2.0)
end

@testitem "a Gen still displays as PARI text under its new supertype" begin
    using LibPARI

    @test !(LibPARI.Gen <: Number)          # REQ-TYPE-01
    @test string(LibPARI.Gen(123)) == "123"
    @test sprint(show, LibPARI.Gen(-9)) == "-9"
    @test string(LibPARI.Gen(1) / LibPARI.Gen(4)) == "1/4"
end
