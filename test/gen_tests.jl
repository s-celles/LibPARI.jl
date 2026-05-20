@testitem "Gen is a concrete type" begin
    using LibPARI

    @test isconcretetype(LibPARI.Gen)
end

@testitem "Gen GC lifecycle and idempotent finalization" begin
    using LibPARI

    libpari = LibPARI.PARI_jll.libpari

    # Build a Gen from a PARI small integer (the constructor clones it).
    g = LibPARI.Gen(ccall((:stoi, libpari), Ptr{Clong}, (Clong,), 123))
    @test g.ptr != C_NULL

    # The finalizer frees the clone (REQ-MEM-04) ...
    LibPARI._finalize!(g)
    @test g.ptr == C_NULL

    # ... and is idempotent — a second finalization frees nothing more
    # (REQ-MEM-06).
    LibPARI._finalize!(g)
    @test g.ptr == C_NULL
end

@testitem "gentype reports the PARI value type" begin
    using LibPARI

    libpari = LibPARI.PARI_jll.libpari
    PT = LibPARI.PariType

    int_g = LibPARI.Gen(ccall((:stoi, libpari), Ptr{Clong}, (Clong,), 7))
    real_g = LibPARI.Gen(ccall((:dbltor, libpari), Ptr{Clong}, (Cdouble,), 1.5))
    pol_g = LibPARI.Gen(ccall((:pol_x, libpari), Ptr{Clong}, (Clong,), 0))
    vec_g = LibPARI.Gen(let i = ccall((:stoi, libpari), Ptr{Clong}, (Clong,), 1)
        ccall((:mkvec, libpari), Ptr{Clong}, (Ptr{Clong},), i)
    end)

    @test LibPARI.gentype(int_g) === PT.T_INT
    @test LibPARI.gentype(real_g) === PT.T_REAL
    @test LibPARI.gentype(pol_g) === PT.T_POL
    @test LibPARI.gentype(vec_g) === PT.T_VEC
end
