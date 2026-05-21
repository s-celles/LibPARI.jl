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

    # NOTE — concurrent PARI *error* handling is a separate follow-up
    # milestone: it needs the libpari call layer routed through a pure-C
    # error trap (see upstream-bugs.md). Until then, PARI errors use the
    # milestone-M3 callback, which is single-threaded-safe only — so a
    # concurrent-error testset is deliberately not exercised here.

    # --- PARALLELISM (feature 013) ----------------------------------------

    @testset "concurrent calls run in parallel across threads" begin
        # A fixed body of independent PARI work. Run it on one thread, then
        # the same total work spread across all threads. With one PARI
        # context per OS thread the spread run uses multiple cores and is
        # measurably faster; before feature 013 the two were equal (every
        # call serialized onto a single worker).
        unit() = for _ = 1:120
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
            # Conservative: a clear margin above 1x proves the single-worker
            # bottleneck is gone. Robust on low-core / loaded CI runners.
            @test speedup > 1.3
        end
    end
end
