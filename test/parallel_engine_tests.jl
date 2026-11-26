# PARI's own parallel engine (`--mt=pthread`). LibPARI starts PARI with
# `INIT_noIMTm` and pins `nbthreads` to 1; `set_nbthreads!` raises it. PARI
# then runs its parallel GP functions (`parapply`, `parsum`, ...) and its
# internally parallel algorithms on worker pthreads it creates for each
# parallel section — from the primary context only (PARI counts every
# secondary context as one of its workers, and does not nest).
#
# An error inside a parallel section is caught as a `PariError`, but PARI
# leaves the section open (`pari_CATCH` does not reset its parallel state):
# later parallel calls would silently run serially. LibPARI resets it.

@testitem "set_nbthreads! sets PARI's parallel width, returns the old one" begin
    using LibPARI
    if LibPARI._TRAP_AVAILABLE[]
        @test LibPARI.nbthreads() == 1
        @test LibPARI.set_nbthreads!(3) == 1
        @test LibPARI.nbthreads() == 3
        @test LibPARI.set_nbthreads!(1) == 3
        @test LibPARI.nbthreads() == 1
    end
    @test_throws ArgumentError LibPARI.set_nbthreads!(0)
    @test LibPARI.nbthreads() == 1
end

@testitem "parallel GP functions agree with their serial versions" begin
    using LibPARI
    if LibPARI._TRAP_AVAILABLE[]
        LibPARI.set_nbthreads!(4)
        try
            @test gp_eval(
                "parapply(n -> #factor(2^100 + 2*n + 1)[,1], [1..16])",
            ) == gp_eval("apply(n -> #factor(2^100 + 2*n + 1)[,1], [1..16])")
            @test gp_eval("parsum(n = 1, 200, n^3)") ==
                  gp_eval("sum(n = 1, 200, n^3)")
            @test gp_eval("isprime(nextprime(10^60), 2)") == gp_eval("1")
        finally
            LibPARI.set_nbthreads!(1)
        end
    else
        @test true
    end
end

@testitem "an error in a parallel section leaves the engine usable" begin
    using LibPARI
    if LibPARI._TRAP_AVAILABLE[]
        LibPARI.set_nbthreads!(4)
        try
            @test_throws PariError gp_eval(
                "parapply(n -> if(n == 5, 1/0, n), [1..16])",
            )
            # The section PARI left open has been closed again ...
            @test !LibPARI._mt_is_parallel()
            # ... so the next parallel call runs (in parallel) and is right.
            @test gp_eval("parapply(n -> n^2, [1..8])") ==
                  gp_eval("apply(n -> n^2, [1..8])")
            @test !LibPARI._mt_is_parallel()
        finally
            LibPARI.set_nbthreads!(1)
        end
    else
        @test true
    end
end

@testitem "the engine runs a parallel section on extra OS threads" begin
    using LibPARI
    # Counting OS threads needs /proc; elsewhere the tests above cover
    # correctness. The count is sampled from another Julia thread while the
    # primary runs the section, so this runs in a child with 3 threads (the
    # test process may have only one, the primary's).
    if Sys.islinux()
        project = pkgdir(LibPARI)
        code = """
        using LibPARI
        const L = LibPARI
        L._TRAP_AVAILABLE[] || (print("no-trap"); exit(0))
        ostasks() = length(readdir("/proc/self/task"))
        primary = L._PARI_PRIMARY[]
        L.set_nbthreads!(4)
        before = ostasks()
        peak = Threads.Atomic{Int}(before)
        work = "parapply(n -> #factor(2^150 + 2*n + 1)[,1], [1..32])"
        section = @async L.gp_eval(work)       # runs on the primary context
        Threads.@threads :static for i = 1:Threads.nthreads()
            Threads.threadid() == primary && continue
            while !istaskdone(section)
                Threads.atomic_max!(peak, ostasks())
                sleep(0.002)
            end
        end
        wait(section)
        print(before, ",", peak[], ",", ostasks())
        """
        out = strip(
            read(
                `$(Base.julia_cmd()) --project=$(project) --startup-file=no --threads=3 -e $(code)`,
                String,
            ),
        )
        if out == "no-trap"
            @test true
        else
            before, peak, after = parse.(Int, split(out, ","))
            @test peak >= before + 3     # PARI's worker pthreads
            @test after <= before + 1    # and they are gone again
        end
    else
        @test true
    end
end

@testitem "without the trap shim, set_nbthreads! refuses to start the engine" begin
    using LibPARI
    project = pkgdir(LibPARI)
    code = """
    using LibPARI
    msg = try
        LibPARI.set_nbthreads!(2); "no error"
    catch e
        sprint(showerror, e)
    end
    print(LibPARI.nbthreads(), "|", msg)
    """
    cmd = addenv(
        `$(Base.julia_cmd()) --project=$(project) --startup-file=no -e $(code)`,
        "LIBPARI_DISABLE_TRAP" => "1",
    )
    n, msg = split(read(cmd, String), "|"; limit = 2)
    @test n == "1"
    @test occursin("trap shim", msg)
    @test occursin("LIBPARI_DISABLE_TRAP", msg)   # says why it is not in use
end
