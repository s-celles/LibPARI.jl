# M7 — GP expression evaluator: `gp_eval` over arbitrary GP strings, the
# closure-function escape hatch, and malformed-input errors.

@testitem "gp_eval evaluates GP expressions to Gen results" begin
    using LibPARI

    @test LibPARI.gp_eval("2 + 2") isa LibPARI.Gen
    @test BigInt(LibPARI.gp_eval("2 + 2")) == 4
    @test BigInt(LibPARI.gp_eval("3^50")) == big(3)^50

    # A non-scalar result is still a Gen.
    @test LibPARI.gentype(LibPARI.gp_eval("[1, 2, 3]")) ===
          LibPARI.PariType.T_VEC
end

@testitem "gp_eval reaches GP-closure-argument functions (escape hatch)" begin
    using LibPARI

    # `sum` and `prod` take a GP-closure argument — M4 emitted no binding
    # for them; gp_eval reaches them through the GP language.
    @test BigInt(LibPARI.gp_eval("sum(X = 1, 10, X^2)")) == 385
    @test BigInt(LibPARI.gp_eval("prod(X = 1, 6, X)")) == 720
end

@testitem "gp_eval shares one GP environment across calls" begin
    using LibPARI

    LibPARI.gp_eval("m7var = 21")
    @test BigInt(LibPARI.gp_eval("m7var * 2")) == 42
end

@testitem "a gp_eval result equals the equivalent binding call" begin
    using LibPARI

    via_gp = LibPARI.gp_eval("nextprime(1000)")
    via_binding = LibPARI.PARI.nextprime(LibPARI.Gen(1000))
    @test via_gp == via_binding
end

@testitem "a malformed GP expression raises a catchable PariError" begin
    using LibPARI

    # A syntactically invalid string → PariError describing the parse error.
    err = try
        LibPARI.gp_eval("2 +")
        nothing
    catch e
        e
    end
    @test err isa LibPARI.PariError
    @test err isa LibPARI.PariError && err.category === LibPARI.PariErr.e_SYNTAX
    @test err isa LibPARI.PariError && !isempty(err.message)

    # A runtime failure also surfaces as a catchable PariError.
    @test_throws LibPARI.PariError LibPARI.gp_eval("1/0")

    # The library stays usable after a failed evaluation.
    @test BigInt(LibPARI.gp_eval("6 * 7")) == 42
end

# M16 (REQ-GPS-01) — what GP state actually is, pinned by measurement.
# PARI keeps one GP environment per process, in the primary context, and its
# parallel model makes global variables read-only inside a secondary one.
@testitem "REQ-GPS-01: GP state is one environment, writable from one task" begin
    using LibPARI

    # Within a task, assignments persist — the documented behaviour.
    LibPARI.gp_eval("gps_a = 42")
    @test LibPARI.gp_eval("gps_a + 1") == 43

    # `kill` removes a variable: it becomes a free symbol again, which is
    # the only cleanup PARI offers.
    LibPARI.gp_eval("kill(gps_a)")
    @test string(LibPARI.gp_eval("gps_a")) == "gps_a"

    # `variables()` lists POLYNOMIAL variables, not assignments — so a
    # session cannot discover what it created, only track what it is told.
    LibPARI.gp_eval("gps_b = 7")
    @test !occursin("gps_b", string(LibPARI.gp_eval("variables()")))
    LibPARI.gp_eval("kill(gps_b)")
end

@testitem "REQ-GPS-01: a secondary task computes but cannot assign" begin
    using LibPARI

    # Pure evaluation and the generated layer work from any task.
    @test fetch(Threads.@spawn LibPARI.gp_eval("2 + 2")) == 4
    @test fetch(Threads.@spawn LibPARI.PARI.nextprime(1000)) == 1009

    # This test is only meaningful with a second thread to spawn onto.
    if Threads.nthreads() > 1
        # `fetch` wraps a failed task's exception in a `TaskFailedException`,
        # so the PariError is inspected rather than asserted directly.
        failed(f) =
            try
                fetch(Threads.@spawn f())
                nothing
            catch e
                e isa TaskFailedException ? e.task.result : e
            end

        LibPARI.gp_eval("gps_c = 5")
        # Reading an unexported variable is refused by PARI's parallel model.
        err = failed(() -> LibPARI.gp_eval("gps_c"))
        @test err isa LibPARI.PariError
        @test occursin("export", err.message)

        # Exporting makes it readable — but still not writable.
        LibPARI.gp_eval("export(gps_c)")
        @test fetch(Threads.@spawn LibPARI.gp_eval("gps_c")) == 5

        werr = failed(() -> LibPARI.gp_eval("gps_d = 1"))
        @test werr isa LibPARI.PariError

        LibPARI.gp_eval("unexport(gps_c)")
        LibPARI.gp_eval("kill(gps_c)")
    end
end
