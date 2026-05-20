@testitem "LibPARI package loads" begin
    using LibPARI

    # M0: the package must load cleanly. No PARI functionality is exposed
    # yet, so we only assert that the module is available and that its
    # binary dependency was resolved.
    @test LibPARI isa Module
    @test isdefined(LibPARI, :PARI_jll)
end
