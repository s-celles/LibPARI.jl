# ---------------------------------------------------------------------------
# PARI error handling — trapping the Julia/C call boundary (M3).
# Included by src/LibPARI.jl after gen.jl.
# ---------------------------------------------------------------------------

"""
Module-scoped enum of PARI's error categories (PARI's `numerr_t`).

`PariErr.T` has one value per PARI error kind — `e_SYNTAX`, `e_TYPE`,
`e_DOMAIN`, `e_INV`, `e_STACK`, and so on. Each value's integer equals PARI's
own error number. See `gentype`'s sibling `PariError` for how it is used.
"""
module PariErr

@enum T begin
    e_SYNTAX = 1
    e_BUG
    e_ALARM
    e_FILE
    e_MISC
    e_FLAG
    e_IMPL
    e_ARCH
    e_PACKAGE
    e_NOTFUNC
    e_PREC
    e_TYPE
    e_DIM
    e_VAR
    e_PRIORITY
    e_USER
    e_STACK
    e_STACKTHREAD
    e_OVERFLOW
    e_DOMAIN
    e_COMPONENT
    e_MAXPRIME
    e_CONSTPOL
    e_IRREDPOL
    e_COPRIME
    e_PRIME
    e_MODULUS
    e_ROOTS0
    e_OP
    e_TYPE2
    e_INV
    e_MEM
    e_SQRTN
    e_FILEDESC
    e_NONE
end

end  # module PariErr

# Lowest / highest valid PARI error numbers.
const _ERR_MIN = Int(PariErr.e_SYNTAX)
const _ERR_MAX = Int(PariErr.e_NONE)

# Map a raw PARI error number to a `PariErr.T`; an out-of-range number falls
# back to `e_NONE`.
function _category(numerr::Integer)
    return _ERR_MIN <= numerr <= _ERR_MAX ? PariErr.T(numerr) : PariErr.e_NONE
end

"""
$(TYPEDEF)

Exception raised when a `libpari` call signals a PARI error.

`PariError` carries PARI's own error `message` and a `category` (a
`PariErr.T` naming the kind of error). It is an ordinary catchable Julia
exception — use `try`/`catch`.

# Examples

```jldoctest
julia> using LibPARI

julia> LibPARI.PariError <: Exception
true
```
"""
struct PariError <: Exception
    message::String
    category::PariErr.T
end

function Base.showerror(io::IO, e::PariError)
    print(io, "PariError(", e.category, "): ", e.message)
    return nothing
end

# Render PARI's message for an error object `E` into a Julia-owned `String`.
function _err_message(E::Ptr{Clong})
    E == C_NULL && return "PARI error"
    msgptr = ccall((:pari_err2str, PARI_jll.libpari), Cstring, (Ptr{Clong},), E)
    msgptr == C_NULL && return "PARI error"
    message = unsafe_string(msgptr)
    ccall((:pari_free, PARI_jll.libpari), Cvoid, (Cstring,), msgptr)
    return message
end

# Callback PARI invokes through `cb_pari_err_handle`, passing the error
# object. It builds a `PariError` from the error's message and number, then
# throws it — Julia's exception unwind takes the place of PARI's `longjmp`,
# landing at the `try` in `protected_call`. The error number is component 1
# of the error object (`err_get_num(e) == e[1]`).
function _err_handle(E::Ptr{Clong})
    numerr = E == C_NULL ? Clong(_ERR_MAX) : unsafe_load(Ptr{Clong}(E), 2)
    throw(PariError(_err_message(E), _category(numerr)))
    return Cint(0)  # unreachable — the throw never returns
end

# Callback PARI invokes through `cb_pari_err_recover`. The handler above
# normally throws first; this is a fallback for any error path that reaches
# recovery without `cb_pari_err_handle`.
function _err_recover(numerr::Clong)
    throw(PariError("PARI error", _category(numerr)))
    return nothing
end

# Install the PARI error callbacks. Called once from `__init__`, after PARI is
# initialized.
function _install_error_handlers!()
    recover = @cfunction(_err_recover, Cvoid, (Clong,))
    handle = @cfunction(_err_handle, Cint, (Ptr{Clong},))
    unsafe_store!(
        Ptr{Ptr{Cvoid}}(cglobal((:cb_pari_err_recover, PARI_jll.libpari))),
        recover,
    )
    unsafe_store!(
        Ptr{Ptr{Cvoid}}(cglobal((:cb_pari_err_handle, PARI_jll.libpari))),
        handle,
    )
    return nothing
end

"""
Run `producer` — a function performing one or more `libpari` calls — inside
the PARI error-trapping boundary.

On success the result of `producer()` is returned unchanged. If a `libpari`
call raises a PARI error, a `PariError` is thrown; the PARI stack pointer is
restored to its pre-call value before the exception propagates, so the
library stays usable. This is the boundary every generated binding (M4)
routes through.

# Examples

```jldoctest
julia> using LibPARI

julia> LibPARI.protected_call isa Function
true
```
"""
function protected_call(producer)
    return _run_on_pari() do
        av = _avma()
        try
            return producer()
        catch e
            if e isa PariError
                _set_avma(av)
            end
            rethrow(e)
        end
    end
end
