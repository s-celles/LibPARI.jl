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

# The shim's source is `src/libpari_trap.c` (it documents the calling
# convention). It is read here, at precompilation, and compiled at load when
# a C compiler is available; a prebuilt build of the same file can be used
# instead. A change to the file triggers recompilation of the package.
const _TRAP_C_FILE = joinpath(@__DIR__, "libpari_trap.c")
include_dependency(_TRAP_C_FILE)
const _TRAP_C_SOURCE = read(_TRAP_C_FILE, String)

# Version of the shim's calling convention, which the shim reports through
# `libpari_trap_abi_version()`. Bump it together with the C file.
const _TRAP_ABI = 1

# The shim's argument-count ceiling (the `switch` extent above).
const _TRAP_MAXARGS = 8

# Trap state — created/assigned in `__init__`, never at module-definition
# time (the precompilation gotcha).
const _TRAP_AVAILABLE = Ref{Bool}(false)
const _TRAP_FN = Ref{Ptr{Cvoid}}(C_NULL)
const _TRAP_LIB = Ref{Ptr{Cvoid}}(C_NULL)   # the loaded shim library
# Why the shim is, or is not, in use: `"loaded"`, or the reason it is not
# (disabled, no compiler, the build or `dlopen` error, a failed self-test).
const _TRAP_STATUS = Ref{String}("not initialized")

# PARI's last error object for the current thread.
_pari_err_last() = ccall((:pari_err_last, PARI_jll.libpari), Ptr{Int}, ())

# Environment variable that, set to `1`, skips the trap shim as if no C
# compiler were available — so the fallback mode can be exercised anywhere.
const DISABLE_TRAP_ENV = "LIBPARI_DISABLE_TRAP"

# Environment variable that, set to `1`, compiles the shim at load even when
# PARI_jll ships one prebuilt — for work on src/libpari_trap.c itself.
const COMPILE_TRAP_ENV = "LIBPARI_TRAP_COMPILE"

# Where the shim in use came from: `:prebuilt` (PARI_jll's `libpari_trap`
# product), `:compiled` (at load) or `:none`.
const _TRAP_ORIGIN = Ref{Symbol}(:none)

# Load the trap shim. Best-effort — any failure leaves `_TRAP_AVAILABLE`
# false and the M3 callback fallback in place; so does
# `LIBPARI_DISABLE_TRAP=1`. `_TRAP_STATUS` records why. In order:
#
# 1. PARI_jll's prebuilt `libpari_trap` (from PARI_jll 200.1900.101), unless
#    `LIBPARI_TRAP_COMPILE=1`: no C compiler needed;
# 2. compiling src/libpari_trap.c with `cc`, `gcc` or `clang` from the PATH.
#
# Called once from `__init__`, before the worker pool starts: without the
# shim the pool starts no secondary context (see `_start_pari_worker_pool!`),
# which also self-tests the shim on the primary context first.
function _compile_and_load_trap!()
    _TRAP_AVAILABLE[] = false
    _TRAP_ORIGIN[] = :none
    if get(ENV, DISABLE_TRAP_ENV, "") == "1"
        _TRAP_STATUS[] = "disabled by $(DISABLE_TRAP_ENV)=1"
        return nothing
    end
    reasons = String[]
    if get(ENV, COMPILE_TRAP_ENV, "") != "1"
        _load_prebuilt_trap!() && return nothing
        push!(reasons, "prebuilt: " * _TRAP_STATUS[])
    end
    _compile_trap!() && return nothing
    _TRAP_STATUS[] = join(push!(reasons, _TRAP_STATUS[]), "; ")
    return nothing
end

# Use PARI_jll's prebuilt shim, the `libpari_trap` product. Returns success.
function _load_prebuilt_trap!()
    if !isdefined(PARI_jll, :libpari_trap_path)
        _TRAP_STATUS[] = "PARI_jll ships no libpari_trap (it needs >= 200.1900.101)"
        return false
    end
    lib = try
        Base.Libc.Libdl.dlopen(getfield(PARI_jll, :libpari_trap_path))
    catch e
        _TRAP_STATUS[] =
            "cannot load PARI_jll's libpari_trap: " * sprint(showerror, e)
        return false
    end
    _use_trap_library!(lib, "loaded") || return false
    _TRAP_ORIGIN[] = :prebuilt
    return true
end

