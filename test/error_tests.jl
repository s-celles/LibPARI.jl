@testitem "PARI errors become catchable PariError exceptions" begin
    using LibPARI

    libpari = LibPARI.PARI_jll.libpari
    stoi(n) = ccall((:stoi, libpari), Ptr{Clong}, (Clong,), Clong(n))

    err = try
        LibPARI.protected_call() do
            ccall(
                (:gdiv, libpari),
                Ptr{Clong},
                (Ptr{Clong}, Ptr{Clong}),
                stoi(1),
                stoi(0),
            )
        end
        nothing
    catch e
        e
    end

    @test err isa LibPARI.PariError
    @test err isa LibPARI.PariError && !isempty(err.message)
end

@testitem "the library is usable after a caught error" begin
    using LibPARI

    libpari = LibPARI.PARI_jll.libpari
    stoi(n) = ccall((:stoi, libpari), Ptr{Clong}, (Clong,), Clong(n))

    before = LibPARI._avma()
    try
        LibPARI.protected_call() do
            ccall(
                (:gdiv, libpari),
                Ptr{Clong},
                (Ptr{Clong}, Ptr{Clong}),
                stoi(1),
                stoi(0),
            )
        end
    catch e
        e isa LibPARI.PariError || rethrow(e)
    end

    # The PARI stack pointer is restored to its pre-call value.
    @test LibPARI._avma() == before

    # A valid operation after the caught error still works.
    g = LibPARI.gen_from(() -> stoi(42))
    @test LibPARI.gentype(g) === LibPARI.PariType.T_INT
end

@testitem "PariError carries the error category" begin
    using LibPARI

    libpari = LibPARI.PARI_jll.libpari
    stoi(n) = ccall((:stoi, libpari), Ptr{Clong}, (Clong,), Clong(n))

    err = try
        LibPARI.protected_call() do
            ccall(
                (:gdiv, libpari),
                Ptr{Clong},
                (Ptr{Clong}, Ptr{Clong}),
                stoi(1),
                stoi(0),
            )
        end
    catch e
        e
    end
    @test err isa LibPARI.PariError
    @test err.category === LibPARI.PariErr.e_INV

    # The category mapping handles known and out-of-range error numbers.
    @test LibPARI._category(12) === LibPARI.PariErr.e_TYPE
    @test LibPARI._category(999) === LibPARI.PariErr.e_NONE
end
