@testitem "gen_from restores the PARI stack pointer" begin
    using LibPARI

    libpari = LibPARI.PARI_jll.libpari

    before = LibPARI._avma()
    g = LibPARI.gen_from(
        () -> ccall((:stoi, libpari), Ptr{Clong}, (Clong,), 99),
    )
    @test g isa LibPARI.Gen
    @test LibPARI.gentype(g) === LibPARI.PariType.T_INT
    # Producing the Gen left the transient stack exactly where it was.
    @test LibPARI._avma() == before
end

@testitem "allocating many Gens keeps the PARI stack stable" begin
    using LibPARI

    libpari = LibPARI.PARI_jll.libpari

    baseline = LibPARI._avma()
    for i = 1:100_000
        LibPARI.gen_from(() -> ccall((:stoi, libpari), Ptr{Clong}, (Clong,), i))
    end
    GC.gc()

    # After 100k allocate-and-drop cycles the stack pointer is unmoved —
    # early evidence of leak-free memory discipline (REQ-MEM-05, NFR-02).
    @test LibPARI._avma() == baseline
end
