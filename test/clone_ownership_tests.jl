# Per-context clones. PARI's clone/block list is thread-local (`cur_block`,
# `root_block`, `next_block` are `THREAD` statics in libpari's init.c), so a
# clone must be freed on the context that made it. LibPARI used to make and
# free every clone on the primary worker: correct, but every `Gen` built on
# any thread then waited for the primary, which serialized multi-threaded
# work behind it. A `Gen` is now cloned on the context that produced it,
# remembers it (`owner`), and its clone is freed by that context's worker.
#
# These need several threads, and per-thread contexts need the trap shim, so
# they run in a child process started with `--threads=4`.

@testitem "a Gen is cloned and freed on the context that produced it" begin
    using LibPARI

    project = pkgdir(LibPARI)
    code = raw"""
    using LibPARI
    const L = LibPARI
    # Run `f` on Julia thread `tid` (a default-pool thread) and return its
    # result: a `:static` loop runs one iteration on each pool thread.
    function on_thread(f, tid)
        r = Ref{Any}(nothing)
        Threads.@threads :static for i = 1:Threads.nthreads()
            Threads.threadid() == tid && (r[] = f())
        end
        return r[]
    end
    workers = L._PARI_WORKERS[]
    primary = L._PARI_PRIMARY[]
    others = [t for t in eachindex(workers) if t != primary && workers[t] !== nothing]
    if isempty(others)
        print("no-secondary")
        exit(0)
    end
    tid = first(others)
    # PARI's heap (block count) of context `t`. The primary may run on the
    # interactive thread, which a `:static` loop does not reach.
    heapnow() = Int(L.gp_eval("getheap()")[1])
    heap(t) = t == primary ? L._run_on_primary(heapnow) : on_thread(heapnow, t)

    owner = on_thread(() -> L.Gen(big(10)^30).owner, tid)
    h0, p0 = heap(tid), heap(primary)
    gens = on_thread(() -> [L.Gen(big(10)^30 + i) for i = 1:300], tid)
    h1, p1 = heap(tid), heap(primary)
    gens = nothing
    GC.gc(); GC.gc()
    on_thread(() -> L.Gen(1), tid)          # the owner frees its clones
    h2 = heap(tid)
    L._drain_all!()                         # and every other worker its own
    pending = L._pending_unclones()

    # A busy primary no longer holds up `Gen` construction elsewhere.
    busy = @async L._run_on_primary(() -> (sleep(3); 1))
    sleep(0.2)
    t = @elapsed on_thread(() -> [L.Gen(i) for i = 1:200], tid)
    wait(busy)

    print(join((tid, owner, h1 - h0, p1 - p0, h2 - h0, pending, t < 1.5), ","))
    """
    out = read(
        `$(Base.julia_cmd()) --project=$(project) --startup-file=no --threads=4 -e $(code)`,
        String,
    )
    if strip(out) == "no-secondary"
        @info "no secondary PARI context (no trap shim): ownership not tested"
        @test true
    else
        tid, owner, dh, dp, dh2, pending, fast = split(strip(out), ",")
        @test owner == tid                    # cloned on the producing context
        @test parse(Int, dh) >= 300           # its blocks are in that heap
        @test abs(parse(Int, dp)) <= 5        # not in the primary's
        @test parse(Int, dh2) <= 5            # and freed there
        @test pending == "0"
        @test fast == "true"                  # did not wait for the primary
    end
end

@testitem "with one context, every Gen is owned by the primary" begin
    using LibPARI
    g = LibPARI.Gen(42)
    @test g.owner == LibPARI._PARI_PRIMARY[]
    # Built from another task on the same thread: same context.
    @test fetch(@async LibPARI.Gen(43)).owner == LibPARI._PARI_PRIMARY[]
end
