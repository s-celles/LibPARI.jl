# The C trap shim's source is a real C file, `src/libpari_trap.c`: the one
# LibPARI compiles at load, and the one a prebuilt shim (a JLL) is built
# from. A prebuilt shim can come from a different LibPARI release than the
# one loading it, so the shim reports the version of its calling convention
# (`libpari_trap_abi_version`) and LibPARI uses only a shim whose version
# matches `_TRAP_ABI`.

@testitem "the trap shim source is src/libpari_trap.c" begin
    using LibPARI
    path = joinpath(pkgdir(LibPARI), "src", "libpari_trap.c")
    @test isfile(path)
    src = read(path, String)
    @test LibPARI._TRAP_C_SOURCE == src
    @test occursin("libpari_trap(void *fn, long n, long *errnum", src)
    @test occursin("libpari_trap_abi_version(void)", src)
    # On Windows 64-bit `parigen.h` does `#define long long long`, so system
    # headers must come first.
    @test findfirst("#include <stdint.h>", src).start <
          findfirst("#include <pari/pari.h>", src).start
end

@testitem "a loaded trap shim reports the expected ABI version" begin
    using LibPARI
    @test LibPARI._TRAP_ABI isa Int && LibPARI._TRAP_ABI >= 1
    if LibPARI._TRAP_AVAILABLE[]
        @test LibPARI._trap_abi_version(LibPARI._TRAP_LIB[]) ==
              LibPARI._TRAP_ABI
    end
end
