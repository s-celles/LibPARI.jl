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
