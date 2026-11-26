# A `Gen` finalizer must not block or switch tasks: Julia forbids a task
# switch inside a finalizer ("task switch not allowed from inside gc
# finalizer"), and doing one anyway corrupts the scheduler. Freeing the clone
# (`gunclone`) therefore cannot be handed to the primary PARI worker with
# `put!` on its request channel, which waits whenever the channel's lock is
# held. The finalizer only queues the clone; the primary worker frees it.

@testitem "a Gen finalizer neither waits nor switches tasks" begin
    using LibPARI
    g = LibPARI.Gen(big(10)^30 + 1)
    chan = LibPARI._PARI_REQUESTS[][LibPARI._PARI_PRIMARY[]]
    held = Base.Event()
    release = Base.Event()
    # Another task holds the primary worker's request channel, as a
    # concurrent `put!` or `take!` would.
    holder = @async begin
        lock(chan)
        try
            notify(held)
            wait(release)
        finally
            unlock(chan)
        end
    end
    wait(held)
    # Finalize on another task, so that a finalizer that waits for the
    # channel shows up as a timeout instead of a deadlock with `holder`.
    errpath, errio = mktemp()
    finalizing = @async redirect_stderr(errio) do
        finalize(g)            # runs the finalizer now
    end
    finished = timedwait(() -> istaskdone(finalizing), 5.0)
    notify(release)
    wait(holder)
    wait(finalizing)
    close(errio)
    err = read(errpath, String)
    @test finished === :ok     # did not wait for the channel
    @test !occursin("error in running finalizer", err)
    @test isempty(err)
    @test g.ptr == C_NULL
    # The queued clone is freed by the next call that reaches its owning
    # worker (`g` was built here, on the primary), and the library stays
    # healthy.
    @test BigInt(LibPARI.Gen(7)) == 7
    @test LibPARI._pending_unclones() == 0
end

@testitem "clones of collected Gens are freed by their owning worker" begin
    using LibPARI
    for _ = 1:3
        gens = [LibPARI.Gen(big(10)^30 + i) for i = 1:500]
        @test all(g -> g.owner == gens[1].owner, gens)   # one context made them
        @test BigInt(gens[end]) == big(10)^30 + 500
        gens = nothing
        GC.gc()
        # The next call on the owning context drains its queue; other
        # contexts drain theirs at their next job (`_drain_all!` waits).
        @test BigInt(LibPARI.Gen(11)) == 11
        LibPARI._drain_all!()
        @test LibPARI._pending_unclones() == 0
    end
end