# Compile src/libpari_trap.c and load it. Returns success.
function _compile_trap!()
    cc = something(Sys.which("cc"), Sys.which("gcc"), Sys.which("clang"), "")
    if isempty(cc)
        _TRAP_STATUS[] = "no C compiler (cc, gcc, clang) on the PATH"
        return false
    end
    Libdl = Base.Libc.Libdl
    csrc = tempname() * ".c"
    clib = tempname() * "." * Libdl.dlext
    write(csrc, _TRAP_C_SOURCE)
    failures = String[]
    for cmd in _trap_build_cmds(cc, PARI_jll.artifact_dir, csrc, clib)
        err = IOBuffer()
        try
            run(pipeline(cmd; stdout = devnull, stderr = err))
            if _use_trap_library!(Libdl.dlopen(clib), "loaded")
                _TRAP_ORIGIN[] = :compiled
                return true
            end
            push!(failures, _TRAP_STATUS[])
        catch e
            msg = strip(String(take!(err)))
            push!(failures, isempty(msg) ? sprint(showerror, e) : msg)
        end
    end
    _TRAP_STATUS[] = "build or load failed: " * join(failures, " | ")
    return false
end

# The compiler commands to try, in order, building the shim against
# PARI_jll's headers and library. One command line serves every platform:
#
# - `-L lib -L bin`: the import library is in `lib/` on Unix but in `bin/`
#   on Windows (`libpari.dll.a`).
# - `-shared-libgcc` first: on Windows libpari reaches its thread-locals
#   (`iferr_env`, `avma`, ...) through MinGW's emulated TLS, imported from
#   the shared `libgcc_s_seh-1.dll`; the shim must use that same runtime, or
#   it would arm its own copy of `iferr_env`, which libpari never reads.
#   Elsewhere the option is harmless. The second command, without it, is for
#   a compiler that rejects it; a shim built against the wrong runtime is
#   then caught by `_trap_selftest` and not used.
function _trap_build_cmds(cc, art, csrc, clib)
    inc = joinpath(art, "include")
    lib = joinpath(art, "lib")
    bin = joinpath(art, "bin")
    base = `$cc -shared -fPIC -O2 -I$inc $csrc -o $clib -L$lib -L$bin -lpari`
    return (`$base -shared-libgcc`, base)
end

# The ABI version a shim library reports (0 if it has no version symbol).
function _trap_abi_version(lib::Ptr{Cvoid})
    sym = Base.Libc.Libdl.dlsym_e(lib, :libpari_trap_abi_version)
    sym == C_NULL && return 0
    return Int(ccall(sym, Cint, ()))
end

# Adopt the shim in `lib` if it reports the ABI version this LibPARI expects;
# record `status` on success, the mismatch otherwise. Returns success.
function _use_trap_library!(lib::Ptr{Cvoid}, status::AbstractString)
    abi = _trap_abi_version(lib)
    if abi != _TRAP_ABI
        _TRAP_STATUS[] = "shim ABI version $(abi), expected $(_TRAP_ABI)"
        return false
    end
    _TRAP_LIB[] = lib
    _TRAP_FN[] = Base.Libc.Libdl.dlsym(lib, :libpari_trap)
    _TRAP_AVAILABLE[] = true
    _TRAP_STATUS[] = String(status)
    return true
end

"""
Check, on the calling PARI context, that the loaded shim really catches a
PARI error on its own path: evaluate `1/0` through it and expect the
shim's `errnum`, not an exception thrown by the fallback callback (which is
what a shim arming a different `iferr_env` than libpari's would produce).
"""
function _trap_selftest()
    _TRAP_AVAILABLE[] || return false
    expr = "1/0"
    errnum = Ref{Int}(-1)
    try
        GC.@preserve expr ccall(
            _TRAP_FN[],
            Int,
            (Ptr{Cvoid}, Int, Ptr{Int}, Int, Int, Int, Int, Int, Int, Int, Int),
            cglobal((:gp_read_str, PARI_jll.libpari)),
            1,
            errnum,
            reinterpret(Int, pointer(expr)),
            0,
            0,
            0,
            0,
            0,
            0,
            0,
        )
    catch
        return false            # reached the fallback callback instead
    end
    return errnum[] >= 0
end

# PARI's parallel engine (see `set_nbthreads!`) is open: a parallel section
# is running, or was left open.
_mt_is_parallel() = ccall((:mt_is_parallel, PARI_jll.libpari), Cint, ()) != 0

# After a PARI error caught on the primary context, close the parallel
# section PARI may have left open: an error raised inside a section reaches
# the caller through `pari_err`, and `pari_CATCH` does not reset PARI's
# parallel state, so its worker threads would stay up and every later
# parallel call would silently run serially. Only the primary context opens
# sections (the others count as PARI workers), and it runs one job at a time,
# so a section still open after its own error is that call's, and stale. On
# any other context it would be the primary's running section: left alone.
function _close_parallel_section!()
    Threads.threadid() == _PARI_PRIMARY[] || return nothing
    _mt_is_parallel() || return nothing
    ccall((:mt_queue_reset, PARI_jll.libpari), Cvoid, ())
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
            err = PariError(_err_message(_pari_err_last()), _category(errnum[]))
            _close_parallel_section!()
            throw(err)
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
