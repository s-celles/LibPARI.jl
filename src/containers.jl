# ---------------------------------------------------------------------------
# Idiomatic access to PARI's container types (M17).
# Included by src/LibPARI.jl after facade.jl.
# ---------------------------------------------------------------------------
#
# `Gen` deliberately does NOT subtype `AbstractArray`. One concrete `Gen`
# wraps every PARI object — integers, strings and closures included — so it
# cannot honestly promise a static array interface. The relevant Base methods
# are defined directly instead, and refuse the PARI types where they mean
# nothing (REQ-IDX-08).
#
# OWNERSHIP. Reading a component goes through PARI's `compo`, which the
# generated layer wraps in `gen_from` — so the result is `gclone`d into
# persistent storage. Every element handed to Julia is therefore a full
# owner of its memory and outlives its parent: **element access clones**
# (REQ-IDX-01, REQ-IDX-06). No pointer and no transient stack memory is ever
# exposed.
#
# LAYOUT. A PARI `t_MAT` is a list of COLUMNS: `glength` counts columns, and
# component `j` is the `j`-th column as a `t_COL`. Julia states dimensions
# as `(rows, columns)`, so `size` transposes that reading (REQ-IDX-05).

# The one-dimensional containers.
const _VECTOR_TYPES =
    (PariType.T_VEC, PariType.T_COL, PariType.T_VECSMALL, PariType.T_LIST)

_isvector(g::Gen) = gentype(g) in _VECTOR_TYPES
_ismatrix(g::Gen) = gentype(g) === PariType.T_MAT

# Refuse, naming the PARI type — the message has to say what went wrong.
function _not_a_container(f::Symbol, g::Gen)
    throw(
        ArgumentError(
            "$f is not defined for a PARI $(gentype(g)): it is not a " *
            "container. Only T_VEC, T_COL, T_VECSMALL, T_MAT and T_LIST " *
            "support the array interface.",
        ),
    )
end

# --- Shape -----------------------------------------------------------------

"""
$(TYPEDSIGNATURES)

The number of elements in a PARI container.

For a `t_MAT` this is the element count — rows × columns — as `Base.length`
means it, not PARI's column count (`LibPARI.PARI.glength` gives that).

Throws `ArgumentError` for a `Gen` that is not a container.

# Examples

```jldoctest
julia> using LibPARI

julia> length(gp_eval("[10,20,30]"))
3
```
"""
function Base.length(g::Gen)
    _isvector(g) && return PARI.glength(g)
    _ismatrix(g) && return prod(size(g))
    return _not_a_container(:length, g)
end

"""
$(TYPEDSIGNATURES)

The dimensions of a PARI container, in Julia's order.

A `t_MAT` gives `(rows, columns)`, transposing PARI's own column-major
reading; a vector type gives `(n,)`.

# Examples

```jldoctest
julia> using LibPARI

julia> size(gp_eval("[1,2,3;4,5,6]"))
(2, 3)
```
"""
function Base.size(g::Gen)
    _isvector(g) && return (PARI.glength(g),)
    if _ismatrix(g)
        ncols = PARI.glength(g)
        # An empty matrix has no first column to measure.
        nrows = ncols == 0 ? 0 : PARI.glength(PARI.compo(g, 1))
        return (nrows, ncols)
    end
    return _not_a_container(:size, g)
end

Base.size(g::Gen, d::Integer) = d <= length(size(g)) ? size(g)[d] : 1

Base.ndims(g::Gen) =
    _ismatrix(g) ? 2 : (_isvector(g) ? 1 : _not_a_container(:ndims, g))

Base.axes(g::Gen) = map(Base.OneTo, size(g))

Base.axes(g::Gen, d::Integer) = Base.OneTo(size(g, d))

Base.firstindex(g::Gen) =
    (_isvector(g) || _ismatrix(g)) ? 1 : _not_a_container(:firstindex, g)

Base.lastindex(g::Gen) = length(g)

Base.isempty(g::Gen) = length(g) == 0

Base.eltype(::Gen) = Gen

Base.eltype(::Type{Gen}) = Gen

# --- Indexing --------------------------------------------------------------

"""
$(TYPEDSIGNATURES)

The `i`-th element of a PARI container, as an owned [`Gen`](@ref).

Indices are one-based, as in Julia and as in PARI itself. A `t_MAT` indexes
in column-major order, matching its [`size`](@ref).

**The element is a clone**: it owns its own PARI storage and outlives the
container it came from.

# Examples

```jldoctest
julia> using LibPARI

julia> gp_eval("[10,20,30]")[2]
20
```
"""
function Base.getindex(g::Gen, i::Integer)
    if _isvector(g)
        n = PARI.glength(g)
        (1 <= i <= n) || throw(BoundsError(g, i))
        return PARI.compo(g, i)
    elseif _ismatrix(g)
        nrows, ncols = size(g)
        (1 <= i <= nrows * ncols) || throw(BoundsError(g, i))
        # Column-major, like the `size` above.
        col, row = divrem(i - 1, nrows)
        return g[row+1, col+1]
    end
    return _not_a_container(:getindex, g)
end

"""
$(TYPEDSIGNATURES)

The element at row `i`, column `j` of a PARI `t_MAT`, as an owned
[`Gen`](@ref).

# Examples

```jldoctest
julia> using LibPARI

julia> gp_eval("[1,2,3;4,5,6]")[2, 3]
6
```
"""
function Base.getindex(g::Gen, i::Integer, j::Integer)
    _ismatrix(g) || return _not_a_container(:getindex, g)
    nrows, ncols = size(g)
    (1 <= i <= nrows && 1 <= j <= ncols) || throw(BoundsError(g, (i, j)))
    # PARI stores columns, so the column is selected first.
    return PARI.compo(PARI.compo(g, j), i)
end

# --- Iteration -------------------------------------------------------------

function Base.iterate(g::Gen, state::Int = 1)
    (_isvector(g) || _ismatrix(g)) || return _not_a_container(:iterate, g)
    state > length(g) && return nothing
    return (g[state], state + 1)
end

Base.IteratorSize(::Type{Gen}) = Base.HasLength()

Base.IteratorEltype(::Type{Gen}) = Base.HasEltype()

# --- Conversion to Julia containers ----------------------------------------

"""
$(TYPEDSIGNATURES)

Copy a PARI vector or matrix into a Julia `Vector{Gen}`, in column-major
order.
"""
function Base.Vector{Gen}(g::Gen)
    (_isvector(g) || _ismatrix(g)) || return _not_a_container(:Vector, g)
    return Gen[g[i] for i = 1:length(g)]
end

"""
$(TYPEDSIGNATURES)

Copy a PARI `t_MAT` into a Julia `Matrix{Gen}`, with Julia's `(rows,
columns)` shape.

Throws `ArgumentError` for anything that is not a matrix — a `t_VEC` is not
silently reshaped.
"""
function Base.Matrix{Gen}(g::Gen)
    _ismatrix(g) || throw(
        ArgumentError(
            "Matrix{Gen} needs a PARI T_MAT, got $(gentype(g)); a vector is " *
            "not reshaped silently",
        ),
    )
    nrows, ncols = size(g)
    return Gen[g[i, j] for i = 1:nrows, j = 1:ncols]
end

Base.collect(g::Gen) = Vector{Gen}(g)
