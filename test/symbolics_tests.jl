# M19 — the Symbolics.jl bridge (REQ-SYM-01 … REQ-SYM-10).
#
# The bridge is a package extension, live here because `Symbolics` is a test
# dependency. It is value-preserving and name-preserving, NOT
# representation-preserving: a PARI polynomial carries a variable priority
# that Symbolics has no notion of, so a round trip is asserted by VALUE
# (PARI's `gequal`, i.e. `==`) and never by printed form.

@testitem "REQ-SYM-02: the bridge is an optional extension" begin
    using LibPARI

    # The generic lives in LibPARI itself; its methods arrive with the
    # extension. Asserting `isempty(methods(...))` BEFORE `using Symbolics`
    # would only hold if this testitem ran before every other one in this
    # file — testitems share a process and their order is not guaranteed —
    # so the assertion is on what is true regardless of order.
    @test LibPARI.to_symbolics isa Function

    using Symbolics
    @test !isempty(methods(LibPARI.to_symbolics))
    @test hasmethod(LibPARI.to_symbolics, Tuple{LibPARI.Gen})
    # And `pari` gained its inward methods from the same extension.
    @test hasmethod(pari, Tuple{Symbolics.Num})
end

@testitem "REQ-SYM-01: PARI scalars map to Julia values" begin
    using LibPARI
    using Symbolics

    @test LibPARI.to_symbolics(pari(42)) == 42
    @test LibPARI.to_symbolics(pari(42)) isa BigInt
    @test LibPARI.to_symbolics(pari(-7)) == -7
    @test LibPARI.to_symbolics(pari(3 // 4)) == 3 // 4
    @test LibPARI.to_symbolics(pari(3 // 4)) isa Rational
    @test LibPARI.to_symbolics(pari(1.5)) == 1.5
    @test LibPARI.to_symbolics(pari(1.5)) isa BigFloat
    @test LibPARI.to_symbolics(gp_eval("3 + 4*I")) == 3 + 4im

    # A wide real keeps its precision across the bridge (M13's contract).
    x = setprecision(() -> sqrt(BigFloat(2)), BigFloat, 512)
    @test setprecision(() -> LibPARI.to_symbolics(pari(x)), BigFloat, 512) == x
end

@testitem "REQ-SYM-01: PARI containers map to Julia arrays" begin
    using LibPARI
    using Symbolics

    @test LibPARI.to_symbolics(gp_eval("[1,2,3]")) == [1, 2, 3]
    @test LibPARI.to_symbolics(gp_eval("[1,2,3]~")) == [1, 2, 3]
    @test LibPARI.to_symbolics(gp_eval("[1,2;3,4]")) == [1 2; 3 4]
    @test LibPARI.to_symbolics(gp_eval("[1,2;3,4]")) isa Matrix
    # Julia's (rows, columns), like M17's `size`.
    @test size(LibPARI.to_symbolics(gp_eval("[1,2,3;4,5,6]"))) == (2, 3)
end

@testitem "REQ-SYM-06: an unsupported PARI type is refused by name" begin
    using LibPARI
    using Symbolics

    for code in ("Mod(5,7)", "\"abc\"", "(x) -> x^2")
        @test_throws ArgumentError LibPARI.to_symbolics(gp_eval(code))
    end
    msg = try
        LibPARI.to_symbolics(gp_eval("Mod(5,7)"))
        ""
    catch e
        sprint(showerror, e)
    end
    @test occursin("T_INTMOD", msg)
end

@testitem "REQ-SYM-08: the round trip preserves the value" begin
    using LibPARI
    using Symbolics

    # Asserted by value — `==` on a `Gen` is PARI's `gequal`. Comparing
    # printed forms would fail: PARI structures a polynomial by variable
    # priority, which Symbolics does not model, so `(x+y)^2` comes back
    # through Symbolics as `x*(x + 2y) + y^2` — equal, differently written.
    for code in (
        "x^2 + 1",
        "x^3 - 2*x + 5",
        "(x+y)^2",
        "x^2*y + y^2*x + 1",
        "3/4*x^2 - 1/2",
    )
        g = gp_eval(code)
        @test pari(LibPARI.to_symbolics(g)) == g
    end

    # And the variable NAMES survive, which is the part that does hold.
    back = pari(LibPARI.to_symbolics(gp_eval("y^2 + y + 1")))
    @test string(LibPARI.PARI.gpolvar(; x1 = back)) == "y"
end

@testitem "REQ-SYM-03: Symbolics expressions convert inward" begin
    using LibPARI
    using Symbolics

    @variables a b

    @test pari(a^2 + 1) == gp_eval("a^2 + 1")
    @test pari((a + b)^2) == gp_eval("(a+b)^2")
    @test pari(2a + 3b) == gp_eval("2*a + 3*b")
    @test pari(a * b - b) == gp_eval("a*b - b")
    @test pari(a / b) == gp_eval("a/b")
    @test pari(-a) == gp_eval("-a")

    # A bare number, and a bare variable.
    @test pari(Symbolics.Num(7)) == 7
    @test pari(a) == gp_eval("a")

    # `pari` keeps its single-entry-point contract for everything else.
    @test pari(42) == gp_eval("42")
end

@testitem "REQ-SYM-06: an untranslatable operation is refused by name" begin
    using LibPARI
    using Symbolics

    @variables a
    # `sin` has a PARI counterpart, but the bridge covers arithmetic only —
    # and says so rather than guessing.
    err = try
        pari(sin(a))
        ""
    catch e
        sprint(showerror, e)
    end
    @test occursin("sin", err)
    @test occursin("+, -, *, / and ^", err)
end

@testitem "REQ-SYM-09: the bridge pirates nothing" begin
    using LibPARI
    using Symbolics
    using Aqua

    # Every method the extension adds has a LibPARI type in its signature
    # (`to_symbolics(::Gen)`) or is a LibPARI function (`pari`), so loading
    # Symbolics must not introduce piracy.
    Aqua.test_piracies(LibPARI)
    @test true
end

@testitem "REQ-SYM-03: a numeric literal converts in every position" begin
    using LibPARI
    using Symbolics
    const SU = Symbolics.SymbolicUtils

    @variables a b

    # Symbolics 7 wraps a literal in a symbolic node, so each of these
    # carries one somewhere a naive call/symbol walk would drop it: as a
    # constant term, an exponent, a coefficient, a rational coefficient,
    # and standing alone.
    @test pari(a^2 + 1) == gp_eval("a^2 + 1")
    @test pari(a^3) == gp_eval("a^3")
    @test pari(2a + 3) == gp_eval("2*a + 3")
    @test pari((3 // 4) * a - 1 // 2) == gp_eval("3/4*a - 1/2")
    @test pari(Symbolics.Num(7)) == 7
    @test pari(a * b + 5) == gp_eval("a*b + 5")

    # The guard is `is_literal_number`, whose contract is the one the
    # conversion relies on: it accepts ANY input and is true only when what
    # `unwrap_const` yields is a `Number`. `isconst` would answer a
    # different question — whether the node is a `Const` variant — and
    # promises nothing about what it carries.
    @test SU.is_literal_number(3)
    @test SU.is_literal_number(3 // 4)
    @test !SU.is_literal_number("abc")
    @test !SU.is_literal_number(Symbolics.unwrap(a))
    @test SU.is_literal_number(Symbolics.unwrap(Symbolics.Num(7)))

    # `isconst` would answer a different question and is NOT interchangeable
    # here: it is true for a `Const` node whatever the node carries, so it
    # cannot stand in for "this is a number `pari` can take". Both
    # predicates are total — SymbolicUtils gives every `is*` predicate an
    # `(x) = false` fallback — so robustness is not what separates them.
    @test !SU.isconst(3)
    @test SU.is_literal_number(3)
end
