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

@testitem "nbthreads is never left at 0 (parallel dispatch would segfault)" begin
    using LibPARI

    # `_INIT_OPTS` sets `INIT_noIMTm`, which stops PARI's pthread engine from
    # starting. That is deliberate: LibPARI parallelises at the Julia level,
    # one PARI context per OS thread, and does not want PARI starting threads
    # underneath it.
    #
    # But `INIT_noIMTm` alone leaves `nbthreads` at 0, and PARI's parallel code
    # paths do not read 0 as "serial" — they dispatch into a worker pool that
    # was never created, and dereference it. `qflll` reaches one of those paths
    # (`ZM_flatter` → `FpM_ratlift_parallel`) on a large structured lattice,
    # and the result is a SIGSEGV: not a PARI error, so the trap never sees it,
    # so it is not catchable and the whole process dies.
    #
    # `gp` itself never holds 0 — it always starts the engine — so the
    # combination is untested territory in PARI. `1` means "no parallel
    # dispatch", which is exactly what `INIT_noIMTm` intends.
    @test LibPARI.nbthreads() >= 1
end

@testitem "qflll survives a large structured lattice" begin
    using LibPARI

    # The regression guard for the issue above. This is a Coppersmith
    # (Howgrave-Graham) lattice: dimension 18, entries spanning some 9000 bits
    # — the shape that pushes `qflll` onto PARI's `ZM_flatter` path. Smaller
    # ones (dimension 12, 15) stay on the classical LLL and do NOT reproduce,
    # so the size here is load-bearing, not arbitrary.
    #
    # With `nbthreads == 0` this does not fail, it *crashes the process*, so
    # the test is a canary: if it ever stops passing, it will do so by taking
    # the test run down with it.
    function hg_lattice(N::BigInt, X::BigInt, f::Vector{BigInt}, m::Int)
        d = length(f) - 1
        n = d * m
        rows = Vector{Vector{BigInt}}()
        fpow = BigInt[1]
        for i = 0:(m-1)
            for j = 0:(d-1)
                g = zeros(BigInt, n)
                for (k, c) in enumerate(fpow)
                    deg = (k - 1) + j
                    deg < n && (g[deg+1] += N^(m - 1 - i) * c)
                end
                push!(rows, g)
            end
            nxt = zeros(BigInt, length(fpow) + d)
            for (k, c) in enumerate(fpow), (l, e) in enumerate(f)
                nxt[k+l-1] += c * e
            end
            fpow = nxt
        end
        return [rows[i][k] * X^(k - 1) for i = 1:n, k = 1:n]
    end

    N = BigInt(gp_eval("nextprime(2^256) * nextprime(2^256 + 1000)"))
    a = big(3)^300
    m, n = 6, 18
    B = hg_lattice(N, big(2)^130, BigInt[a^3, 3a^2, 3a, 1], m)
    src = "[" * join([join(string.(B[:, k]), ", ") for k = 1:n], "; ") * "]"

    T = LibPARI.PARI.qflll0(gp_eval(src))
    @test size(T) == (n, n)
    @test abs(BigInt(LibPARI.PARI.det0(T))) == 1     # unimodular
end
