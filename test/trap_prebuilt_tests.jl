# The prebuilt trap shim. PARI_jll (from 200.1900.101) ships the shim as its
# `libpari_trap` product, built from s-celles/libpari-trap. LibPARI
# uses it in preference to compiling the shim at load, so a machine without a
# C compiler (typically Windows) still gets one PARI context per thread and
# PARI's parallel engine. `LIBPARI_TRAP_COMPILE=1` compiles at load instead
# (for work on the C file itself). Either way the shim must report
# `_TRAP_ABI` and pass the self-test.

@testitem "the trap shim records where it came from" begin
    using LibPARI
    origin = LibPARI._TRAP_ORIGIN[]
    @test origin in (:prebuilt, :compiled, :none)
    @test (origin == :none) == !LibPARI._TRAP_AVAILABLE[]
    if isdefined(LibPARI.PARI_jll, :libpari_trap) &&
       get(ENV, "LIBPARI_TRAP_COMPILE", "") != "1" &&
       get(ENV, "LIBPARI_DISABLE_TRAP", "") != "1"
        @test origin == :prebuilt
    end
end

@testitem "without a C compiler, the prebuilt shim gives per-thread contexts" begin
    using LibPARI
    if isdefined(LibPARI.PARI_jll, :libpari_trap)
        project = pkgdir(LibPARI)
        code = """
        using LibPARI
        print(LibPARI._TRAP_ORIGIN[], ",",
              count(!isnothing, LibPARI._PARI_WORKERS[]) > 1, ",",
              something(Sys.which("cc"), Sys.which("gcc"), Sys.which("clang"), "none"))
        """
        # A PATH holding only Julia's own directory: no C compiler.
        cmd = addenv(
            `$(Base.julia_cmd()) --project=$(project) --startup-file=no --threads=4 -e $(code)`,
            "PATH" => Sys.BINDIR,
        )
        origin, perthread, cc = split(read(cmd, String), ",")
        @test cc == "none"
        @test origin == "prebuilt"
        @test perthread == "true"
    else
        @info "PARI_jll ships no libpari_trap (needs >= 200.1900.101)"
        @test true
    end
end

@testitem "LIBPARI_TRAP_COMPILE=1 compiles the shim at load instead" begin
    using LibPARI
    project = pkgdir(LibPARI)
    code = "using LibPARI; print(LibPARI._TRAP_ORIGIN[], \",\", LibPARI._TRAP_STATUS[])"
    cmd = addenv(
        `$(Base.julia_cmd()) --project=$(project) --startup-file=no -e $(code)`,
        "LIBPARI_TRAP_COMPILE" => "1",
    )
    origin, status = split(read(cmd, String), ","; limit = 2)
    if something(Sys.which("cc"), Sys.which("gcc"), Sys.which("clang"), "") !=
       ""
        @test origin == "compiled"
        @test status == "loaded"
    else
        @test origin == "none"
    end
end
