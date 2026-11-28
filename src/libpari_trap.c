/*
 * libpari_trap: LibPARI.jl's concurrency-safe PARI error trap.
 *
 * PARI's error trap is a per-thread longjmp to an `iferr_env` set up by
 * setjmp. A PARI error longjmp must unwind ONLY C frames, never a Julia
 * runtime frame. So every error-prone libpari call from LibPARI.jl runs
 * through this trampoline: it arms `pari_CATCH` in a real C frame and calls
 * the PARI function pointer directly, so a PARI error longjmps back across
 * C frames only, and its error number is returned in `*errnum` (-1 if none).
 *
 * LibPARI.jl compiles this file at load when a C compiler is available, and
 * it is also built ahead of time (LibPARITrap_jll) from this same file.
 *
 * Every argument is passed as a `long`: PARI's word type, which pari.h
 * redefines to `long long` (64-bit) on Windows 64-bit / LLP64, so it is
 * pointer-sized on every platform. The return is `intptr_t` (same width).
 * The Julia side marshals these as `Int`, never `Clong`: Julia's `Clong` is
 * only 32-bit on Windows and would truncate `GEN` pointers.
 *
 * <stdint.h> comes BEFORE <pari/pari.h>: on Windows 64-bit parigen.h does
 * `#define long long long`, which turns any `long long` in a system header
 * included afterwards into `long long long`, a compile error.
 *
 * libpari_trap_abi_version() is the version of this calling convention.
 * Bump it whenever libpari_trap's signature or behaviour changes, together
 * with `_TRAP_ABI` in src/trap.jl: LibPARI.jl uses only a shim whose version
 * matches, so a prebuilt shim from another release is never misused.
 */
#include <stdint.h>
#include <pari/pari.h>

int
libpari_trap_abi_version(void)
{
  return 1;
}

intptr_t
libpari_trap(void *fn, long n, long *errnum,
             long a0, long a1, long a2, long a3,
             long a4, long a5, long a6, long a7)
{
  intptr_t r = 0;
  pari_CATCH(CATCH_ALL)
  {
    *errnum = err_get_num(pari_err_last());
  }
  pari_TRY
  {
    switch (n)
    {
      case 0: r = ((intptr_t(*)(void))fn)(); break;
      case 1: r = ((intptr_t(*)(long))fn)(a0); break;
      case 2: r = ((intptr_t(*)(long,long))fn)(a0,a1); break;
      case 3: r = ((intptr_t(*)(long,long,long))fn)(a0,a1,a2); break;
      case 4: r = ((intptr_t(*)(long,long,long,long))fn)(a0,a1,a2,a3); break;
      case 5: r = ((intptr_t(*)(long,long,long,long,long))fn)
                  (a0,a1,a2,a3,a4); break;
      case 6: r = ((intptr_t(*)(long,long,long,long,long,long))fn)
                  (a0,a1,a2,a3,a4,a5); break;
      case 7: r = ((intptr_t(*)(long,long,long,long,long,long,long))fn)
                  (a0,a1,a2,a3,a4,a5,a6); break;
      case 8: r = ((intptr_t(*)(long,long,long,long,long,long,long,long))fn)
                  (a0,a1,a2,a3,a4,a5,a6,a7); break;
    }
    *errnum = -1;
  }
  pari_ENDCATCH
  return r;
}
