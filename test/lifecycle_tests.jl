@testitem "PARI is initialized after load" begin
    using LibPARI

    @test LibPARI.is_initialized()
    @test LibPARI.library_state() === LibPARI.LibraryState.INITIALIZED
end

@testitem "stack-size validation rejects invalid input" begin
    using LibPARI

    @test_throws ArgumentError LibPARI._validate_parisize(-1)
    @test_throws ArgumentError LibPARI._validate_parisize(0)
    @test_throws ArgumentError LibPARI._validate_parisize(1024)  # < 1 MiB
    @test LibPARI._validate_parisize(8 * 1024 * 1024) == 8 * 1024 * 1024
end

@testitem "stack-size configuration parsing" begin
    using LibPARI

    withenv("LIBPARI_STACK_SIZE" => nothing) do
        @test LibPARI._configured_stack_size() == 8 * 1024 * 1024
    end
    withenv("LIBPARI_STACK_SIZE" => string(16 * 1024 * 1024)) do
        @test LibPARI._configured_stack_size() == 16 * 1024 * 1024
    end
    withenv("LIBPARI_STACK_SIZE" => "not-a-number") do
        @test_throws ArgumentError LibPARI._configured_stack_size()
    end
end

@testitem "stack_size reports the PARI main-stack size" begin
    using LibPARI

    @test LibPARI.stack_size() isa Int
    @test LibPARI.stack_size() >= 1024 * 1024
end
