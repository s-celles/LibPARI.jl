# The C trap shim comes from https://github.com/s-celles/libpari-trap, which
# PARI_jll also builds as its `libpari_trap` product. LibPARI vendors its two
# files in src/libpari_trap/ to compile them at load when PARI_jll's prebuilt
# library is unusable. A shim from another release could be loaded, so it
# reports the version of its calling convention (`libpari_trap_abi_version`)
# and LibPARI uses only a shim whose version matches `_TRAP_ABI`.

@testitem "the vendored trap shim sources are libpari-trap's" begin
    using LibPARI
    dir = joinpath(pkgdir(LibPARI), "src", "libpari_trap")
    c = read(joinpath(dir, "libpari_trap.c"), String)
    h = read(joinpath(dir, "libpari_trap.h"), String)
    @test LibPARI._TRAP_C_SOURCE == c
    @test LibPARI._TRAP_H_SOURCE == h
    @test occursin("SPDX-License-Identifier: GPL-2.0-or-later", c)
    @test occursin("SPDX-License-Identifier: GPL-2.0-or-later", h)
    @test occursin(
        "intptr_t\nlibpari_trap(void *fn, intptr_t nargs, intptr_t *status",
        c,
    )
    # LibPARI's expected ABI is the header's.
    @test occursin("#define LIBPARI_TRAP_ABI_VERSION $(LibPARI._TRAP_ABI)\n", h)
    # On Windows 64-bit `parigen.h` does `#define long long long`, so system
    # headers (and libpari_trap.h) must come before pari.h.
    @test findfirst("#include <stdint.h>", c).start <
          findfirst("#include <pari/pari.h>", c).start
    @test findfirst("#include \"libpari_trap.h\"", c).start <
          findfirst("#include <pari/pari.h>", c).start
end

@testitem "a loaded trap shim reports the expected ABI version" begin
    using LibPARI
    @test LibPARI._TRAP_ABI isa Int && LibPARI._TRAP_ABI >= 1
    if LibPARI._TRAP_AVAILABLE[]
        @test LibPARI._trap_abi_version(LibPARI._TRAP_LIB[]) ==
              LibPARI._TRAP_ABI
    end
end
