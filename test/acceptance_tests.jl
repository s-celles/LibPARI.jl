# ---------------------------------------------------------------------------
# M10 — non-functional acceptance (NFR-01 … NFR-04).
#
# One `@testitem` per non-functional requirement, each naming its NFR. These
# checks verify properties delivered across M0–M9; M10 collects them into one
# NFR-traced acceptance suite so the project's non-functional contract is
# auditable at a glance and stays continuously verified in CI.
#
# See specs/011-m10-documentation-release/contracts/nfr-acceptance.md.
# ---------------------------------------------------------------------------

@testitem "NFR-01 — the binding layer covers ≥ 1200 PARI functions" begin
    using LibPARI

    # Count the callable bindings the generator emitted into `LibPARI.PARI`
    # (the same filter the M4 binding contract uses): real names only, must
    # be defined and callable.
    bindings = filter(names(LibPARI.PARI; all = true)) do s
        name = string(s)
        startswith(name, "#") && return false
        s in (:eval, :include) && return false
        isdefined(LibPARI.PARI, s) || return false
        getfield(LibPARI.PARI, s) isa Function
    end

    @test length(bindings) >= 1200
end

@testitem "NFR-02 — repeated binding calls leak no PARI heap memory" begin
    using LibPARI

    # `getheap()[1]` is PARI's live count of objects on its persistent heap
    # — the `gclone`/`gunclone` arena every `Gen` clones into.
    heap_count() = BigInt(LibPARI.gp_eval("getheap()[1]"))

    GC.gc()
    GC.gc()
    GC.gc()
    baseline = heap_count()

    # Churn many short-lived `Gen`s through generated bindings. Each
    # iteration clones several GENs onto PARI's heap; once the `Gen`s go out
    # of scope and are finalized, every clone must be freed (`gunclone`).
    n = 10_000
    for _ = 1:n
        g = LibPARI.Gen(rand(1:1_000_000_000))
        h = LibPARI.PARI.nextprime(g)
        @assert LibPARI.gentype(h) === LibPARI.PariType.T_INT
    end

    GC.gc()
    GC.gc()
    GC.gc()
    # `heap_count()` is a synchronous PARI call: the dedicated worker's FIFO
    # queue runs every enqueued `gunclone` before it. If the clones leaked,
    # `after` would exceed `baseline` by roughly `n`; a small bounded
    # difference proves they were freed (REQ-MEM-04, REQ-MEM-06).
    after = heap_count()
    @test after - baseline < 500
end

@testitem "NFR-03 — a binding call allocates only a bounded constant" begin
    using LibPARI

    small = LibPARI.Gen(7)
    big = LibPARI.Gen(10)^300            # a ~300-digit PARI integer

    # Warm up so compilation is not counted.
    LibPARI.PARI.nextprime(small)
    LibPARI.PARI.nextprime(big)

    a_small = @allocated LibPARI.PARI.nextprime(small)
    a_big = @allocated LibPARI.PARI.nextprime(big)

    # The PARI value itself lives in the C-heap clone, NOT the Julia heap:
    # the per-call Julia allocation is identical for a tiny and a large
    # result — it does not scale with the value (NFR-03).
    @test a_small == a_big

    # That allocation is a small bounded constant — the `Gen` wrapper plus
    # the M9 dedicated-worker marshalling — measured at ~512 bytes.
    @test a_small <= 1024

    # And it does not accumulate: N calls allocate ~N × the single-call
    # cost, never super-linearly.
    bulk = @allocated for _ = 1:1000
        LibPARI.PARI.nextprime(small)
    end
    @test bulk <= 1000 * 1024
end

@testitem "NFR-04 — the binding generator is byte-identical across runs" begin
    using LibPARI

    repo = pkgdir(LibPARI)
    bindings = joinpath(repo, "src", "bindings.jl")
    genenv = joinpath(repo, "gen")
    before = read(bindings, String)

    # The gen/ environment is development-time only and gen/Manifest.toml
    # is intentionally untracked (matches docs/-pattern). Instantiate it
    # so a cold CI runner can launch the generator below. The explicit
    # JULIA_LOAD_PATH overrides Pkg.test()'s `@`-only inheritance so the
    # subprocess can `using Pkg` (stdlib).
    rm(joinpath(genenv, "Manifest.toml"); force = true)
    run(
        pipeline(
            addenv(
                `$(Base.julia_cmd()) --startup-file=no --project=$genenv -e "using Pkg; Pkg.instantiate()"`,
                "JULIA_LOAD_PATH" => "@$(Sys.iswindows() ? ';' : ':')@stdlib",
            );
            stdout = devnull,
            stderr = devnull,
        ),
    )

    # Re-run the development-time generator in its own environment; the same
    # PARI version must reproduce `src/bindings.jl` byte-for-byte. (The M4
    # generator contract, test/generator_tests.jl, covers this from the
    # generation angle; here it is the NFR-04 acceptance check.)
    run(
        pipeline(
            `$(Base.julia_cmd()) --startup-file=no --project=$genenv $(joinpath(genenv, "generate.jl"))`;
            stdout = devnull,
            stderr = devnull,
        ),
    )

    # Compare with line endings normalized: the generator always writes LF,
    # but git's `core.autocrlf` checks the committed (LF) file out as CRLF on
    # Windows, so the working-tree copy read into `before` carries CRLF
    # there. Normalizing both sides keeps the content-equality contract
    # platform-independent (generator determinism itself is covered by the
    # two-run check in test/generator_tests.jl).
    norm(s) = replace(s, "\r\n" => "\n")
    @test norm(read(bindings, String)) == norm(before)
end
