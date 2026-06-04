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
# `long` — PARI's word type, which `pari.h` redefines to `long long`
# (64-bit) on Windows 64-bit / LLP64, so it is pointer-sized on every
# platform here. The return is `intptr_t` (identical width) to make the
# pointer-sized intent explicit. The Julia side marshals these as `Int`,
# never `Clong`: Julia's `Clong` is only 32-bit on Windows and would
# truncate `GEN` pointers.
const _TRAP_C_SOURCE = """
#include <pari/pari.h>
#include <stdint.h>
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
"""

# The shim's argument-count ceiling (the `switch` extent above).
const _TRAP_MAXARGS = 8

# Trap state — created/assigned in `__init__`, never at module-definition
# time (the precompilation gotcha).
const _TRAP_AVAILABLE = Ref{Bool}(false)
const _TRAP_FN = Ref{Ptr{Cvoid}}(C_NULL)

# PARI's last error object for the current thread.
_pari_err_last() = ccall((:pari_err_last, PARI_jll.libpari), Ptr{Int}, ())

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
#
# `r` is `Int` — a pointer-sized signed integer on every supported
# platform (Int64 on 64-bit, including Windows 64-bit / LLP64). It is the
# Julia counterpart of PARI's word type: PARI redefines `long` to
# `long long` on Windows (parigen.h), so the PARI word is 64-bit there
# even though C's `long` is 32-bit. Using `Int` (never `Clong`) keeps the
# boundary correct on Windows; on Linux/macOS LP64 they coincide.
@inline function _trap_reinterpret(::Type{R}, r::Int) where {R}
    if R === Ptr{Int}
        return reinterpret(Ptr{Int}, r)
    elseif R === Int
        return r
    elseif R === UInt
        return reinterpret(UInt, r)
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
    a0::Int,
    a1::Int,
    a2::Int,
    a3::Int,
    a4::Int,
    a5::Int,
    a6::Int,
    a7::Int,
) where {R}
    if _TRAP_AVAILABLE[]
        errnum = Ref{Int}(Int(-1))
        r = ccall(
            _TRAP_FN[],
            Int,
            (Ptr{Cvoid}, Int, Ptr{Int}, Int, Int, Int, Int, Int, Int, Int, Int),
            fn,
            Int(n),
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
            Int,
            (Int, Int, Int, Int, Int, Int, Int, Int),
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
