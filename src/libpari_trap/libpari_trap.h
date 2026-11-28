/* SPDX-License-Identifier: GPL-2.0-or-later */
/*
 * libpari_trap: call a libpari function with PARI's error trap armed.
 *
 * PARI reports errors with a longjmp to the error trap of the calling
 * thread. A program that embeds libpari from a language runtime (Julia,
 * Python, Rust, ...) must not let that longjmp unwind the runtime's own
 * frames, and cannot arm the trap itself: setjmp has to run in a C frame
 * that stays alive for the whole call. libpari_trap() is that frame. It
 * arms `pari_CATCH`, calls the libpari function through a pointer, and
 * reports PARI's error number instead of letting the error escape.
 *
 * Every argument and the result are pointer-sized integers (`intptr_t`):
 * a `GEN` is a pointer, and PARI's word type `long` is pointer-sized on
 * every platform PARI supports (pari.h redefines `long` as `long long` on
 * 64-bit Windows). `intptr_t` keeps this header independent of pari.h.
 */
#ifndef LIBPARI_TRAP_H
#define LIBPARI_TRAP_H

#include <stdint.h>

#ifdef __cplusplus
extern "C" {
#endif

/* Version of the calling convention below. It changes whenever the
 * signature or the meaning of libpari_trap() changes; a caller should check
 * libpari_trap_abi_version() against the version it was written for. */
#define LIBPARI_TRAP_ABI_VERSION 1

/* The most arguments libpari_trap() can pass on. */
#define LIBPARI_TRAP_MAX_ARGS 8

/* How many arguments the libpari function takes: the `nargs` argument of
 * libpari_trap(). */
enum libpari_trap_nargs {
  LIBPARI_TRAP_NARGS_0 = 0,
  LIBPARI_TRAP_NARGS_1 = 1,
  LIBPARI_TRAP_NARGS_2 = 2,
  LIBPARI_TRAP_NARGS_3 = 3,
  LIBPARI_TRAP_NARGS_4 = 4,
  LIBPARI_TRAP_NARGS_5 = 5,
  LIBPARI_TRAP_NARGS_6 = 6,
  LIBPARI_TRAP_NARGS_7 = 7,
  LIBPARI_TRAP_NARGS_8 = LIBPARI_TRAP_MAX_ARGS
};

/* What libpari_trap() stores in `*status`, besides PARI's own error numbers
 * (`enum err_list` in parierr.h, all >= 0) when the call raised a PARI
 * error. */
enum libpari_trap_status {
  LIBPARI_TRAP_OK = -1,          /* the call returned normally */
  LIBPARI_TRAP_BAD_NARGS = -2    /* `nargs` is outside 0..MAX_ARGS: no call */
};

/* LIBPARI_TRAP_ABI_VERSION, as built into the library. */
int libpari_trap_abi_version(void);

/*
 * Call `fn`, a libpari function taking `nargs` pointer-sized arguments,
 * passing it the first `nargs` of `a0` ... `a7` (the others are ignored).
 *
 * Returns the function's result, or 0 if it raised a PARI error. Stores in
 * `*status` LIBPARI_TRAP_OK, the PARI error number (then read the error
 * itself with pari_err_last() before the next PARI call), or
 * LIBPARI_TRAP_BAD_NARGS.
 *
 * The calling thread must have a PARI context: the one pari_init() set up,
 * or one started with pari_thread_start().
 */
intptr_t libpari_trap(void *fn, intptr_t nargs, intptr_t *status,
                      intptr_t a0, intptr_t a1, intptr_t a2, intptr_t a3,
                      intptr_t a4, intptr_t a5, intptr_t a6, intptr_t a7);

#ifdef __cplusplus
}
#endif

#endif /* LIBPARI_TRAP_H */
