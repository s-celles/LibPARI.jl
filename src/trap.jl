# ---------------------------------------------------------------------------
# Concurrency-safe PARI error trap (feature 014).
# Included by src/LibPARI.jl after errors.jl.
# ---------------------------------------------------------------------------
#
# PARI's error trap is a per-thread `longjmp` to an `iferr_env` set up by
# `setjmp`. A PARI error `longjmp` must unwind ONLY C frames — never a Julia
# runtime frame — or it abandons that frame and corrupts the task's GC
# bookkeeping (proven during feature 013: a GC deadlock). So every
# error-prone `libpari` call runs through a small pure-C shim,
# `libpari_trap`, that performs the `setjmp` in a real C frame and calls the
# PARI function pointer DIRECTLY — a PARI error then `longjmp`s back across
# C frames only.
#
# The shim is built at load from PARI's public `pari_CATCH` macros. It is
# OPTIONAL: if no C compiler is available LibPARI falls back to milestone
# M3's callback (single-threaded-safe). See `upstream-bugs.md` for the
# request to ship this trap in PARI itself.

# The shim — a generic-arity trampoline. Every argument is passed as a
# pointer-sized integer (a GEN, a `long`, a string pointer all share one
# ABI register class), so a single `switch` over the argument count covers
# the whole bound surface.
const _TRAP_C_SOURCE = """
#include <pari/pari.h>
long
libpari_trap(void *fn, long n, long *errnum,
             long a0, long a1, long a2, long a3,
             long a4, long a5, long a6, long a7)
{
  long r = 0;
  pari_CATCH(CATCH_ALL)
  {
    *errnum = err_get_num(pari_err_last());
  }
  pari_TRY
  {
    switch (n)
    {
      case 0: r = ((long(*)(void))fn)(); break;
      case 1: r = ((long(*)(long))fn)(a0); break;
      case 2: r = ((long(*)(long,long))fn)(a0,a1); break;
      case 3: r = ((long(*)(long,long,long))fn)(a0,a1,a2); break;
      case 4: r = ((long(*)(long,long,long,long))fn)(a0,a1,a2,a3); break;
      case 5: r = ((long(*)(long,long,long,long,long))fn)(a0,a1,a2,a3,a4); break;
      case 6: r = ((long(*)(long,long,long,long,long,long))fn)
                  (a0,a1,a2,a3,a4,a5); break;
      case 7: r = ((long(*)(long,long,long,long,long,long,long))fn)
                  (a0,a1,a2,a3,a4,a5,a6); break;
      case 8: r = ((long(*)(long,long,long,long,long,long,long,long))fn)
                  (a0,a1,a2,a3,a4,a5,a6,a7); break;
    }
    *errnum = -1;
  }
  pari_ENDCATCH
  return r;
}
"""

# The shim's argument-count ceiling (the `switch` extent above).
const _TRAP_MAXARGS = 8

# Trap state — created/assigned in `__init__`, never at module-definition
# time (the precompilation gotcha).
const _TRAP_AVAILABLE = Ref{Bool}(false)
const _TRAP_FN = Ref{Ptr{Cvoid}}(C_NULL)

# PARI's last error object for the current thread.
_pari_err_last() = ccall((:pari_err_last, PARI_jll.libpari), Ptr{Clong}, ())

# Compile and load the trap shim. Best-effort — any failure (no C compiler,
# a build error) leaves `_TRAP_AVAILABLE` false and the M3 callback fallback
# in place. Called once from `__init__`.
function _compile_and_load_trap!()
    try
        cc = Sys.which("cc")
        cc === nothing && (cc = Sys.which("gcc"))
        cc === nothing && (cc = Sys.which("clang"))
        cc === nothing && return nothing      # no compiler → M3 fallback
        Libdl = Base.Libc.Libdl
        art = PARI_jll.artifact_dir
        inc = joinpath(art, "include")
        libdir = joinpath(art, "lib")
        csrc = tempname() * ".c"
        clib = tempname() * "." * Libdl.dlext
        write(csrc, _TRAP_C_SOURCE)
        run(
            pipeline(
                `$cc -shared -fPIC -O2 -I$inc $csrc -o $clib -L$libdir -lpari`;
                stdout = devnull,
                stderr = devnull,
            ),
        )
        _TRAP_FN[] = Libdl.dlsym(Libdl.dlopen(clib), :libpari_trap)
        _TRAP_AVAILABLE[] = true
    catch
        _TRAP_AVAILABLE[] = false
    end
    return nothing
end

# Reinterpret the shim's pointer-sized result to a binding's declared
# return type. `R` is a compile-time type parameter, so the branch folds
# away — the boundary stays type-stable.
@inline function _trap_reinterpret(::Type{R}, r::Clong) where {R}
    if R === Ptr{Clong}
        return reinterpret(Ptr{Clong}, r)
    elseif R === Clong
        return r
    elseif R === Culong
        return reinterpret(Culong, r)
    elseif R === Cint
        return r % Cint
    else                       # Cvoid — the result is unused
        return nothing
    end
end

"""
Run one `libpari` call — a PARI function `fn` of arity `n` with arguments
`a0…a7` marshalled to pointer-sized integers — under the concurrency-safe
error trap. Returns the result reinterpreted to `R`; throws a `PariError`
on a PARI error.

When the trap shim is unavailable the PARI function is called directly and
errors are handled by milestone M3's callback (single-threaded-safe). This
is the boundary every error-prone call path routes through (FR-008).
"""
function _trap_call(
    ::Type{R},
    fn::Ptr{Cvoid},
    n::Integer,
    a0::Clong,
    a1::Clong,
    a2::Clong,
    a3::Clong,
    a4::Clong,
    a5::Clong,
    a6::Clong,
    a7::Clong,
) where {R}
    if _TRAP_AVAILABLE[]
        errnum = Ref{Clong}(Clong(-1))
        r = ccall(
            _TRAP_FN[],
            Clong,
            (
                Ptr{Cvoid},
                Clong,
                Ptr{Clong},
                Clong,
                Clong,
                Clong,
                Clong,
                Clong,
                Clong,
                Clong,
                Clong,
            ),
            fn,
            Clong(n),
            errnum,
            a0,
            a1,
            a2,
            a3,
            a4,
            a5,
            a6,
            a7,
        )
        if errnum[] >= 0
            # Read PARI's message while the error object is still live,
            # before `protected_call` resets `avma`.
            throw(
                PariError(_err_message(_pari_err_last()), _category(errnum[])),
            )
        end
        return _trap_reinterpret(R, r)
    else
        # Fallback: call the PARI function directly — milestone M3's
        # `cb_pari_err_handle` callback handles errors (single-threaded-safe).
        r = ccall(
            fn,
            Clong,
            (Clong, Clong, Clong, Clong, Clong, Clong, Clong, Clong),
            a0,
            a1,
            a2,
            a3,
            a4,
            a5,
            a6,
            a7,
        )
        return _trap_reinterpret(R, r)
    end
end
