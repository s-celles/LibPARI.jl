# M5 — type conversions: Julia integers ↔ `Gen`, the textual representation,
# and lossy-conversion behaviour.

@testitem "Gen(::Integer) builds an integer-valued Gen" begin
    using LibPARI

    for x in (0, 1, -1, 42, -42, typemax(Int), typemin(Int))
        g = LibPARI.Gen(x)
        @test g isa LibPARI.Gen
        @test LibPARI.gentype(g) === LibPARI.PariType.T_INT
    end
end

@testitem "integers round-trip Julia -> Gen -> BigInt losslessly" begin
    using LibPARI

    vals = [
        0,
        1,
        -1,
        7,
        -7,
        typemax(Int),
        typemin(Int),    # stoi (signed word)
        big(2)^63,                     # utoi (unsigned word)
        big(2)^64,
        -(big(2)^64),       # strtoi (arbitrary)
        big(2)^200 + 1,
        -(big(2)^200) - 1,
        big(10)^100,
    ]
    for x in vals
        @test BigInt(LibPARI.Gen(x)) == x
    end
end

@testitem "Gen <-> integer preserves sign and zero" begin
    using LibPARI

    @test BigInt(LibPARI.Gen(0)) == 0
    @test BigInt(LibPARI.Gen(-1)) == -1
    @test BigInt(LibPARI.Gen(big(-10)^99)) == big(-10)^99

    # `convert(Gen, x)` is the conversion-protocol entry point.
    @test convert(LibPARI.Gen, 555) isa LibPARI.Gen
    @test BigInt(convert(LibPARI.Gen, 555)) == 555
end

@testitem "a Gen renders as PARI's own text" begin
    using LibPARI

    lib = LibPARI.PARI_jll.libpari

    # An integer Gen renders through `string`, `show`, and interpolation.
    @test string(LibPARI.Gen(123456789)) == "123456789"
    @test string(LibPARI.Gen(-7)) == "-7"
    @test sprint(show, LibPARI.Gen(42)) == "42"
    @test "$(LibPARI.Gen(2024))" == "2024"

    # A non-integer Gen (1/2) must match PARI's own `GENtostr` output.
    half = LibPARI.PARI.gdiv(LibPARI.Gen(1), LibPARI.Gen(2))
    raw = ccall((:GENtostr, lib), Cstring, (Ptr{Int},), half.ptr)
    expected = unsafe_string(raw)
    ccall((:pari_free, lib), Cvoid, (Cstring,), raw)
    @test string(half) == expected
    @test occursin("/", string(half))
end

@testitem "lossy Gen -> integer conversions raise InexactError" begin
    using LibPARI

    half = LibPARI.PARI.gdiv(LibPARI.Gen(1), LibPARI.Gen(2))    # 1/2

    # Non-integral value → InexactError.
    @test_throws InexactError BigInt(half)
    @test_throws InexactError Int(half)

    # Integer too large for a fixed-width target → InexactError.
    @test_throws InexactError Int8(LibPARI.Gen(1000))
    @test_throws InexactError Int(LibPARI.Gen(big(2)^200))

    # Exact, in-range conversions succeed.
    @test Int(LibPARI.Gen(127)) == 127
    @test Int8(LibPARI.Gen(-128)) == -128
    @test UInt8(LibPARI.Gen(255)) == 255
    @test convert(Int, LibPARI.Gen(99)) == 99

    # The library stays usable after a raised conversion.
    try
        BigInt(half)
    catch e
        e isa InexactError || rethrow(e)
    end
    @test BigInt(LibPARI.Gen(99)) == 99
end

@testitem "an integral real-typed Gen converts; a fractional one raises" begin
    using LibPARI

    lib = LibPARI.PARI_jll.libpari
    PT = LibPARI.PariType

    three =
        LibPARI.gen_from(() -> ccall((:dbltor, lib), Ptr{Int}, (Cdouble,), 3.0))
    @test LibPARI.gentype(three) === PT.T_REAL
    @test BigInt(three) == 3

    threehalf =
        LibPARI.gen_from(() -> ccall((:dbltor, lib), Ptr{Int}, (Cdouble,), 3.5))
    @test_throws InexactError BigInt(threehalf)
end
