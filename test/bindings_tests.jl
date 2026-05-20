# M4 — generated-binding contract. `LibPARI.PARI` exposes ≥ 1200 callable
# bindings that route through M3's `protected_call` ∘ M2's `gen_from` and
# honour PARI's precision, optional, and output calling conventions.

@testitem "LibPARI.PARI exposes ≥ 1200 callable bindings; a sample returns a Gen" begin
    using LibPARI

    bindings = filter(names(LibPARI.PARI; all = true)) do s
        name = string(s)
        startswith(name, "#") && return false
        s in (:eval, :include) && return false
        isdefined(LibPARI.PARI, s) || return false
        getfield(LibPARI.PARI, s) isa Function
    end
    @test length(bindings) >= 1200

    # SC-005 — a sampled simple binding invokes PARI and returns a `Gen`.
    libpari = LibPARI.PARI_jll.libpari
    int_gen(n) = LibPARI.gen_from(
        () -> ccall((:stoi, libpari), Ptr{Clong}, (Clong,), Clong(n)),
    )
    g = LibPARI.PARI.nextprime(int_gen(1000))
    @test g isa LibPARI.Gen
    @test LibPARI.gentype(g) === LibPARI.PariType.T_INT
end

@testitem "a failing binding surfaces a catchable PariError" begin
    using LibPARI

    libpari = LibPARI.PARI_jll.libpari
    int_gen(n) = LibPARI.gen_from(
        () -> ccall((:stoi, libpari), Ptr{Clong}, (Clong,), Clong(n)),
    )

    # B3 — the `ccall` runs inside `protected_call`; a PARI error (1/0)
    # becomes a `PariError`, not a crash.
    err = try
        LibPARI.PARI.gdiv(int_gen(1), int_gen(0))
        nothing
    catch e
        e
    end
    @test err isa LibPARI.PariError
end

@testitem "bindings honour precision, optional, and output conventions" begin
    using LibPARI

    libpari = LibPARI.PARI_jll.libpari
    int_gen(n) = LibPARI.gen_from(
        () -> ccall((:stoi, libpari), Ptr{Clong}, (Clong,), Clong(n)),
    )
    PT = LibPARI.PariType

    # B4 — a precision-taking binding auto-supplies precision and accepts a
    # `prec` keyword override.
    @test LibPARI.gentype(LibPARI.PARI.mppi()) === PT.T_REAL
    @test LibPARI.gentype(LibPARI.PARI.mppi(prec = 6)) === PT.T_REAL

    # B5 — an optional argument is exposed with its declared default and may
    # be supplied.
    @test LibPARI.gentype(LibPARI.PARI.gisprime(int_gen(97))) === PT.T_INT
    @test LibPARI.gentype(LibPARI.PARI.gisprime(int_gen(97); x2 = 1)) ===
          PT.T_INT

    # B6 — an output (`&`) argument is returned with the primary result as a
    # tuple. `issquareall(49)` → (1, Gen(7)).
    result = LibPARI.PARI.issquareall(int_gen(49))
    @test result isa Tuple
    @test result[1] == 1
    @test result[2] isa LibPARI.Gen
    @test LibPARI.gentype(result[2]) === PT.T_INT
end
