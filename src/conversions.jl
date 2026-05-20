# ---------------------------------------------------------------------------
# Type conversions — Julia integers ↔ `Gen`, and textual representation (M5).
# Included by src/LibPARI.jl after errors.jl, before bindings.jl.
# ---------------------------------------------------------------------------

# --- Textual representation (PARI's GENtostr) ------------------------------

# Render a raw PARI `GEN` pointer to a Julia `String` via PARI's own
# `GENtostr`. `GENtostr` returns a heap-allocated C string the caller owns; it
# is copied into a Julia `String` and the C buffer freed with `pari_free`.
function _genstr(ptr::Ptr{Clong})
    s = ccall((:GENtostr, PARI_jll.libpari), Cstring, (Ptr{Clong},), ptr)
    s == C_NULL && return "GEN"
    str = unsafe_string(s)
    ccall((:pari_free, PARI_jll.libpari), Cvoid, (Cstring,), s)
    return str
end

# Render a `Gen` to its PARI textual representation. The capture/restore of
# `avma` discards any transient PARI-stack use; `protected_call` keeps the
# Julia/C boundary error-safe.
function _genrepr(g::Gen)
    return protected_call() do
        av = _avma()
        str = _genstr(g.ptr)
        _set_avma(av)
        return str
    end
end

# --- Julia integer → Gen ---------------------------------------------------

# Build a raw integer-valued `GEN` from a Julia `Integer`, on the PARI stack.
# Word-sized values use `stoi`/`utoi`; larger magnitudes are parsed from their
# base-10 digit string with `strtoi` (digits only — `strtoi` ignores a sign,
# so a negative value is negated afterwards with `gneg`).
function _integer_to_gen(x::Integer)
    if typemin(Clong) <= x <= typemax(Clong)
        return ccall((:stoi, PARI_jll.libpari), Ptr{Clong}, (Clong,), x % Clong)
    elseif 0 <= x <= typemax(Culong)
        return ccall(
            (:utoi, PARI_jll.libpari),
            Ptr{Clong},
            (Culong,),
            x % Culong,
        )
    end
    s = string(x)
    negative = startswith(s, '-')
    digits = negative ? s[2:end] : s
    t = ccall((:strtoi, PARI_jll.libpari), Ptr{Clong}, (Cstring,), digits)
    return negative ?
           ccall((:gneg, PARI_jll.libpari), Ptr{Clong}, (Ptr{Clong},), t) : t
end

"""
$(TYPEDSIGNATURES)

Convert a Julia `Integer` of any magnitude to an integer-valued `Gen` (a PARI
`t_INT`).

# Examples

```jldoctest
julia> using LibPARI

julia> LibPARI.Gen(42) isa LibPARI.Gen
true
```
"""
Gen(x::Integer) = protected_call(() -> gen_from(() -> _integer_to_gen(x)))

Base.convert(::Type{Gen}, x::Integer) = Gen(x)

# --- Gen integer → Julia ---------------------------------------------------

"""
$(TYPEDSIGNATURES)

Convert an integer-valued `Gen` to an exact Julia `BigInt`.

Throws `InexactError` when `g` is not an integer — a fraction, a real with a
fractional part, or a non-numeric value.

# Examples

```jldoctest
julia> using LibPARI

julia> BigInt(LibPARI.Gen(-123456789))
-123456789
```
"""
function Base.BigInt(g::Gen)
    return protected_call() do
        out = Ref{Ptr{Clong}}(C_NULL)
        av = _avma()
        flag = ccall(
            (:isint, PARI_jll.libpari),
            Clong,
            (Ptr{Clong}, Ref{Ptr{Clong}}),
            g.ptr,
            out,
        )
        if flag == 0
            _set_avma(av)
            throw(InexactError(:BigInt, BigInt, g))
        end
        str = _genstr(out[])
        _set_avma(av)
        return parse(BigInt, str)
    end
end

# --- Gen integer → fixed-width Julia integer -------------------------------

"""
$(TYPEDSIGNATURES)

Convert an integer-valued `Gen` to a fixed-width Julia integer type `T`.

Throws `InexactError` when `g` is not an integer, or when its value lies
outside the range of `T`.

# Examples

```jldoctest
julia> using LibPARI

julia> Int(LibPARI.Gen(255))
255
```
"""
(::Type{T})(g::Gen) where {T<:Integer} = T(BigInt(g))

Base.convert(::Type{T}, g::Gen) where {T<:Integer} = T(g)

# --- Display ---------------------------------------------------------------

# A `Gen` shows, prints, and interpolates as PARI's own textual rendering.
Base.show(io::IO, g::Gen) = print(io, _genrepr(g))

Base.print(io::IO, g::Gen) = print(io, _genrepr(g))
