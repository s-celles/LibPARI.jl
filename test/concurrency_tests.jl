# M9 — concurrency stress test.
#
# Run multi-threaded, as its own step:
#     julia --project=. --threads=auto test/concurrency_tests.jl
#
# This is intentionally a standalone `@testset` script, NOT a `@testitem`:
# the `@run_package_tests` suite (test/runtests.jl) runs single-threaded —
# the TestItemRunner harness on Julia 1.12 has a concurrent-compilation
# crash under multi-threaded Julia. LibPARI's `libpari` calls are themselves
# thread-safe (M9): every call is marshalled onto one dedicated worker task,
# so this stress test passes reliably when run multi-threaded on its own.

using Test
using LibPARI

@testset "M9 — concurrency hardening" begin
    if Threads.nthreads() == 1
        @warn "concurrency_tests.jl ran single-threaded — start Julia with " *
              "`--threads=auto` for a meaningful concurrency test"
    end

    @testset "concurrent LibPARI calls are correct across threads" begin
        n = 400
        sums = Vector{BigInt}(undef, n)
        types_ok = Vector{Bool}(undef, n)

        # Each task writes a distinct index — no data race on the result
        # arrays; the LibPARI calls themselves are serialized by the worker.
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
        # (gunclone) — all serialized onto the worker.
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
end
