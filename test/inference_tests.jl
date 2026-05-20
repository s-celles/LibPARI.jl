# M8 — type-stability audit. `@inferred` over a representative binding of
# each return convention and over every hand-written public function, plus a
# check that the precompilation workload is present.

@testitem "generated bindings are type-stable" begin
    using LibPARI

    g = LibPARI.Gen(1000)

    # Gen-returning binding.
    @test (@inferred LibPARI.PARI.nextprime(g)) isa LibPARI.Gen
    # Scalar-returning binding.
    @test (@inferred LibPARI.PARI.getabstime()) isa Int
    # Void-returning binding.
    @test (@inferred LibPARI.PARI.setrand(LibPARI.Gen(1))) === nothing
    # Output-argument binding — returns a result tuple.
    @test (@inferred LibPARI.PARI.issquareall(LibPARI.Gen(49))) isa Tuple
end

@testitem "conversions and the evaluator are type-stable" begin
    using LibPARI

    g = LibPARI.Gen(42)

    @test (@inferred LibPARI.Gen(7)) isa LibPARI.Gen
    @test (@inferred LibPARI.Gen(1.5)) isa LibPARI.Gen
    @test (@inferred LibPARI.Gen(3 // 4)) isa LibPARI.Gen
    @test (@inferred BigInt(g)) isa BigInt
    @test (@inferred Int(g)) isa Int
    @test (@inferred string(g)) isa String
    @test (@inferred LibPARI.gp_eval("2 + 2")) isa LibPARI.Gen
end

@testitem "arithmetic operators and equality are type-stable" begin
    using LibPARI

    a = LibPARI.Gen(6)
    b = LibPARI.Gen(7)

    @test (@inferred a + b) isa LibPARI.Gen
    @test (@inferred a - b) isa LibPARI.Gen
    @test (@inferred a * b) isa LibPARI.Gen
    @test (@inferred a / b) isa LibPARI.Gen
    @test (@inferred a^3) isa LibPARI.Gen
    @test (@inferred -a) isa LibPARI.Gen
    @test (@inferred (a == b)) isa Bool
end

@testitem "the lifecycle and introspection API is type-stable" begin
    using LibPARI

    @test (@inferred LibPARI.is_initialized()) isa Bool
    @test (@inferred LibPARI.library_state()) isa LibPARI.LibraryState.T
    @test (@inferred LibPARI.stack_size()) isa Integer
end

@testitem "a PrecompileTools workload is present and precompilation succeeded" begin
    using LibPARI

    path = joinpath(pkgdir(LibPARI), "src", "precompile.jl")
    @test isfile(path)
    @test occursin("@compile_workload", read(path, String))

    # The package loaded — precompilation completed successfully with the
    # workload active.
    @test LibPARI.is_initialized()
end
