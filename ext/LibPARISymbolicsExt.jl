# ---------------------------------------------------------------------------
# LibPARISymbolicsExt — the Symbolics.jl bridge (M19).
#
# Loaded only when `Symbolics` is loaded alongside `LibPARI`. LibPARI hosts
# this bridge because Symbolics.jl will not take a weak dependency on
# LibPARI: you host the bridges to packages that will not host them for you.
#
# CONTRACT. The bridge is value-preserving and name-preserving; it is NOT
# representation-preserving. A PARI polynomial carries a variable *priority*
# — a process-global ordering that decides the main variable, and hence the
# internal structure and the printed form. Symbolics has no such notion, so
# the ordering is lost outward and re-derived inward. Compare round trips by
# value (`==`, which is PARI's `gequal`), never by `string`.
# ---------------------------------------------------------------------------

module LibPARISymbolicsExt

using LibPARI
using Symbolics

const PT = LibPARI.PariType

# --- PARI -> Symbolics -----------------------------------------------------

# The name of a polynomial's main variable, as PARI reports it. `variable`
# returns the free symbol itself, whose text is the name.
_mainvar_name(g::LibPARI.Gen) = Symbol(string(LibPARI.PARI.gpolvar(; x1 = g)))

function LibPARI.to_symbolics(g::LibPARI.Gen)
    t = LibPARI.gentype(g)
    if t === PT.T_INT
        return BigInt(g)
    elseif t === PT.T_FRAC
        return Rational(g)
    elseif t === PT.T_REAL
        return BigFloat(g)
    elseif t === PT.T_COMPLEX
        return LibPARI.to_symbolics(real(g)) +
               LibPARI.to_symbolics(imag(g)) * im
    elseif t === PT.T_POL
        # Horner over the main variable; each coefficient is converted
        # recursively, so a multivariate polynomial nests correctly.
        v = Symbolics.variable(_mainvar_name(g))
        d = LibPARI.degree(g)
        acc = LibPARI.to_symbolics(LibPARI.coeff(g, d))
        for k = (d-1):-1:0
            acc = acc * v + LibPARI.to_symbolics(LibPARI.coeff(g, k))
        end
        return acc
    elseif t === PT.T_VEC || t === PT.T_COL || t === PT.T_VECSMALL
        return [LibPARI.to_symbolics(x) for x in g]
    elseif t === PT.T_MAT
        nrows, ncols = size(g)
        return [LibPARI.to_symbolics(g[i, j]) for i = 1:nrows, j = 1:ncols]
    end
    throw(
        ArgumentError(
            "no Symbolics counterpart for a PARI $t; the bridge covers " *
            "T_INT, T_FRAC, T_REAL, T_COMPLEX, T_POL, T_VEC, T_COL, " *
            "T_VECSMALL and T_MAT",
        ),
    )
end

# --- Symbolics -> PARI -----------------------------------------------------

# A Symbolics variable becomes the PARI free symbol of the same name. GP
# creates it on demand, so names survive the round trip.
_pari_var(name::Symbol) = LibPARI.gp_eval(string(name))

function _to_pari(e)
    e = Symbolics.unwrap(e)
    if e isa Number
        return LibPARI.pari(e)
    end
    # Symbolics 7 wraps numeric literals in a symbolic node that is neither
    # a `Number` nor a symbol nor a call, so a walk over those three cases —
    # which looks exhaustive — silently drops literals. `value` unwraps it.
    # On Symbolics 6 a literal is already a plain `Number`, and `value` of a
    # symbol returns the symbol, so this test is correct on both.
    #
    # The three cases only *look* exhaustive because TermInterface's
    # protocol is incompletely implemented: `isexpr`, `head` and `children`
    # are missing, so a node can report `iscall == true` and
    # `isexpr == false` at once. Reported upstream as
    # JuliaSymbolics/SymbolicUtils.jl#1023; see upstream-bugs.md.
    v = Symbolics.value(e)
    if v isa Number
        return LibPARI.pari(v)
    end
    if Symbolics.issym(e)
        return _pari_var(nameof(e))
    elseif Symbolics.iscall(e)
        op = Symbolics.operation(e)
        args = map(_to_pari, Symbolics.arguments(e))
        op === (+) && return reduce(+, args)
        op === (*) && return reduce(*, args)
        op === (-) && return length(args) == 1 ? -args[1] : args[1] - args[2]
        op === (/) && return args[1] / args[2]
        op === (^) && return args[1]^args[2]
        throw(
            ArgumentError(
                "the Symbolics bridge does not translate `$op`; it covers " *
                "+, -, *, / and ^ over numbers, variables and polynomials",
            ),
        )
    end
    throw(ArgumentError("cannot convert $(typeof(e)) to a PARI value"))
end

LibPARI.pari(x::Symbolics.Num) = _to_pari(x)
LibPARI.pari(x::Symbolics.SymbolicUtils.BasicSymbolic) = _to_pari(x)

end # module LibPARISymbolicsExt
