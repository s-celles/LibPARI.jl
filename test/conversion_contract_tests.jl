# M12 — the conversion and promotion contracts (REQ-PROM-01 … REQ-PROM-11).
# The accepted input set is enumerated, documented and funnelled through one
# entry point; everything outside it fails at the conversion boundary with a
# named error rather than an obscure `MethodError` raised deep inside.

@testitem "REQ-PROM-01: one accepted-input set, one entry point" begin
    using LibPARI

    # The set is a documented union, and `gen_convert` is the single funnel.
    @test LibPARI.PariConvertible isa Union || LibPARI.PariConvertible isa Type
    @test LibPARI.gen_convert isa Function

    # Every route lands on the same value.
    @test LibPARI.gen_convert(42) == LibPARI.Gen(42)
    @test convert(LibPARI.Gen, 42) == LibPARI.Gen(42)

    # An existing Gen is returned as is — no second clone.
    g = LibPARI.Gen(42)
    @test LibPARI.gen_convert(g) === g

    @test (@inferred LibPARI.gen_convert(42)) isa LibPARI.Gen
    @test (@inferred LibPARI.gen_convert(g)) isa LibPARI.Gen
end

@testitem "REQ-PROM-02: the inward coverage matrix" begin
    using LibPARI
    T = LibPARI.PariType

    # Signed and unsigned fixed-width integers, of every width.
    for I in (Int8, Int16, Int32, Int64, Int128)
        g = LibPARI.gen_convert(I(-7))
        @test LibPARI.gentype(g) === T.T_INT
        @test BigInt(g) == -7
    end
    for U in (UInt8, UInt16, UInt32, UInt64, UInt128)
        g = LibPARI.gen_convert(U(7))
        @test LibPARI.gentype(g) === T.T_INT
        @test BigInt(g) == 7
    end

    # The extremes of the widest fixed-width types must survive exactly.
    @test BigInt(LibPARI.gen_convert(typemax(UInt128))) == big(typemax(UInt128))
    @test BigInt(LibPARI.gen_convert(typemin(Int128))) == big(typemin(Int128))

    # BigInt of a magnitude no machine word can hold.
    n = big(2)^300 + 1
    @test BigInt(LibPARI.gen_convert(n)) == n

    # Bool maps to t_INT 0/1 — PARI has no boolean type and Bool <: Integer.
    @test LibPARI.gentype(LibPARI.gen_convert(true)) === T.T_INT
    @test BigInt(LibPARI.gen_convert(true)) == 1
    @test BigInt(LibPARI.gen_convert(false)) == 0

    # Rationals, including a narrow element type.
    @test LibPARI.gentype(LibPARI.gen_convert(3 // 4)) === T.T_FRAC
    @test Rational(LibPARI.gen_convert(Rational{Int8}(3, 4))) == 3 // 4

    # Every IEEE float width, and BigFloat.
    for F in (Float16, Float32, Float64)
        @test LibPARI.gentype(LibPARI.gen_convert(F(1.5))) === T.T_REAL
        @test Float64(LibPARI.gen_convert(F(1.5))) == 1.5
    end
    @test LibPARI.gentype(LibPARI.gen_convert(big"1.5")) === T.T_REAL

    # Complex, when both components are supported.
    @test LibPARI.gentype(LibPARI.gen_convert(3 + 4im)) === T.T_COMPLEX
    @test Complex(LibPARI.gen_convert(3 + 4im)) == 3 + 4im
end

@testitem "REQ-PROM-03: an unsupported input fails at the boundary" begin
    using LibPARI

    # An Irrational has no exact PARI value: it needs a precision LibPARI
    # will not pick silently.
    @test_throws LibPARI.ConversionError LibPARI.gen_convert(π)
    @test_throws LibPARI.ConversionError LibPARI.Gen(π)

    # Not a number at all.
    @test_throws LibPARI.ConversionError LibPARI.gen_convert(missing)
    @test_throws LibPARI.ConversionError LibPARI.gen_convert("41")
    @test_throws LibPARI.ConversionError LibPARI.gen_convert(nothing)

    # The message must name the offending type and the extension point,
    # rather than a Base function the user never called.
    msg = try
        LibPARI.gen_convert(π)
        ""
    catch e
        sprint(showerror, e)
    end
    @test occursin("Irrational", msg)
    @test occursin("gen_convert", msg)
end

@testitem "REQ-PROM-06: the Number constructors Gen used to inherit" begin
    using LibPARI

    # These resolved through Base methods that applied only because
    # `Gen <: Number`; two of them were lossy. They must not come back.
    @test_throws Exception LibPARI.Gen('a')
    @test_throws Exception convert(LibPARI.Gen, 'a')
    @test_throws Exception convert(LibPARI.Gen, CartesianIndex(3))
    @test_throws Exception LibPARI.Gen(Base.TwicePrecision(1.0, 1e-30))
end

@testitem "REQ-PROM-08: the typed outward conversions" begin
    using LibPARI

    g = LibPARI.Gen(1) / LibPARI.Gen(2)

    # Narrow floats, previously MethodErrors.
    @test Float32(LibPARI.Gen(1.5)) === 1.5f0
    @test Float16(LibPARI.Gen(1.5)) === Float16(1.5)
    @test Float32(g) === 0.5f0

    # Typed rationals, and the untyped default.
    @test Rational{Int}(g) === 1 // 2
    @test Rational(g) isa Rational{BigInt}
    @test Rational(g) == 1 // 2

    # Typed complex, and the untyped default.
    @test Complex{Float64}(LibPARI.Gen(3 + 4im)) === ComplexF64(3, 4)
    @test Complex(LibPARI.Gen(3 + 4im)) isa Complex{Float64}
    @test Complex{BigFloat}(LibPARI.Gen(3 + 4im)) == big(3) + big(4)im

    # A value outside the target type is inexact, not silently truncated.
    @test_throws InexactError Rational{Int8}(LibPARI.Gen(1) / LibPARI.Gen(1000))
    @test_throws InexactError Int8(LibPARI.Gen(1000))
    @test_throws InexactError Int(g)
end

@testitem "REQ-PROM-09: integer constructors are enumerated" begin
    using LibPARI

    # The supported widths keep working, in both directions.
    for I in (Int8, Int16, Int32, Int64, Int128, UInt8, UInt16, UInt32)
        @test I(LibPARI.Gen(7)) === I(7)
    end
    @test BigInt(LibPARI.Gen(7)) == 7
    @test Bool(LibPARI.Gen(1)) === true
    @test Bool(LibPARI.Gen(0)) === false
    @test_throws InexactError Bool(LibPARI.Gen(2))

    # `Integer(g)` stays explicit and exact.
    @test Integer(LibPARI.Gen(7)) isa BigInt
    @test Integer(LibPARI.Gen(7)) == 7
end

@testitem "REQ-PROM-10: the Inf / NaN policy is pinned" begin
    using LibPARI

    # Neither has a PARI real counterpart; both are refused at the boundary
    # rather than reaching `dbltor` and surfacing as a PARI overflow.
    @test_throws InexactError LibPARI.Gen(Inf)
    @test_throws InexactError LibPARI.Gen(-Inf)
    @test_throws InexactError LibPARI.Gen(NaN)
    @test_throws InexactError LibPARI.Gen(big(Inf))
    @test_throws InexactError LibPARI.gen_convert(Inf)

    # A finite float of the same width is unaffected.
    @test Float64(LibPARI.Gen(floatmax(Float64))) === floatmax(Float64)
end

@testitem "REQ-PROM-05: promotion no longer promises what it cannot do" begin
    using LibPARI

    # An array literal still types as Vector{Gen} — the reason the rules
    # survive at all.
    v = [LibPARI.Gen(1), 2]
    @test v isa Vector{LibPARI.Gen}
    @test promote_type(LibPARI.Gen, Int) === LibPARI.Gen

    # But no rule claims a type LibPARI cannot convert: promotion simply
    # finds none (it must not recurse into a StackOverflowError), and the
    # conversion itself reports the type it cannot handle.
    @test promote_type(LibPARI.Gen, typeof(π)) === Any
    @test_throws LibPARI.ConversionError convert(LibPARI.Gen, π)
end

@testitem "REQ-PROM-01: gen_convert is the documented extension point" begin
    using LibPARI

    # A downstream package adds support for its own type by extending
    # `gen_convert` — legal for it, piracy-free for LibPARI. Simulate that.
    struct FakeUnit <: Number
        v::Int
    end
    LibPARI.gen_convert(x::FakeUnit) = LibPARI.Gen(x.v)

    @test LibPARI.gen_convert(FakeUnit(7)) == LibPARI.Gen(7)
end
