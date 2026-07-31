# M18 — the display contract (REQ-SHOW-01 … REQ-SHOW-06).
#
# `show` and `print` used to be the same call, so `repr` of a `Gen` was bare
# PARI text — and PARI's text for a vector is byte-identical to Julia's for a
# `Vector`, and for a string to Julia's for a `String`. The compact form now
# says what the value is; `text/plain` and `print` keep PARI's own notation.

@testitem "REQ-SHOW-01: show, text/plain and print are three contracts" begin
    using LibPARI

    g = pari(42)

    # Compact: self-identifying, for `repr`, containers and debugging.
    @test repr(g) == "Gen(42)"
    # REPL / text-plain: PARI's own notation, unchanged.
    @test repr(MIME("text/plain"), g) == "42"
    # `print` — and therefore `string` and interpolation — stay PARI's text.
    @test string(g) == "42"
    @test "$g" == "42"
    @test sprint(print, g) == "42"

    # The three are no longer the same call.
    @test repr(g) != repr(MIME("text/plain"), g)
end

@testitem "REQ-SHOW-02: a Gen is never confusable with a Julia value" begin
    using LibPARI

    # The defect: PARI's text for these is byte-identical to Julia's own
    # `repr` for the corresponding Julia value.
    s = gp_eval("\"abc\"")
    v = gp_eval("[1,2,3]")

    @test repr("abc") == "\"abc\""
    @test repr(s) != repr("abc")
    @test repr(s) == "Gen(\"abc\")"

    @test repr([1, 2, 3]) == "[1, 2, 3]"
    @test repr(v) != repr([1, 2, 3])
    @test repr(v) == "Gen([1, 2, 3])"

    # A t_FRAC prints `3/4` where a Julia Rational prints `3//4` — close
    # enough to mislead, so it is marked too.
    @test repr(pari(3 // 4)) == "Gen(3/4)"
end

@testitem "REQ-SHOW-04: every PARI kind displays in both forms" begin
    using LibPARI

    cases = [
        (pari(42), "42"),
        (pari(-7), "-7"),
        (pari(3 // 4), "3/4"),
        (pari(1.5), nothing),                 # a real prints many digits
        (gp_eval("x^2 + 1"), "x^2 + 1"),
        (gp_eval("[1,2,3]"), "[1, 2, 3]"),
        (gp_eval("[1,2,3]~"), nothing),       # a t_COL prints multi-line
        (gp_eval("\"abc\""), "\"abc\""),
        (gp_eval("Mod(5,7)"), "Mod(5, 7)"),
    ]
    for (g, plain) in cases
        r = repr(g)
        @test startswith(r, "Gen(")
        @test endswith(r, ")")
        plain === nothing && continue
        @test repr(MIME("text/plain"), g) == plain
        @test string(g) == plain
        @test r == "Gen($plain)"
    end

    # A matrix keeps PARI's own multi-line layout in text/plain.
    m = gp_eval("[1,2;3,4]")
    @test occursin("\n", repr(MIME("text/plain"), m))
    @test startswith(repr(m), "Gen(")
end

@testitem "REQ-SHOW-05: nested display" begin
    using LibPARI

    # A `Gen` inside a Julia container uses the COMPACT form, which is what
    # makes the elements distinguishable from Julia values.
    a = [pari(1), gp_eval("\"abc\"")]
    r = repr(a)
    @test occursin("Gen(1)", r)
    @test occursin("Gen(\"abc\")", r)

    # A vector of vectors: PARI renders the nesting itself in text/plain.
    nested = gp_eval("[[1,2],[3,4]]")
    @test repr(MIME("text/plain"), nested) == "[[1, 2], [3, 4]]"
    @test repr(nested) == "Gen([[1, 2], [3, 4]])"

    # An element pulled out of a container displays like any other Gen.
    @test repr(nested[1]) == "Gen([1, 2])"
end

@testitem "REQ-SHOW-03: the compact form is bounded, text/plain is not" begin
    using LibPARI

    big = gp_eval("2^20000")
    plain = repr(MIME("text/plain"), big)
    compact = repr(big)

    # PARI's own full text stays available — GP prints it in full, and so
    # does LibPARI where the user asked for the value.
    @test length(plain) > 6000
    @test string(big) == plain

    # The compact form is bounded, so a `Gen` inside a container or a
    # stacktrace cannot flood the terminal.
    @test length(compact) < 80
    @test endswith(compact, "…)")
    @test startswith(compact, "Gen(")

    # Truncation preserves the leading digits, so the value is still
    # recognisable.
    @test occursin(first(plain, 20), compact)

    m = gp_eval("matrix(60,60,i,j,i*j)")
    @test length(repr(m)) < 80
end

@testitem "REQ-SHOW-03: display does not compute more than it must" begin
    using LibPARI

    # Rendering calls PARI's GENtostr through the worker; it must not leak
    # the transient stack, however often it happens.
    g = gp_eval("2^5000")
    repr(g)
    av = LibPARI._avma()
    for _ = 1:2_000
        repr(g)
        string(g)
        repr(MIME("text/plain"), g)
    end
    GC.gc()
    @test LibPARI._avma() == av
end

@testitem "REQ-SHOW-03: an error message stays readable" begin
    using LibPARI

    err(f) =
        try
            f()
            ""
        catch e
            sprint(showerror, e)
        end

    # An error that embeds the `Gen` itself renders it with the COMPACT
    # form, so the budget keeps the message readable instead of printing
    # 6 kB of digits into the stacktrace.
    #
    # This holds from Julia 1.11 on. On the 1.10 LTS, `showerror` for an
    # `InexactError` renders the value with `print` rather than `show`, so
    # it gets PARI's full text and the budget does not apply. That is Base's
    # choice, not something the display contract can reach — and it is
    # asserted in both directions rather than left to chance.
    msg = err(() -> BigInt(gp_eval("2^20000 + 1/2")))
    if VERSION >= v"1.11"
        @test length(msg) < 120
        @test occursin("Gen(", msg)
        @test occursin("…", msg)
    else
        @test length(msg) > 6000
        @test !occursin("Gen(", msg)
    end

    # A small value stays fully readable on every version — truncation must
    # not be eager.
    @test occursin("1/2", err(() -> Int(pari(1) / pari(2))))

    # The documented limit, on every version: `Int(::Gen)` converts through
    # `BigInt`, so its `InexactError` embeds a *BigInt* and Base prints that
    # in full. M18 governs how a `Gen` renders, not Base's own types.
    viaBigInt = err(() -> Int(gp_eval("2^20000")))
    @test length(viaBigInt) > 6000
    @test !occursin("Gen(", viaBigInt)

    # What the contract does guarantee everywhere: `repr` itself is bounded.
    @test length(repr(gp_eval("2^20000"))) < 80
end
