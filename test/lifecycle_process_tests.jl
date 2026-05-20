# Child-process tests for PARI's process-global lifecycle. Each spawns a
# fresh Julia process so PARI is initialized from scratch (research.md D8).

@testitem "single initialization in a fresh process" begin
    using LibPARI

    project = pkgdir(LibPARI)
    code = """
    using LibPARI
    print(LibPARI.is_initialized(), ",",
          LibPARI.library_state() === LibPARI.LibraryState.INITIALIZED)
    """
    out = read(
        `$(Base.julia_cmd()) --project=$(project) --startup-file=no -e $(code)`,
        String,
    )
    @test strip(out) == "true,true"
end

@testitem "clean shutdown at process exit" begin
    using LibPARI

    project = pkgdir(LibPARI)

    # A process that loads LibPARI and exits normally exits cleanly — the
    # atexit `pari_close` handler runs without crashing.
    @test success(
        `$(Base.julia_cmd()) --project=$(project) --startup-file=no -e $("using LibPARI")`,
    )

    # Explicitly running the shutdown handler calls `pari_close` and
    # transitions the state to CLOSED, without error.
    code = """
    using LibPARI
    LibPARI._close_libpari!()
    print(LibPARI.library_state() === LibPARI.LibraryState.CLOSED)
    """
    out = read(
        `$(Base.julia_cmd()) --project=$(project) --startup-file=no -e $(code)`,
        String,
    )
    @test strip(out) == "true"

    # The shutdown handler is registered with `atexit` at initialization time.
    @test LibPARI._close_libpari! in Base.atexit_hooks
end

@testitem "custom PARI stack size via LIBPARI_STACK_SIZE" begin
    using LibPARI

    project = pkgdir(LibPARI)
    code = "using LibPARI; print(LibPARI.stack_size())"

    custom = 32 * 1024 * 1024
    out = withenv("LIBPARI_STACK_SIZE" => string(custom)) do
        read(
            `$(Base.julia_cmd()) --project=$(project) --startup-file=no -e $(code)`,
            String,
        )
    end
    @test parse(Int, strip(out)) == custom

    out_default = withenv("LIBPARI_STACK_SIZE" => nothing) do
        read(
            `$(Base.julia_cmd()) --project=$(project) --startup-file=no -e $(code)`,
            String,
        )
    end
    @test parse(Int, strip(out_default)) == 8 * 1024 * 1024
end

@testitem "invalid LIBPARI_STACK_SIZE fails the load" begin
    using LibPARI

    project = pkgdir(LibPARI)
    code = """
    try
        using LibPARI
        print("LOADED")
    catch
        print("CAUGHT")
    end
    """
    out = withenv("LIBPARI_STACK_SIZE" => "not-a-number") do
        read(
            `$(Base.julia_cmd()) --project=$(project) --startup-file=no -e $(code)`,
            String,
        )
    end
    @test strip(out) == "CAUGHT"
end
