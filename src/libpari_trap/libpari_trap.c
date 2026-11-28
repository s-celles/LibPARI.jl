/* SPDX-License-Identifier: GPL-2.0-or-later */
/*
 * libpari_trap: see include/libpari_trap.h.
 *
 * <stdint.h> and libpari_trap.h come BEFORE <pari/pari.h>: on 64-bit
 * Windows parigen.h does `#define long long long`, which would turn the
 * `long long` of any system header included afterwards into an invalid
 * `long long long`.
 */
#include <stdint.h>
#include "libpari_trap.h"
#include <pari/pari.h>

/* The libpari function, seen as taking 0 to 8 pointer-sized arguments. */
typedef intptr_t (*pari_fn_0)(void);
typedef intptr_t (*pari_fn_1)(intptr_t);
typedef intptr_t (*pari_fn_2)(intptr_t, intptr_t);
typedef intptr_t (*pari_fn_3)(intptr_t, intptr_t, intptr_t);
typedef intptr_t (*pari_fn_4)(intptr_t, intptr_t, intptr_t, intptr_t);
typedef intptr_t (*pari_fn_5)(intptr_t, intptr_t, intptr_t, intptr_t,
                              intptr_t);
typedef intptr_t (*pari_fn_6)(intptr_t, intptr_t, intptr_t, intptr_t,
                              intptr_t, intptr_t);
typedef intptr_t (*pari_fn_7)(intptr_t, intptr_t, intptr_t, intptr_t,
                              intptr_t, intptr_t, intptr_t);
typedef intptr_t (*pari_fn_8)(intptr_t, intptr_t, intptr_t, intptr_t,
                              intptr_t, intptr_t, intptr_t, intptr_t);

int
libpari_trap_abi_version(void)
{
  return LIBPARI_TRAP_ABI_VERSION;
}

/* Call `fn` with the first `nargs` entries of `a`. */
static intptr_t
call_with_args(void *fn, intptr_t nargs,
               const intptr_t a[LIBPARI_TRAP_MAX_ARGS], intptr_t *status)
{
  switch (nargs)
  {
    case LIBPARI_TRAP_NARGS_0: return ((pari_fn_0) fn)();
    case LIBPARI_TRAP_NARGS_1: return ((pari_fn_1) fn)(a[0]);
    case LIBPARI_TRAP_NARGS_2: return ((pari_fn_2) fn)(a[0], a[1]);
    case LIBPARI_TRAP_NARGS_3: return ((pari_fn_3) fn)(a[0], a[1], a[2]);
    case LIBPARI_TRAP_NARGS_4:
      return ((pari_fn_4) fn)(a[0], a[1], a[2], a[3]);
    case LIBPARI_TRAP_NARGS_5:
      return ((pari_fn_5) fn)(a[0], a[1], a[2], a[3], a[4]);
    case LIBPARI_TRAP_NARGS_6:
      return ((pari_fn_6) fn)(a[0], a[1], a[2], a[3], a[4], a[5]);
    case LIBPARI_TRAP_NARGS_7:
      return ((pari_fn_7) fn)(a[0], a[1], a[2], a[3], a[4], a[5], a[6]);
    case LIBPARI_TRAP_NARGS_8:
      return ((pari_fn_8) fn)(a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7]);
    default:
      *status = LIBPARI_TRAP_BAD_NARGS;
      return 0;
  }
}

intptr_t
libpari_trap(void *fn, intptr_t nargs, intptr_t *status,
             intptr_t a0, intptr_t a1, intptr_t a2, intptr_t a3,
             intptr_t a4, intptr_t a5, intptr_t a6, intptr_t a7)
{
  const intptr_t args[LIBPARI_TRAP_MAX_ARGS] = {a0, a1, a2, a3,
                                                a4, a5, a6, a7};
  /* volatile: assigned between pari_CATCH's setjmp and a possible
   * longjmp back to it. */
  volatile intptr_t result = 0;

  *status = LIBPARI_TRAP_OK;
  pari_CATCH(CATCH_ALL)
  {
    /* A PARI error longjmp'd here: report its number. */
    *status = err_get_num(pari_err_last());
    result = 0;
  }
  pari_TRY
  {
    result = call_with_args(fn, nargs, args, status);
  }
  pari_ENDCATCH
  return result;
}
