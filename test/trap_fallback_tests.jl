# Without the C trap shim, a PARI error raised on a secondary PARI context
# crashed the process: `pari_err` calls `mt_err_recover` before LibPARI's
# fallback callback, and `pari_thread_start` marks every secondary context
# as a worker of PARI's parallel engine, so `mt_err_recover` dereferences
# PARI's (NULL) parallel state. Seen on Windows CI, where the shim is not
# available (PR #9); reproducible anywhere by disabling the shim.
#
# LibPARI therefore starts no secondary context when the shim is missing:
# every call runs on the primary context, serially, and errors from any
# thread stay catchable. `LIBPARI_DISABLE_TRAP=1` forces that mode, so this
# runs on every platform. A child process is needed: the mode is chosen once,
# when the worker pool starts.

@testitem "without the trap shim, concurrent errors are caught, not fatal" begin
    using LibPARI

    project = pkgdir(LibPARI)
    code = """
    using LibPARI
    nworkers = count(!isnothing, LibPARI._PARI_WORKERS[])
    errs = Threads.Atomic{Int}(0)
    vals = Threads.Atomic{Int}(0)
    Threads.@threads for i = 1:128
        try
            LibPARI.gp_eval(iseven(i) ? "1/0" : "x^2 + 1")
            Threads.atomic_add!(vals, 1)
        catch e
            e isa LibPARI.PariError && Threads.atomic_add!(errs, 1)
        end
    end
    print(LibPARI._TRAP_AVAILABLE[], ",", Threads.nthreads(), ",", nworkers,
          ",", errs[], ",", vals[])
    """
    cmd = addenv(
        `$(Base.julia_cmd()) --project=$(project) --startup-file=no --threads=4 -e $(code)`,
        "LIBPARI_DISABLE_TRAP" => "1",
    )
    out = read(cmd, String)
    trap, nthreads, nworkers, errs, vals = split(strip(out), ",")

    @test trap == "false"
    @test nthreads == "4"
    # One worker — the primary context — serves every thread.
    @test nworkers == "1"
    # Every `1/0` is a caught `PariError`; every `x^2 + 1` evaluates, since
    # it runs on the primary context, where reading `x` is allowed.
    @test errs == "64"
    @test vals == "64"
end

@testitem "the trap shim reports its status" begin
    using LibPARI

    status = LibPARI._TRAP_STATUS[]
    @info "trap shim status" available = LibPARI._TRAP_AVAILABLE[] status
    if LibPARI._TRAP_AVAILABLE[]
        @test status == "loaded"
    else
        @test !isempty(status) && status != "loaded"
    end

    # Disabling it says so, instead of failing silently.
    project = pkgdir(LibPARI)
    code = "using LibPARI; print(LibPARI._TRAP_STATUS[])"
    cmd = addenv(
        `$(Base.julia_cmd()) --project=$(project) --startup-file=no -e $(code)`,
        "LIBPARI_DISABLE_TRAP" => "1",
    )
    @test occursin("LIBPARI_DISABLE_TRAP", read(cmd, String))
end

@testitem "a C compiler on the PATH yields a working trap shim" begin
    using LibPARI

    compiler = findfirst(!isnothing, Sys.which.(["cc", "gcc", "clang"]))
    if compiler === nothing
        @info "no C compiler on the PATH: the trap shim cannot be built here"
        @test !LibPARI._TRAP_AVAILABLE[]
    else
        # Built, loaded, and actually catching: the self-test raises a PARI
        # error through the shim and checks the shim's own path caught it
        # (a shim whose `iferr_env` is not libpari's — e.g. a separate
        # thread-local runtime — would let the error reach the fallback).
        @test LibPARI._TRAP_AVAILABLE[]
        @test LibPARI._run_on_primary(LibPARI._trap_selftest)
    end
end
