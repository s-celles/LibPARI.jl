# M17 — idiomatic access to PARI's container types (REQ-IDX-01 … REQ-IDX-09).
#
# `Gen` deliberately does NOT subtype `AbstractArray`: one runtime-tagged
# type cannot honestly promise a static array interface when the same type
# also wraps integers, strings and closures. The relevant Base methods are
# defined directly, and refuse the types where they mean nothing.
#
# Ownership, established by REQ-IDX-01 before any accessor was written:
# reading a component goes through PARI's `compo` inside `gen_from`, which
# `gclone`s the result. Every element returned is therefore a full owner of
# its memory and outlives its parent — element access CLONES.

@testitem "REQ-IDX-02: length, size and axes over the container types" begin
    using LibPARI

    v = gp_eval("[10,20,30]")          # t_VEC
    c = gp_eval("[10,20,30]~")         # t_COL
    m = gp_eval("[1,2,3;4,5,6]")       # t_MAT, 2 rows x 3 columns
    vs = gp_eval("Vecsmall([7,8,9])")  # t_VECSMALL

    @test length(v) == 3
    @test length(c) == 3
    @test length(vs) == 3
    @test length(m) == 6               # elements, as Base means it

    @test size(v) == (3,)
    @test size(c) == (3,)
    @test size(vs) == (3,)
    # PARI stores a t_MAT by columns; Julia states (rows, columns).
    @test size(m) == (2, 3)
    @test size(m, 1) == 2
    @test size(m, 2) == 3

    @test axes(v) == (Base.OneTo(3),)
    @test axes(m) == (Base.OneTo(2), Base.OneTo(3))
    @test ndims(v) == 1
    @test ndims(m) == 2
end

@testitem "REQ-IDX-04: indexing is one-based and bounds-checked" begin
    using LibPARI

    v = gp_eval("[10,20,30]")
    @test v[1] == 10
    @test v[2] == 20
    @test v[3] == 30
    @test v[end] == 30
    @test firstindex(v) == 1
    @test lastindex(v) == 3

    @test_throws BoundsError v[0]
    @test_throws BoundsError v[4]
    @test_throws BoundsError v[-1]

    m = gp_eval("[1,2,3;4,5,6]")
    @test m[1, 1] == 1
    @test m[2, 1] == 4
    @test m[1, 3] == 3
    @test m[2, 3] == 6
    @test_throws BoundsError m[3, 1]
    @test_throws BoundsError m[1, 4]
    @test_throws BoundsError m[0, 1]

    vs = gp_eval("Vecsmall([7,8,9])")
    @test vs[2] == 8
end

@testitem "REQ-IDX-04: a non-container Gen refuses the array interface" begin
    using LibPARI

    for g in (pari(42), pari(3 // 4), pari(1.5), gp_eval("\"abc\""))
        @test_throws ArgumentError length(g)
        @test_throws ArgumentError size(g)
        @test_throws ArgumentError g[1]
        @test_throws ArgumentError collect(g)
    end

    # The error names the PARI type, so the message says what went wrong.
    msg = try
        pari(42)[1]
        ""
    catch e
        sprint(showerror, e)
    end
    @test occursin("T_INT", msg)

    # And `Gen` must not claim to be an array.
    @test !(LibPARI.Gen <: AbstractArray)
end

@testitem "REQ-IDX-02: iteration and collection" begin
    using LibPARI

    v = gp_eval("[10,20,30]")
    @test eltype(v) === LibPARI.Gen
    @test collect(v) isa Vector{LibPARI.Gen}
    @test length(collect(v)) == 3
    @test BigInt.(collect(v)) == [10, 20, 30]

    # `foldl` rather than a `for` loop with an accumulator: a `@testitem`
    # body is module scope, where assigning inside a `for` creates a LOCAL
    # rather than updating the global. It also exercises the iteration
    # protocol through a generic Base algorithm, which is the stronger test.
    @test foldl((a, x) -> a + x, v; init = pari(0)) == 60
    @test reduce(+, v) == 60

    @test [BigInt(x) for x in v] == [10, 20, 30]
    @test sum(BigInt(x) for x in v) == 60
    @test first(v) == 10

    # A matrix iterates in Julia's column-major order, like its `size`.
    m = gp_eval("[1,2,3;4,5,6]")
    @test BigInt.(collect(m)) == [1, 4, 2, 5, 3, 6]

    vs = gp_eval("Vecsmall([7,8,9])")
    @test BigInt.(collect(vs)) == [7, 8, 9]
end

@testitem "REQ-IDX-02: Vector{Gen} and Matrix{Gen} conversions" begin
    using LibPARI

    v = gp_eval("[10,20,30]")
    m = gp_eval("[1,2,3;4,5,6]")

    jv = Vector{LibPARI.Gen}(v)
    @test jv isa Vector{LibPARI.Gen}
    @test BigInt.(jv) == [10, 20, 30]

    jm = Matrix{LibPARI.Gen}(m)
    @test jm isa Matrix{LibPARI.Gen}
    @test size(jm) == (2, 3)
    @test BigInt.(jm) == [1 2 3; 4 5 6]

    @test_throws ArgumentError Matrix{LibPARI.Gen}(v)
end

@testitem "REQ-IDX-06: element access clones, and outlives its parent" begin
    using LibPARI

    v = gp_eval("[10,20,30]")
    e = v[2]
    # The element is a full owner: PARI's `compo` result is cloned by
    # `gen_from`, so dropping the parent cannot invalidate it.
    v = nothing
    GC.gc()
    GC.gc()
    @test e == 20
    @test BigInt(e) == 20
end

@testitem "REQ-IDX-07: iteration leaks no PARI stack" begin
    using LibPARI

    v = gp_eval("[10,20,30]")
    m = gp_eval("[1,2,3;4,5,6]")
    collect(v)
    av = LibPARI._avma()
    for _ = 1:5_000
        for x in v
            x
        end
        collect(m)
        v[2]
        m[1, 2]
    end
    GC.gc()
    @test LibPARI._avma() == av
end

@testitem "REQ-IDX-09: the container interface is type-stable" begin
    using LibPARI
    using Test

    v = gp_eval("[10,20,30]")
    m = gp_eval("[1,2,3;4,5,6]")

    @test (@inferred length(v)) isa Int
    @test (@inferred v[1]) isa LibPARI.Gen
    @test (@inferred m[1, 2]) isa LibPARI.Gen
    @test (@inferred eltype(v)) === LibPARI.Gen
    @test only(Base.return_types(collect, Tuple{LibPARI.Gen})) ===
          Vector{LibPARI.Gen}
end

@testitem "REQ-IDX-03: t_LIST is read-only here" begin
    using LibPARI

    l = gp_eval("List([1,2,3])")
    @test LibPARI.gentype(l) === LibPARI.PariType.T_LIST
    @test length(l) == 3
    @test l[2] == 2
    @test BigInt.(collect(l)) == [1, 2, 3]

    # A `t_LIST` is mutable in PARI. LibPARI exposes reading only: mutating
    # it through a Julia `setindex!` would need an ownership story this
    # milestone does not have, so it is deliberately absent.
    @test !hasmethod(setindex!, Tuple{LibPARI.Gen,Any,Int})
end
