# Concurrency stress test.
#
# Run multi-threaded, as its own step:
#     julia --project=. --threads=auto test/concurrency_tests.jl
#
# This is intentionally a standalone `@testset` script, NOT a `@testitem`:
# the `@run_package_tests` suite (test/runtests.jl) runs single-threaded —
# the TestItemRunner harness on Julia 1.12 has a concurrent-compilation
# crash under multi-threaded Julia.
#
# It checks both halves of LibPARI's concurrency contract:
#   * SAFETY (the M9 guarantees, kept as regression guards) — concurrent
#     calls correct, concurrent `Gen` construction/finalization leak-safe;
#   * PARALLELISM (feature 013) — with one PARI context per Julia OS thread,
#     concurrent `libpari` calls run on multiple cores, so a fixed body of
#     work spread across threads is measurably faster than on one thread.

using Test
using LibPARI

@testset "LibPARI concurrency" begin
    nt = Threads.nthreads()
    if nt == 1
        @warn "concurrency_tests.jl ran single-threaded — start Julia with " *
              "`--threads=auto` for a meaningful concurrency test"
    end

    # --- SAFETY (M9 regression guards) -------------------------------------

    @testset "concurrent LibPARI calls are correct across threads" begin
        n = 400
        sums = Vector{BigInt}(undef, n)
        types_ok = Vector{Bool}(undef, n)

        # Each task writes a distinct index — no data race on the result
        # arrays; each PARI operation runs atomically on one context.
        Threads.@threads for i = 1:n
            a = LibPARI.Gen(i)
            b = a * a + LibPARI.Gen(1)                  # i^2 + 1
            c = LibPARI.gp_eval("$(i) + 1")             # i + 1
            d = LibPARI.PARI.nextprime(LibPARI.Gen(i))  # a generated binding
            types_ok[i] = LibPARI.gentype(d) === LibPARI.PariType.T_INT
            sums[i] = BigInt(b) + BigInt(c)
        end

        @test all(types_ok)
        @test all(sums[i] == big(i)^2 + 1 + i + 1 for i = 1:n)
    end

    @testset "concurrent Gen construction and finalization is leak-safe" begin
        # Many threads churn short-lived Gens, forcing concurrent
        # construction (gclone) and, after GC, concurrent finalization
        # (gunclone) — gclone/gunclone funnelled to the primary worker.
        ok = Threads.Atomic{Int}(0)
        Threads.@threads for _ = 1:2000
            g = LibPARI.Gen(rand(1:10_000))
            if LibPARI.gentype(g) === LibPARI.PariType.T_INT
                Threads.atomic_add!(ok, 1)
            end
        end
        @test ok[] == 2000

        GC.gc()
        # The library is still usable after concurrent churn and finalization.
        @test BigInt(LibPARI.Gen(42)) == 42
    end

    @testset "a Gen created on one thread is finalized cleanly on another" begin
        # Build Gens on every thread, hand them to a single collector, drop
        # them, and force GC — finalization runs on arbitrary threads and
        # must free each clone exactly once (no leak, no double free).
        pool = Vector{LibPARI.Gen}(undef, 2000)
        Threads.@threads for i = 1:2000
            pool[i] = LibPARI.Gen(big(10)^30 + i)
        end
        @test all(BigInt(pool[i]) == big(10)^30 + i for i = 1:2000)
        empty!(pool)
        GC.gc()
        GC.gc()
        @test BigInt(LibPARI.Gen(7)) == 7   # library still healthy
    end

    # --- CONCURRENT ERRORS (feature 014) ----------------------------------

    @testset "PARI errors raised concurrently are caught safely" begin
        # Half the tasks trigger a PARI error (1/0), half do valid work,
        # interleaved across threads. Every error is caught as a `PariError`,
        # every valid result is correct — no crash, no hang (FR-001..003).
        errs = Threads.Atomic{Int}(0)
        good = Threads.Atomic{Int}(0)
        Threads.@threads for i = 1:400
            if iseven(i)
                try
                    LibPARI.gp_eval("1/0")
                catch e
                    e isa LibPARI.PariError && Threads.atomic_add!(errs, 1)
                end
            else
                BigInt(LibPARI.Gen(i)) == i && Threads.atomic_add!(good, 1)
            end
        end
        @test errs[] == 200
        @test good[] == 200
    end

    @testset "the library stays healthy after concurrent error bursts" begin
        # Sustained bursts of concurrent errors interleaved with valid work,
        # repeated — every context must stay usable afterward (FR-004).
        for _ = 1:10
            ok = Threads.Atomic{Int}(0)
            Threads.@threads for i = 1:200
                try
                    if iseven(i)
                        LibPARI.gp_eval("1/0")                     # error
                    else
                        d = LibPARI.PARI.nextprime(LibPARI.Gen(10_000 + i))
                        LibPARI.gentype(d) === LibPARI.PariType.T_INT &&
                            Threads.atomic_add!(ok, 1)
                    end
                catch e
                    e isa LibPARI.PariError && Threads.atomic_add!(ok, 1)
                end
            end
            @test ok[] == 200
        end
        # Every context is still usable after the bursts.
        @test BigInt(LibPARI.Gen(2)^60) == big(2)^60
        @test BigInt(LibPARI.gp_eval("factor(360)[1,1]")) == 2
    end

    # --- PARALLELISM (feature 013) ----------------------------------------

    @testset "concurrent calls run in parallel across threads" begin
        # A fixed body of independent PARI work. Run it on one thread, then
        # the same total work spread across all threads. With one PARI
        # context per OS thread the spread run uses multiple cores and is
        # measurably faster; before feature 013 the two were equal (every
        # call serialized onto a single worker).
        unit() =
            for _ = 1:120
                LibPARI.gp_eval("factor(2^79 - 1)")
            end

        unit()                                   # warm up compilation
        t_serial = @elapsed for _ = 1:nt
            unit()
        end
        t_parallel = @elapsed Threads.@threads for _ = 1:nt
            unit()
        end

        speedup = t_serial / t_parallel
        @info "concurrency speedup" threads = nt t_serial t_parallel speedup
        if nt == 1
            @test speedup > 0          # trivially — nothing to parallelize
        else
            # The single-worker bottleneck is gone when the parallel run
            # is measurably faster than serial. Threshold is intentionally
            # close to 1× — CI runners with 2–3 vCPUs under load measured
            # speedups around 1.2 (the macOS-latest job in run
            # 26941877211 saw 1.21 with `threads = 3`). A higher bar would
            # be true-positive on a dev box but flaky on CI.
            @test speedup > 1.05
        end
    end
end
