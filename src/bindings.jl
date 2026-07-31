# ==========================================================================
# AUTO-GENERATED — DO NOT EDIT BY HAND.
# Generated from PARI's pari.desc by gen/generate.jl (milestone M4).
# Regenerate with:  julia --project=gen gen/generate.jl
# ==========================================================================

module PARI

import ..LibPARI

"!a: boolean operator \"not\"."
function gnot(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:gnot, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"#x: number of non code words in x, number of characters for a string."
function glength(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        Int(
            LibPARI._trap_call(
                Int,
                cglobal((:glength, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            ),
        )
    end
end

"#x~: number of non code words in x~"
function gtranslength(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        Int(
            LibPARI._trap_call(
                Int,
                cglobal((:gtranslength, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            ),
        )
    end
end

"last history item."
function pari_get_hist(; x1::Integer = 0)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:pari_get_hist, LibPARI.PARI_jll.libpari)),
                1,
                Int(x1),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"time to compute last history item."
function pari_histtime(; x1::Integer = 0)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:pari_histtime, LibPARI.PARI_jll.libpari)),
                1,
                Int(x1),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"-_: negate argument"
function gneg(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:gneg, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"Catalan=Catalan(): Catalan's number with current precision."
function mpcatalan(; prec::Integer = 4)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:mpcatalan, LibPARI.PARI_jll.libpari)),
                1,
                prec,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"Col(x,{n}): transforms the object x into a column vector of dimension n."
function gtocol0(x1::LibPARI.Gen; x2::Integer = 0)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:gtocol0, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(x2),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"Colrev(x,{n}): transforms the object x into a column vector of\ndimension n in reverse order with respect to Col(x,{n}). Empty vector if x\nis omitted."
function gtocolrev0(x1::LibPARI.Gen; x2::Integer = 0)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:gtocolrev0, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(x2),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"DEBUGLEVEL (PARI)"
function DEBUGLEVEL()
    LibPARI.protected_call() do
        LibPARI._trap_call(
            Cvoid,
            cglobal((:DEBUGLEVEL, LibPARI.PARI_jll.libpari)),
            0,
            Int(0),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
        )
    end
    return nothing
end

"Euler=Euler(): Euler's constant with current precision."
function mpeuler(; prec::Integer = 4)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:mpeuler, LibPARI.PARI_jll.libpari)),
                1,
                prec,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"I=I(): square root of -1."
function gen_I()
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:gen_I, LibPARI.PARI_jll.libpari)),
                0,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"List({x=[]}): transforms the vector or list x into a list. Empty list\nif x is omitted."
function gtolist(; x1 = nothing)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:gtolist, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}((x1 === nothing ? C_NULL : x1.ptr))),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"Map({x}): converts the matrix [a_1,b_1;a_2,b_2;...;a_n,b_n] to the map a_i->b_i."
function gtomap(; x1 = nothing)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:gtomap, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}((x1 === nothing ? C_NULL : x1.ptr))),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"Mat({x=[]}): transforms any GEN x into a matrix. Empty matrix if x is\nomitted."
function gtomat(; x1 = nothing)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:gtomat, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}((x1 === nothing ? C_NULL : x1.ptr))),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"Mod(a,b): create 'a modulo b'."
function gmodulo(x1::LibPARI.Gen, x2::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:gmodulo, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"O(p^e): p-adic or power series zero with precision given by e."
function ggrando()
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:ggrando, LibPARI.PARI_jll.libpari)),
                0,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"Pi=Pi(): the constant pi, with current precision."
function mppi(; prec::Integer = 4)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:mppi, LibPARI.PARI_jll.libpari)),
                1,
                prec,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"Pol(t,{v='x}): convert t (usually a vector or a power series) into a\npolynomial with variable v, starting with the leading coefficient."
function gtopoly(x1::LibPARI.Gen; x2::Integer = -1)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:gtopoly, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(x2),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"Polrev(t,{v='x}): convert t (usually a vector or a power series) into a\npolynomial with variable v, starting with the constant term."
function gtopolyrev(x1::LibPARI.Gen; x2::Integer = -1)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:gtopolyrev, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(x2),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"Qfb(a,{b},{c}): binary quadratic form a*x^2+b*x*y+c*y^2."
function Qfb0(x1::LibPARI.Gen; x2 = nothing, x3 = nothing)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:Qfb0, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}((x2 === nothing ? C_NULL : x2.ptr))),
                reinterpret(Int, Ptr{Int}((x3 === nothing ? C_NULL : x3.ptr))),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"Ser(s,{v='x},{d=seriesprecision}): convert s into a power series with\nvariable v and precision d, starting with the constant coefficient."
function Ser0(
    x1::LibPARI.Gen;
    x2::Integer = -1,
    x3 = nothing,
    seriesprec::Integer = 16,
)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:Ser0, LibPARI.PARI_jll.libpari)),
                4,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(x2),
                reinterpret(Int, Ptr{Int}((x3 === nothing ? C_NULL : x3.ptr))),
                seriesprec,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"Set({x=[]}): convert x into a set, i.e. a row vector with strictly\nincreasing coefficients. Empty set if x is omitted."
function gtoset(; x1 = nothing)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:gtoset, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}((x1 === nothing ? C_NULL : x1.ptr))),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"Strchr(x): deprecated alias for strchr."
function pari_strchr(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:pari_strchr, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"Vec(x,{n}): transforms the object x into a vector of dimension n."
function gtovec0(x1::LibPARI.Gen; x2::Integer = 0)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:gtovec0, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(x2),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"Vecrev(x,{n}): transforms the object x into a vector of dimension n\nin reverse order with respect to Vec(x,{n})."
function gtovecrev0(x1::LibPARI.Gen; x2::Integer = 0)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:gtovecrev0, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(x2),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"Vecsmall(x,{n}): transforms the object x into a VECSMALL of dimension n."
function gtovecsmall0(x1::LibPARI.Gen; x2::Integer = 0)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:gtovecsmall0, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(x2),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"[a..b] = [a,a+1,...,b]"
function vecrange(x1::LibPARI.Gen, x2::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:vecrange, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"n!: factorial of n."
function mpfact(x1::Integer)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:mpfact, LibPARI.PARI_jll.libpari)),
                1,
                Int(x1),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"a!=b: true if a and b are not equal."
function gne(x1::LibPARI.Gen, x2::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:gne, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"n#: primorial of n."
function mpprimorial(x1::Integer)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:mpprimorial, LibPARI.PARI_jll.libpari)),
                1,
                Int(x1),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"x%=y: shortcut for x=x%y."
function gmode(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        out1 = Ref{Ptr{Int}}(C_NULL)
        av = LibPARI._avma()
        r = LibPARI._trap_call(
            Ptr{Int},
            cglobal((:gmode, LibPARI.PARI_jll.libpari)),
            2,
            reinterpret(Int, Base.unsafe_convert(Ptr{Ptr{Int}}, out1)),
            reinterpret(Int, Ptr{Int}(x1.ptr)),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
        )
        primary = LibPARI.Gen(r)
        o1 = LibPARI.Gen(out1[])
        LibPARI._set_avma(av)
        return (primary, o1)
    end
end

"x%y: Euclidean remainder of x and y."
function gmod(x1::LibPARI.Gen, x2::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:gmod, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"x': derivative of x with respect to the main variable."
function deriv(x1::LibPARI.Gen; x2::Integer = -1)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:deriv, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(x2),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"x': derivative of x with respect to the main variable."
function derivn(x1::LibPARI.Gen, x2::Integer; x3::Integer = -1)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:derivn, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(x2),
                Int(x3),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"x*=y: shortcut for x=x*y."
function gmule(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        out1 = Ref{Ptr{Int}}(C_NULL)
        av = LibPARI._avma()
        r = LibPARI._trap_call(
            Ptr{Int},
            cglobal((:gmule, LibPARI.PARI_jll.libpari)),
            2,
            reinterpret(Int, Base.unsafe_convert(Ptr{Ptr{Int}}, out1)),
            reinterpret(Int, Ptr{Int}(x1.ptr)),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
        )
        primary = LibPARI.Gen(r)
        o1 = LibPARI.Gen(out1[])
        LibPARI._set_avma(av)
        return (primary, o1)
    end
end

"x*y: product of x and y."
function gmul(x1::LibPARI.Gen, x2::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:gmul, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"x++: set x to x+1."
function gadd1e()
    return LibPARI.protected_call() do
        out1 = Ref{Ptr{Int}}(C_NULL)
        av = LibPARI._avma()
        r = LibPARI._trap_call(
            Ptr{Int},
            cglobal((:gadd1e, LibPARI.PARI_jll.libpari)),
            1,
            reinterpret(Int, Base.unsafe_convert(Ptr{Ptr{Int}}, out1)),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
        )
        primary = LibPARI.Gen(r)
        o1 = LibPARI.Gen(out1[])
        LibPARI._set_avma(av)
        return (primary, o1)
    end
end

"x+=y: shortcut for x=x+y."
function gadde(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        out1 = Ref{Ptr{Int}}(C_NULL)
        av = LibPARI._avma()
        r = LibPARI._trap_call(
            Ptr{Int},
            cglobal((:gadde, LibPARI.PARI_jll.libpari)),
            2,
            reinterpret(Int, Base.unsafe_convert(Ptr{Ptr{Int}}, out1)),
            reinterpret(Int, Ptr{Int}(x1.ptr)),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
        )
        primary = LibPARI.Gen(r)
        o1 = LibPARI.Gen(out1[])
        LibPARI._set_avma(av)
        return (primary, o1)
    end
end

"x+y: sum of x and y."
function gadd(x1::LibPARI.Gen, x2::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:gadd, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"x--: set x to x-1."
function gsub1e()
    return LibPARI.protected_call() do
        out1 = Ref{Ptr{Int}}(C_NULL)
        av = LibPARI._avma()
        r = LibPARI._trap_call(
            Ptr{Int},
            cglobal((:gsub1e, LibPARI.PARI_jll.libpari)),
            1,
            reinterpret(Int, Base.unsafe_convert(Ptr{Ptr{Int}}, out1)),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
        )
        primary = LibPARI.Gen(r)
        o1 = LibPARI.Gen(out1[])
        LibPARI._set_avma(av)
        return (primary, o1)
    end
end

"x-=y: shortcut for x=x-y."
function gsube(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        out1 = Ref{Ptr{Int}}(C_NULL)
        av = LibPARI._avma()
        r = LibPARI._trap_call(
            Ptr{Int},
            cglobal((:gsube, LibPARI.PARI_jll.libpari)),
            2,
            reinterpret(Int, Base.unsafe_convert(Ptr{Ptr{Int}}, out1)),
            reinterpret(Int, Ptr{Int}(x1.ptr)),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
        )
        primary = LibPARI.Gen(r)
        o1 = LibPARI.Gen(out1[])
        LibPARI._set_avma(av)
        return (primary, o1)
    end
end

"x-y: difference of x and y."
function gsub(x1::LibPARI.Gen, x2::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:gsub, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"_.a1"
function member_a1(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:member_a1, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"_.a2"
function member_a2(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:member_a2, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"_.a3"
function member_a3(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:member_a3, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"_.a4"
function member_a4(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:member_a4, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"_.a6"
function member_a6(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:member_a6, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"_.area"
function member_area(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:member_area, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"_.b2"
function member_b2(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:member_b2, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"_.b4"
function member_b4(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:member_b4, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"_.b6"
function member_b6(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:member_b6, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"_.b8"
function member_b8(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:member_b8, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"_.bid"
function member_bid(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:member_bid, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"_.bnf"
function member_bnf(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:member_bnf, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"_.c4"
function member_c4(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:member_c4, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"_.c6"
function member_c6(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:member_c6, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"_.clgp"
function member_clgp(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:member_clgp, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"_.codiff"
function member_codiff(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:member_codiff, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"_.cyc"
function member_cyc(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:member_cyc, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"_.diff"
function member_diff(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:member_diff, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"_.disc"
function member_disc(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:member_disc, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"_.e"
function member_e(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:member_e, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"_.eta"
function member_eta(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:member_eta, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"_.f"
function member_f(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:member_f, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"_.fu"
function member_fu(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:member_fu, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"_.gen"
function member_gen(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:member_gen, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"_.group"
function member_group(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:member_group, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"_.index"
function member_index(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:member_index, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"_.j"
function member_j(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:member_j, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"_.mod"
function member_mod(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:member_mod, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"_.nf"
function member_nf(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:member_nf, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"_.no"
function member_no(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:member_no, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"_.normfu"
function member_normfu(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:member_normfu, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"_.omega"
function member_omega(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:member_omega, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"_.orders"
function member_orders(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:member_orders, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"_.p"
function member_p(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:member_p, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"_.pol"
function member_pol(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:member_pol, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"_.polabs"
function member_polabs(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:member_polabs, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"_.r1"
function member_r1(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:member_r1, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"_.r2"
function member_r2(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:member_r2, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"_.reg"
function member_reg(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:member_reg, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"_.roots"
function member_roots(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:member_roots, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"_.sign"
function member_sign(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:member_sign, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"_.t2"
function member_t2(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:member_t2, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"_.tate"
function member_tate(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:member_tate, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"_.tu"
function member_tu(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:member_tu, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"_.zk"
function member_zk(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:member_zk, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"_.zkst"
function member_zkst(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:member_zkst, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"x/=y: shortcut for x=x/y."
function gdive(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        out1 = Ref{Ptr{Int}}(C_NULL)
        av = LibPARI._avma()
        r = LibPARI._trap_call(
            Ptr{Int},
            cglobal((:gdive, LibPARI.PARI_jll.libpari)),
            2,
            reinterpret(Int, Base.unsafe_convert(Ptr{Ptr{Int}}, out1)),
            reinterpret(Int, Ptr{Int}(x1.ptr)),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
        )
        primary = LibPARI.Gen(r)
        o1 = LibPARI.Gen(out1[])
        LibPARI._set_avma(av)
        return (primary, o1)
    end
end

"x/y: quotient of x and y."
function gdiv(x1::LibPARI.Gen, x2::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:gdiv, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"x<<=y: shortcut for x=x<<y."
function gshiftle(x1::Integer)
    return LibPARI.protected_call() do
        out1 = Ref{Ptr{Int}}(C_NULL)
        av = LibPARI._avma()
        r = LibPARI._trap_call(
            Ptr{Int},
            cglobal((:gshiftle, LibPARI.PARI_jll.libpari)),
            2,
            reinterpret(Int, Base.unsafe_convert(Ptr{Ptr{Int}}, out1)),
            Int(x1),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
        )
        primary = LibPARI.Gen(r)
        o1 = LibPARI.Gen(out1[])
        LibPARI._set_avma(av)
        return (primary, o1)
    end
end

"x<<y: compute shift(x,y)."
function gshift(x1::LibPARI.Gen, x2::Integer)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:gshift, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(x2),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"x<=y: return 1 if x is less or equal to y, 0 otherwise."
function gle(x1::LibPARI.Gen, x2::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:gle, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"x<y: return 1 if x is strictly less than y, 0 otherwise."
function glt(x1::LibPARI.Gen, x2::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:glt, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"x===y: return 1 if x and y are identical, 0 otherwise."
function gidentical(x1::LibPARI.Gen, x2::LibPARI.Gen)
    return LibPARI.protected_call() do
        Int(
            LibPARI._trap_call(
                Cint,
                cglobal((:gidentical, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            ),
        )
    end
end

"x==y: return 1 if x and y are equal, 0 otherwise."
function geq(x1::LibPARI.Gen, x2::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:geq, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"x>=y: return 1 if x is greater or equal to y, 0 otherwise."
function gge(x1::LibPARI.Gen, x2::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:gge, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"x>>=y: shortcut for x=x>>y."
function gshiftre(x1::Integer)
    return LibPARI.protected_call() do
        out1 = Ref{Ptr{Int}}(C_NULL)
        av = LibPARI._avma()
        r = LibPARI._trap_call(
            Ptr{Int},
            cglobal((:gshiftre, LibPARI.PARI_jll.libpari)),
            2,
            reinterpret(Int, Base.unsafe_convert(Ptr{Ptr{Int}}, out1)),
            Int(x1),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
        )
        primary = LibPARI.Gen(r)
        o1 = LibPARI.Gen(out1[])
        LibPARI._set_avma(av)
        return (primary, o1)
    end
end

"x>>y: compute shift(x,-y)."
function gshift_right(x1::LibPARI.Gen, x2::Integer)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:gshift_right, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(x2),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"x>y: return 1 if x is strictly greater than y, 0 otherwise."
function ggt(x1::LibPARI.Gen, x2::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:ggt, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"F2xq_log_Coppersmith_worker: worker for F2xq_log_Coppersmith"
function F2xq_log_Coppersmith_worker(
    x1::LibPARI.Gen,
    x2::Integer,
    x3::LibPARI.Gen,
    x4::LibPARI.Gen,
)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((
                    :F2xq_log_Coppersmith_worker,
                    LibPARI.PARI_jll.libpari,
                )),
                4,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(x2),
                reinterpret(Int, Ptr{Int}(x3.ptr)),
                reinterpret(Int, Ptr{Int}(x4.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"Flxq_log_Coppersmith_worker: worker for Flxq_log_Coppersmith"
function Flxq_log_Coppersmith_worker(
    x1::LibPARI.Gen,
    x2::Integer,
    x3::LibPARI.Gen,
    x4::LibPARI.Gen,
)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((
                    :Flxq_log_Coppersmith_worker,
                    LibPARI.PARI_jll.libpari,
                )),
                4,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(x2),
                reinterpret(Int, Ptr{Int}(x3.ptr)),
                reinterpret(Int, Ptr{Int}(x4.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"worker for FpM_ratlift"
function FpM_ratlift_worker(x1::LibPARI.Gen, x2::LibPARI.Gen, x3::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:FpM_ratlift_worker, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                reinterpret(Int, Ptr{Int}(x3.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"Fp_log_sieve_worker: worker for Fp_log_sieve"
function Fp_log_sieve_worker(
    x1::Integer,
    x2::Integer,
    x3::LibPARI.Gen,
    x4::LibPARI.Gen,
    x5::LibPARI.Gen,
    x6::LibPARI.Gen,
    x7::LibPARI.Gen,
    x8::LibPARI.Gen,
)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:Fp_log_sieve_worker, LibPARI.PARI_jll.libpari)),
                8,
                Int(x1),
                Int(x2),
                reinterpret(Int, Ptr{Int}(x3.ptr)),
                reinterpret(Int, Ptr{Int}(x4.ptr)),
                reinterpret(Int, Ptr{Int}(x5.ptr)),
                reinterpret(Int, Ptr{Int}(x6.ptr)),
                reinterpret(Int, Ptr{Int}(x7.ptr)),
                reinterpret(Int, Ptr{Int}(x8.ptr)),
            )
        end
    end
end

"worker for QM_charpoly_ZX"
function QM_charpoly_ZX_worker(
    x1::LibPARI.Gen,
    x2::LibPARI.Gen,
    x3::LibPARI.Gen,
)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:QM_charpoly_ZX_worker, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                reinterpret(Int, Ptr{Int}(x3.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"worker for QXQ_div"
function QXQ_div_worker(
    x1::LibPARI.Gen,
    x2::LibPARI.Gen,
    x3::LibPARI.Gen,
    x4::LibPARI.Gen,
)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:QXQ_div_worker, LibPARI.PARI_jll.libpari)),
                4,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                reinterpret(Int, Ptr{Int}(x3.ptr)),
                reinterpret(Int, Ptr{Int}(x4.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"worker for QXQ_inv"
function QXQ_inv_worker(x1::LibPARI.Gen, x2::LibPARI.Gen, x3::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:QXQ_inv_worker, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                reinterpret(Int, Ptr{Int}(x3.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"worker for RgM_ZM_mul"
function RgM_ZM_mul_worker(x1::LibPARI.Gen, x2::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:RgM_ZM_mul_worker, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"worker for ZM_det"
function ZM_det_worker(x1::LibPARI.Gen, x2::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:ZM_det_worker, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"worker for ZM_gauss"
function ZM_gauss_worker(x1::LibPARI.Gen, x2::LibPARI.Gen, x3::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:ZM_gauss_worker, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                reinterpret(Int, Ptr{Int}(x3.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"worker for ZM_inv"
function ZM_inv_worker(x1::LibPARI.Gen, x2::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:ZM_inv_worker, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"worker for ZM_ker"
function ZM_ker_worker(x1::LibPARI.Gen, x2::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:ZM_ker_worker, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"worker for ZM_mul"
function ZM_mul_worker(x1::LibPARI.Gen, x2::LibPARI.Gen, x3::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:ZM_mul_worker, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                reinterpret(Int, Ptr{Int}(x3.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"worker for ZM_sqr"
function ZM_sqr_worker(x1::LibPARI.Gen, x2::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:ZM_sqr_worker, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"worker for ZXQX_composedsum"
function ZXQX_composedsum_worker(
    x1::LibPARI.Gen,
    x2::LibPARI.Gen,
    x3::LibPARI.Gen,
    x4::LibPARI.Gen,
)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:ZXQX_composedsum_worker, LibPARI.PARI_jll.libpari)),
                4,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                reinterpret(Int, Ptr{Int}(x3.ptr)),
                reinterpret(Int, Ptr{Int}(x4.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"worker for ZXQX_resultant"
function ZXQX_resultant_worker(
    x1::LibPARI.Gen,
    x2::LibPARI.Gen,
    x3::LibPARI.Gen,
    x4::LibPARI.Gen,
    x5::LibPARI.Gen,
)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:ZXQX_resultant_worker, LibPARI.PARI_jll.libpari)),
                5,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                reinterpret(Int, Ptr{Int}(x3.ptr)),
                reinterpret(Int, Ptr{Int}(x4.ptr)),
                reinterpret(Int, Ptr{Int}(x5.ptr)),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"worker for ZXQ_minpoly"
function ZXQ_minpoly_worker(
    x1::LibPARI.Gen,
    x2::LibPARI.Gen,
    x3::LibPARI.Gen,
    x4::Integer,
)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:ZXQ_minpoly_worker, LibPARI.PARI_jll.libpari)),
                4,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                reinterpret(Int, Ptr{Int}(x3.ptr)),
                Int(x4),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"worker for ZX_ZXY_resultant"
function ZX_ZXY_resultant_worker(
    x1::LibPARI.Gen,
    x2::LibPARI.Gen,
    x3::LibPARI.Gen,
    x4::LibPARI.Gen,
    x5::LibPARI.Gen,
)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:ZX_ZXY_resultant_worker, LibPARI.PARI_jll.libpari)),
                5,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                reinterpret(Int, Ptr{Int}(x3.ptr)),
                reinterpret(Int, Ptr{Int}(x4.ptr)),
                reinterpret(Int, Ptr{Int}(x5.ptr)),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"worker for ZX_composedsum"
function ZX_composedsum_worker(
    x1::LibPARI.Gen,
    x2::LibPARI.Gen,
    x3::LibPARI.Gen,
)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:ZX_composedsum_worker, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                reinterpret(Int, Ptr{Int}(x3.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"worker for ZX_gcd"
function ZX_gcd_worker(
    x1::LibPARI.Gen,
    x2::LibPARI.Gen,
    x3::LibPARI.Gen,
    x4::LibPARI.Gen,
)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:ZX_gcd_worker, LibPARI.PARI_jll.libpari)),
                4,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                reinterpret(Int, Ptr{Int}(x3.ptr)),
                reinterpret(Int, Ptr{Int}(x4.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"worker for ZX_resultant"
function ZX_resultant_worker(
    x1::LibPARI.Gen,
    x2::LibPARI.Gen,
    x3::LibPARI.Gen,
    x4::LibPARI.Gen,
)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:ZX_resultant_worker, LibPARI.PARI_jll.libpari)),
                4,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                reinterpret(Int, Ptr{Int}(x3.ptr)),
                reinterpret(Int, Ptr{Int}(x4.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"worker for ZabM_inv"
function ZabM_inv_worker(x1::LibPARI.Gen, x2::LibPARI.Gen, x3::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:ZabM_inv_worker, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                reinterpret(Int, Ptr{Int}(x3.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"x[a..b,c..d] = [x[a,c],  x[a+1,c],  ...,x[b,c];\nx[a,c+1],x[a+1,c+1],...,x[b,c+1];\n...       ...          ...\nx[a,d],  x[a+1,d]  ,...,x[b,d]]"
function matslice0(
    x1::LibPARI.Gen;
    x2::Integer = 0,
    x3::Integer = 0,
    x4::Integer = 0,
    x5::Integer = 0,
)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:matslice0, LibPARI.PARI_jll.libpari)),
                5,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(x2),
                Int(x3),
                Int(x4),
                Int(x5),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"x[a..b] = [x[a],x[a+1],...,x[b]]"
function vecslice0(x1::LibPARI.Gen, x3::Integer; x2::Integer = 0)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:vecslice0, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(x2),
                Int(x3),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"x\\/=y: shortcut for x=x\\/y."
function gdivrounde(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        out1 = Ref{Ptr{Int}}(C_NULL)
        av = LibPARI._avma()
        r = LibPARI._trap_call(
            Ptr{Int},
            cglobal((:gdivrounde, LibPARI.PARI_jll.libpari)),
            2,
            reinterpret(Int, Base.unsafe_convert(Ptr{Ptr{Int}}, out1)),
            reinterpret(Int, Ptr{Int}(x1.ptr)),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
        )
        primary = LibPARI.Gen(r)
        o1 = LibPARI.Gen(out1[])
        LibPARI._set_avma(av)
        return (primary, o1)
    end
end

"x\\/y: rounded Euclidean quotient of x and y."
function gdivround(x1::LibPARI.Gen, x2::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:gdivround, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"x\\=y: shortcut for x=x\\y."
function gdivente(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        out1 = Ref{Ptr{Int}}(C_NULL)
        av = LibPARI._avma()
        r = LibPARI._trap_call(
            Ptr{Int},
            cglobal((:gdivente, LibPARI.PARI_jll.libpari)),
            2,
            reinterpret(Int, Base.unsafe_convert(Ptr{Ptr{Int}}, out1)),
            reinterpret(Int, Ptr{Int}(x1.ptr)),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
        )
        primary = LibPARI.Gen(r)
        o1 = LibPARI.Gen(out1[])
        LibPARI._set_avma(av)
        return (primary, o1)
    end
end

"x\\y: Euclidean quotient of x and y."
function gdivent(x1::LibPARI.Gen, x2::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:gdivent, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"x^y: compute x to the power y."
function gpow(x1::LibPARI.Gen, x2::LibPARI.Gen; prec::Integer = 4)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:gpow, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                prec,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"return x^n where n is a small integer"
function gpowgs(x1::LibPARI.Gen, x2::Integer)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:gpowgs, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(x2),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"worker for isprime (APRCL step 4)"
function aprcl_step4_worker(
    x1::Integer,
    x2::LibPARI.Gen,
    x3::LibPARI.Gen,
    x4::LibPARI.Gen,
)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:aprcl_step4_worker, LibPARI.PARI_jll.libpari)),
                4,
                reinterpret(Int, UInt(x1)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                reinterpret(Int, Ptr{Int}(x3.ptr)),
                reinterpret(Int, Ptr{Int}(x4.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"worker for isprime (APRCL step 6)"
function aprcl_step6_worker(
    x1::LibPARI.Gen,
    x2::Integer,
    x3::LibPARI.Gen,
    x4::LibPARI.Gen,
    x5::LibPARI.Gen,
)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:aprcl_step6_worker, LibPARI.PARI_jll.libpari)),
                5,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(x2),
                reinterpret(Int, Ptr{Int}(x3.ptr)),
                reinterpret(Int, Ptr{Int}(x4.ptr)),
                reinterpret(Int, Ptr{Int}(x5.ptr)),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"worker for _.fu"
function chinese_unit_worker(
    x1::LibPARI.Gen,
    x2::LibPARI.Gen,
    x3::LibPARI.Gen,
    x4::LibPARI.Gen,
    x5::LibPARI.Gen,
    x6::LibPARI.Gen,
)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:chinese_unit_worker, LibPARI.PARI_jll.libpari)),
                6,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                reinterpret(Int, Ptr{Int}(x3.ptr)),
                reinterpret(Int, Ptr{Int}(x4.ptr)),
                reinterpret(Int, Ptr{Int}(x5.ptr)),
                reinterpret(Int, Ptr{Int}(x6.ptr)),
                Int(0),
                Int(0),
            )
        end
    end
end

"_def_TeXstyle (PARI)"
function sd_TeXstyle()
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:sd_TeXstyle, LibPARI.PARI_jll.libpari)),
                0,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"_def_breakloop (PARI)"
function sd_breakloop()
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:sd_breakloop, LibPARI.PARI_jll.libpari)),
                0,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"_def_colors (PARI)"
function sd_colors()
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:sd_colors, LibPARI.PARI_jll.libpari)),
                0,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"_def_compatible (PARI)"
function sd_compatible()
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:sd_compatible, LibPARI.PARI_jll.libpari)),
                0,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"_def_datadir (PARI)"
function sd_datadir()
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:sd_datadir, LibPARI.PARI_jll.libpari)),
                0,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"_def_debug (PARI)"
function sd_debug()
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:sd_debug, LibPARI.PARI_jll.libpari)),
                0,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"_def_debugfiles (PARI)"
function sd_debugfiles()
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:sd_debugfiles, LibPARI.PARI_jll.libpari)),
                0,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"_def_debugmem (PARI)"
function sd_debugmem()
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:sd_debugmem, LibPARI.PARI_jll.libpari)),
                0,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"_def_echo (PARI)"
function sd_echo()
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:sd_echo, LibPARI.PARI_jll.libpari)),
                0,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"_def_factor_add_primes (PARI)"
function sd_factor_add_primes()
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:sd_factor_add_primes, LibPARI.PARI_jll.libpari)),
                0,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"_def_factor_proven (PARI)"
function sd_factor_proven()
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:sd_factor_proven, LibPARI.PARI_jll.libpari)),
                0,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"_def_factorlimit (PARI)"
function sd_factorlimit()
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:sd_factorlimit, LibPARI.PARI_jll.libpari)),
                0,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"_def_format (PARI)"
function sd_format()
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:sd_format, LibPARI.PARI_jll.libpari)),
                0,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"_def_graphcolormap (PARI)"
function sd_graphcolormap()
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:sd_graphcolormap, LibPARI.PARI_jll.libpari)),
                0,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"_def_graphcolors (PARI)"
function sd_graphcolors()
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:sd_graphcolors, LibPARI.PARI_jll.libpari)),
                0,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"_def_help (PARI)"
function sd_help()
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:sd_help, LibPARI.PARI_jll.libpari)),
                0,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"_def_histfile (PARI)"
function sd_histfile()
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:sd_histfile, LibPARI.PARI_jll.libpari)),
                0,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"_def_histsize (PARI)"
function sd_histsize()
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:sd_histsize, LibPARI.PARI_jll.libpari)),
                0,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"_def_lines (PARI)"
function sd_lines()
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:sd_lines, LibPARI.PARI_jll.libpari)),
                0,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"_def_linewrap (PARI)"
function sd_linewrap()
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:sd_linewrap, LibPARI.PARI_jll.libpari)),
                0,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"_def_log (PARI)"
function sd_log()
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:sd_log, LibPARI.PARI_jll.libpari)),
                0,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"_def_logfile (PARI)"
function sd_logfile()
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:sd_logfile, LibPARI.PARI_jll.libpari)),
                0,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"_def_nbthreads (PARI)"
function sd_nbthreads()
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:sd_nbthreads, LibPARI.PARI_jll.libpari)),
                0,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"_def_new_galois_format (PARI)"
function sd_new_galois_format()
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:sd_new_galois_format, LibPARI.PARI_jll.libpari)),
                0,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"_def_output (PARI)"
function sd_output()
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:sd_output, LibPARI.PARI_jll.libpari)),
                0,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"_def_parisize (PARI)"
function sd_parisize()
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:sd_parisize, LibPARI.PARI_jll.libpari)),
                0,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"_def_parisizemax (PARI)"
function sd_parisizemax()
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:sd_parisizemax, LibPARI.PARI_jll.libpari)),
                0,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"_def_path (PARI)"
function sd_path()
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:sd_path, LibPARI.PARI_jll.libpari)),
                0,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"_def_plothsizes (PARI)"
function sd_plothsizes()
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:sd_plothsizes, LibPARI.PARI_jll.libpari)),
                0,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"_def_prettyprinter (PARI)"
function sd_prettyprinter()
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:sd_prettyprinter, LibPARI.PARI_jll.libpari)),
                0,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"_def_primelimit (PARI)"
function sd_primelimit()
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:sd_primelimit, LibPARI.PARI_jll.libpari)),
                0,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"_def_prompt (PARI)"
function sd_prompt()
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:sd_prompt, LibPARI.PARI_jll.libpari)),
                0,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"_def_prompt_cont (PARI)"
function sd_prompt_cont()
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:sd_prompt_cont, LibPARI.PARI_jll.libpari)),
                0,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"_def_psfile (PARI)"
function sd_psfile()
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:sd_psfile, LibPARI.PARI_jll.libpari)),
                0,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"_def_readline (PARI)"
function sd_readline()
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:sd_readline, LibPARI.PARI_jll.libpari)),
                0,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"_def_realbitprecision (PARI)"
function sd_realbitprecision()
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:sd_realbitprecision, LibPARI.PARI_jll.libpari)),
                0,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"_def_realprecision (PARI)"
function sd_realprecision()
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:sd_realprecision, LibPARI.PARI_jll.libpari)),
                0,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"_def_recover (PARI)"
function sd_recover()
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:sd_recover, LibPARI.PARI_jll.libpari)),
                0,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"_def_secure (PARI)"
function sd_secure()
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:sd_secure, LibPARI.PARI_jll.libpari)),
                0,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"_def_seriesprecision (PARI)"
function sd_seriesprecision()
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:sd_seriesprecision, LibPARI.PARI_jll.libpari)),
                0,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"_def_simplify (PARI)"
function sd_simplify()
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:sd_simplify, LibPARI.PARI_jll.libpari)),
                0,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"_def_sopath (PARI)"
function sd_sopath()
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:sd_sopath, LibPARI.PARI_jll.libpari)),
                0,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"_def_strictargs (PARI)"
function sd_strictargs()
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:sd_strictargs, LibPARI.PARI_jll.libpari)),
                0,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"_def_strictmatch (PARI)"
function sd_strictmatch()
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:sd_strictmatch, LibPARI.PARI_jll.libpari)),
                0,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"_def_threadsize (PARI)"
function sd_threadsize()
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:sd_threadsize, LibPARI.PARI_jll.libpari)),
                0,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"_def_threadsizemax (PARI)"
function sd_threadsizemax()
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:sd_threadsizemax, LibPARI.PARI_jll.libpari)),
                0,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"_def_timer (PARI)"
function sd_timer()
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:sd_timer, LibPARI.PARI_jll.libpari)),
                0,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"_derivfun(args,def,closure,k) numerical kth-derivation of closure with respect to\nthe first variable at args"
function derivfun0(
    x1::LibPARI.Gen,
    x2::LibPARI.Gen,
    x3::LibPARI.Gen;
    x4::Integer = 1,
    prec::Integer = 4,
)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:derivfun0, LibPARI.PARI_jll.libpari)),
                5,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                reinterpret(Int, Ptr{Int}(x3.ptr)),
                Int(x4),
                prec,
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"lfunartin worker"
function dirartin_worker(
    x1::LibPARI.Gen,
    x2::Integer,
    x3::LibPARI.Gen,
    x4::LibPARI.Gen,
    x5::LibPARI.Gen,
    x6::LibPARI.Gen,
)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:dirartin_worker, LibPARI.PARI_jll.libpari)),
                6,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, UInt(x2)),
                reinterpret(Int, Ptr{Int}(x3.ptr)),
                reinterpret(Int, Ptr{Int}(x4.ptr)),
                reinterpret(Int, Ptr{Int}(x5.ptr)),
                reinterpret(Int, Ptr{Int}(x6.ptr)),
                Int(0),
                Int(0),
            )
        end
    end
end

"ellan worker"
function direllnf_worker(x1::LibPARI.Gen, x2::Integer, x3::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:direllnf_worker, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, UInt(x2)),
                reinterpret(Int, Ptr{Int}(x3.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"lfunsympow worker"
function direllsympow_worker(
    x1::LibPARI.Gen,
    x2::Integer,
    x3::LibPARI.Gen,
    x4::Integer,
)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:direllsympow_worker, LibPARI.PARI_jll.libpari)),
                4,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, UInt(x2)),
                reinterpret(Int, Ptr{Int}(x3.ptr)),
                reinterpret(Int, UInt(x4)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"lfungenus2 worker"
function dirgenus2_worker(x1::LibPARI.Gen, x2::Integer, x3::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:dirgenus2_worker, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(x2),
                reinterpret(Int, Ptr{Int}(x3.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"worker for hgmcoefs"
function dirhgm_worker(
    x1::LibPARI.Gen,
    x2::Integer,
    x3::LibPARI.Gen,
    x4::LibPARI.Gen,
)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:dirhgm_worker, LibPARI.PARI_jll.libpari)),
                4,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, UInt(x2)),
                reinterpret(Int, Ptr{Int}(x3.ptr)),
                reinterpret(Int, Ptr{Int}(x4.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"worker for isprime (ECPP ispseudoprime step)"
function ecpp_ispsp_worker(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:ecpp_ispsp_worker, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"worker for isprime (ECPP sqrt step)"
function ecpp_sqrt_worker(x1::LibPARI.Gen, x2::LibPARI.Gen, x3::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:ecpp_sqrt_worker, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                reinterpret(Int, Ptr{Int}(x3.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"worker for isprime (step 2)"
function ecpp_step2_worker(
    x1::LibPARI.Gen,
    x2::LibPARI.Gen,
    x3::LibPARI.Gen,
    x4::Integer,
)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:ecpp_step2_worker, LibPARI.PARI_jll.libpari)),
                4,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                reinterpret(Int, Ptr{Int}(x3.ptr)),
                Int(x4),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"worker for eisker"
function eisker_worker(
    x1::LibPARI.Gen,
    x2::LibPARI.Gen,
    x3::LibPARI.Gen,
    x4::LibPARI.Gen,
    x5::LibPARI.Gen,
)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:eisker_worker, LibPARI.PARI_jll.libpari)),
                5,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                reinterpret(Int, Ptr{Int}(x3.ptr)),
                reinterpret(Int, Ptr{Int}(x4.ptr)),
                reinterpret(Int, Ptr{Int}(x5.ptr)),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"worker for ellQ_factorback"
function ellQ_factorback_worker(
    x1::LibPARI.Gen,
    x2::LibPARI.Gen,
    x3::LibPARI.Gen,
    x4::LibPARI.Gen,
    x5::Integer,
)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:ellQ_factorback_worker, LibPARI.PARI_jll.libpari)),
                5,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                reinterpret(Int, Ptr{Int}(x3.ptr)),
                reinterpret(Int, Ptr{Int}(x4.ptr)),
                reinterpret(Int, UInt(x5)),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"Convert a mnemonic string to a flag."
function eval_mnemonic(x1::LibPARI.Gen, x2::AbstractString)
    return LibPARI.protected_call() do
        Int(
            let _cs1 = Base.cconvert(Cstring, x2)
                GC.@preserve _cs1 LibPARI._trap_call(
                    Int,
                    cglobal((:eval_mnemonic, LibPARI.PARI_jll.libpari)),
                    2,
                    reinterpret(Int, Ptr{Int}(x1.ptr)),
                    reinterpret(Int, Base.unsafe_convert(Cstring, _cs1)),
                    Int(0),
                    Int(0),
                    Int(0),
                    Int(0),
                    Int(0),
                    Int(0),
                )
            end,
        )
    end
end

"_factor_Aurifeuille(a,d): return an algebraic factor of Phi_d(a), a != 0"
function factor_Aurifeuille(x1::LibPARI.Gen, x2::Integer)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:factor_Aurifeuille, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(x2),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"_factor_Aurifeuille_prime(p,d): return an algebraic factor of Phi_d(p), p prime"
function factor_Aurifeuille_prime(x1::LibPARI.Gen, x2::Integer)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:factor_Aurifeuille_prime, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(x2),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"return x^-1 where n is a small integer"
function ginv(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:ginv, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"_lerch_worker(E,t): worker for lerchzeta"
function lerch_worker(x1::LibPARI.Gen, x2::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:lerch_worker, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"worker for lfuninit using theta2"
function lfuninit_theta2_worker(
    x1::Integer,
    x2::LibPARI.Gen,
    x3::LibPARI.Gen,
    x4::LibPARI.Gen,
    x5::LibPARI.Gen,
    x6::LibPARI.Gen,
    x7::LibPARI.Gen,
)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:lfuninit_theta2_worker, LibPARI.PARI_jll.libpari)),
                7,
                Int(x1),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                reinterpret(Int, Ptr{Int}(x3.ptr)),
                reinterpret(Int, Ptr{Int}(x4.ptr)),
                reinterpret(Int, Ptr{Int}(x5.ptr)),
                reinterpret(Int, Ptr{Int}(x6.ptr)),
                reinterpret(Int, Ptr{Int}(x7.ptr)),
                Int(0),
            )
        end
    end
end

"worker for lfuninit"
function lfuninit_worker(
    x1::Integer,
    x2::LibPARI.Gen,
    x3::LibPARI.Gen,
    x4::LibPARI.Gen,
    x5::LibPARI.Gen,
    x6::LibPARI.Gen,
    x7::LibPARI.Gen,
    x8::LibPARI.Gen,
    x9::LibPARI.Gen,
)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            ccall(
                (:lfuninit_worker, LibPARI.PARI_jll.libpari),
                Ptr{Int},
                (
                    Int,
                    Ptr{Int},
                    Ptr{Int},
                    Ptr{Int},
                    Ptr{Int},
                    Ptr{Int},
                    Ptr{Int},
                    Ptr{Int},
                    Ptr{Int},
                ),
                Int(x1),
                x2.ptr,
                x3.ptr,
                x4.ptr,
                x5.ptr,
                x6.ptr,
                x7.ptr,
                x8.ptr,
                x9.ptr,
            )
        end
    end
end

"nflist_A462_worker(P3,X,Xinf,listarch,GAL): auxiliary."
function nflist_A462_worker(
    x1::LibPARI.Gen,
    x2::LibPARI.Gen,
    x3::LibPARI.Gen,
    x4::LibPARI.Gen,
    x5::LibPARI.Gen,
)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:nflist_A462_worker, LibPARI.PARI_jll.libpari)),
                5,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                reinterpret(Int, Ptr{Int}(x3.ptr)),
                reinterpret(Int, Ptr{Int}(x4.ptr)),
                reinterpret(Int, Ptr{Int}(x5.ptr)),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"nflist_A46S46P_worker(P3,Xinf,sqX,cards): auxiliary."
function nflist_A46S46P_worker(
    x1::LibPARI.Gen,
    x2::LibPARI.Gen,
    x3::LibPARI.Gen,
    x4::LibPARI.Gen,
)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:nflist_A46S46P_worker, LibPARI.PARI_jll.libpari)),
                4,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                reinterpret(Int, Ptr{Int}(x3.ptr)),
                reinterpret(Int, Ptr{Int}(x4.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"nflist_A4S4_worker(P3,X,Xinf,cardsprec): auxiliary."
function nflist_A4S4_worker(
    x1::LibPARI.Gen,
    x2::LibPARI.Gen,
    x3::LibPARI.Gen,
    x4::LibPARI.Gen,
)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:nflist_A4S4_worker, LibPARI.PARI_jll.libpari)),
                4,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                reinterpret(Int, Ptr{Int}(x3.ptr)),
                reinterpret(Int, Ptr{Int}(x4.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"nflist_C32C4_worker(P4,X,Xinf,GAL): auxiliary."
function nflist_C32C4_worker(
    x1::LibPARI.Gen,
    x2::LibPARI.Gen,
    x3::LibPARI.Gen,
    x4::LibPARI.Gen,
)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:nflist_C32C4_worker, LibPARI.PARI_jll.libpari)),
                4,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                reinterpret(Int, Ptr{Int}(x3.ptr)),
                reinterpret(Int, Ptr{Int}(x4.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"nflist_C32D4_worker(P,X,Xinf,gs): auxiliary."
function nflist_C32D4_worker(
    x1::LibPARI.Gen,
    x2::LibPARI.Gen,
    x3::LibPARI.Gen,
    x4::LibPARI.Gen,
)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:nflist_C32D4_worker, LibPARI.PARI_jll.libpari)),
                4,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                reinterpret(Int, Ptr{Int}(x3.ptr)),
                reinterpret(Int, Ptr{Int}(x4.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"nflist_C3C3_worker(gi,V3,V3D,X): auxiliary."
function nflist_C3C3_worker(
    x1::LibPARI.Gen,
    x2::LibPARI.Gen,
    x3::LibPARI.Gen,
    x4::LibPARI.Gen,
)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:nflist_C3C3_worker, LibPARI.PARI_jll.libpari)),
                4,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                reinterpret(Int, Ptr{Int}(x3.ptr)),
                reinterpret(Int, Ptr{Int}(x4.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"nflist_C3_worker(gv,T): auxiliary."
function nflist_C3_worker(x1::LibPARI.Gen, x2::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:nflist_C3_worker, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"nflist_C4vec_worker(gm,X,Xinf,X2,gs): auxiliary."
function nflist_C4vec_worker(
    x1::LibPARI.Gen,
    x2::LibPARI.Gen,
    x3::LibPARI.Gen,
    x4::LibPARI.Gen,
)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:nflist_C4vec_worker, LibPARI.PARI_jll.libpari)),
                4,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                reinterpret(Int, Ptr{Int}(x3.ptr)),
                reinterpret(Int, Ptr{Int}(x4.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"nflist_C5_worker(N,bnfC5): auxiliary."
function nflist_C5_worker(x1::LibPARI.Gen, x2::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:nflist_C5_worker, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"nflist_C6_worker(P3,X,Xinf,M,T): auxiliary."
function nflist_C6_worker(
    x1::LibPARI.Gen,
    x2::LibPARI.Gen,
    x3::LibPARI.Gen,
    x4::LibPARI.Gen,
    x5::LibPARI.Gen,
)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:nflist_C6_worker, LibPARI.PARI_jll.libpari)),
                5,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                reinterpret(Int, Ptr{Int}(x3.ptr)),
                reinterpret(Int, Ptr{Int}(x4.ptr)),
                reinterpret(Int, Ptr{Int}(x5.ptr)),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"nflist_C9_worker(P,X,Xinf): auxiliary."
function nflist_C9_worker(x1::LibPARI.Gen, x2::LibPARI.Gen, x3::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:nflist_C9_worker, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                reinterpret(Int, Ptr{Int}(x3.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"nflist_CL_worker(Fcond,bnf,ellprec): auxiliary."
function nflist_CL_worker(x1::LibPARI.Gen, x2::LibPARI.Gen, x3::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:nflist_CL_worker, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                reinterpret(Int, Ptr{Int}(x3.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"nflist_D4_worker(D,X,Xinf,listarch): auxiliary."
function nflist_D4_worker(
    x1::LibPARI.Gen,
    x2::LibPARI.Gen,
    x3::LibPARI.Gen,
    x4::LibPARI.Gen,
)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:nflist_D4_worker, LibPARI.PARI_jll.libpari)),
                4,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                reinterpret(Int, Ptr{Int}(x3.ptr)),
                reinterpret(Int, Ptr{Int}(x4.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"nflist_D612_worker(P3,X,Xinf,X2,limd2s2): auxiliary."
function nflist_D612_worker(
    x1::LibPARI.Gen,
    x2::LibPARI.Gen,
    x3::LibPARI.Gen,
    x4::LibPARI.Gen,
)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:nflist_D612_worker, LibPARI.PARI_jll.libpari)),
                4,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                reinterpret(Int, Ptr{Int}(x3.ptr)),
                reinterpret(Int, Ptr{Int}(x4.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"nflist_D9_worker(P2,X,Xinf): auxiliary."
function nflist_D9_worker(x1::LibPARI.Gen, x2::LibPARI.Gen, x3::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:nflist_D9_worker, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                reinterpret(Int, Ptr{Int}(x3.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"nflist_DL_worker(P2,X1p,X0p,X,Xinf,ells): auxiliary."
function nflist_DL_worker(
    x1::LibPARI.Gen,
    x2::LibPARI.Gen,
    x3::LibPARI.Gen,
    x4::LibPARI.Gen,
    x5::LibPARI.Gen,
    x6::LibPARI.Gen,
)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:nflist_DL_worker, LibPARI.PARI_jll.libpari)),
                6,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                reinterpret(Int, Ptr{Int}(x3.ptr)),
                reinterpret(Int, Ptr{Int}(x4.ptr)),
                reinterpret(Int, Ptr{Int}(x5.ptr)),
                reinterpret(Int, Ptr{Int}(x6.ptr)),
                Int(0),
                Int(0),
            )
        end
    end
end

"nflist_Mgen_worker(field,X,Xinf,ella): auxiliary."
function nflist_Mgen_worker(
    x1::LibPARI.Gen,
    x2::LibPARI.Gen,
    x3::LibPARI.Gen,
    x4::LibPARI.Gen,
)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:nflist_Mgen_worker, LibPARI.PARI_jll.libpari)),
                4,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                reinterpret(Int, Ptr{Int}(x3.ptr)),
                reinterpret(Int, Ptr{Int}(x4.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"nflist_S32_worker(all1,X,Xinf,V3,sprec): auxiliary."
function nflist_S32_worker(
    x1::LibPARI.Gen,
    x2::LibPARI.Gen,
    x3::LibPARI.Gen,
    x4::LibPARI.Gen,
    x5::LibPARI.Gen,
)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:nflist_S32_worker, LibPARI.PARI_jll.libpari)),
                5,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                reinterpret(Int, Ptr{Int}(x3.ptr)),
                reinterpret(Int, Ptr{Int}(x4.ptr)),
                reinterpret(Int, Ptr{Int}(x5.ptr)),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"nflist_S36_worker(pol,X,Xinf,X2): auxiliary."
function nflist_S36_worker(x1::LibPARI.Gen, x2::LibPARI.Gen, x3::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:nflist_S36_worker, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                reinterpret(Int, Ptr{Int}(x3.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"nflist_S3C3_worker(D2,X,Xinf,X2): auxiliary."
function nflist_S3C3_worker(x1::LibPARI.Gen, x2::LibPARI.Gen, x3::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:nflist_S3C3_worker, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                reinterpret(Int, Ptr{Int}(x3.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"nflist_S3I_worker(ga,ALLCTS): auxiliary."
function nflist_S3I_worker(x1::LibPARI.Gen, x2::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:nflist_S3I_worker, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"nflist_S3R_worker(ga,ALLCTS): auxiliary."
function nflist_S3R_worker(x1::LibPARI.Gen, x2::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:nflist_S3R_worker, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"nflist_S462_worker(P3,X,Xinf,listarch,GAL): auxiliary."
function nflist_S462_worker(
    x1::LibPARI.Gen,
    x2::LibPARI.Gen,
    x3::LibPARI.Gen,
    x4::LibPARI.Gen,
    x5::LibPARI.Gen,
)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:nflist_S462_worker, LibPARI.PARI_jll.libpari)),
                5,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                reinterpret(Int, Ptr{Int}(x3.ptr)),
                reinterpret(Int, Ptr{Int}(x4.ptr)),
                reinterpret(Int, Ptr{Int}(x5.ptr)),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"nflist_S46M_worker(P3,X,Xinf,sprec): auxiliary."
function nflist_S46M_worker(
    x1::LibPARI.Gen,
    x2::LibPARI.Gen,
    x3::LibPARI.Gen,
    x4::LibPARI.Gen,
)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:nflist_S46M_worker, LibPARI.PARI_jll.libpari)),
                4,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                reinterpret(Int, Ptr{Int}(x3.ptr)),
                reinterpret(Int, Ptr{Int}(x4.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"nflist_V4_worker(D1,X,Xinf,gs): auxiliary."
function nflist_V4_worker(
    x1::LibPARI.Gen,
    x2::LibPARI.Gen,
    x3::LibPARI.Gen,
    x4::LibPARI.Gen,
)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:nflist_V4_worker, LibPARI.PARI_jll.libpari)),
                4,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                reinterpret(Int, Ptr{Int}(x3.ptr)),
                reinterpret(Int, Ptr{Int}(x4.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"used for parallel chinese"
function nxMV_polint_center_tree_worker(
    x1::LibPARI.Gen,
    x2::LibPARI.Gen,
    x3::LibPARI.Gen,
    x4::LibPARI.Gen,
    x5::LibPARI.Gen,
)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((
                    :nxMV_polint_center_tree_worker,
                    LibPARI.PARI_jll.libpari,
                )),
                5,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                reinterpret(Int, Ptr{Int}(x3.ptr)),
                reinterpret(Int, Ptr{Int}(x4.ptr)),
                reinterpret(Int, Ptr{Int}(x5.ptr)),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"_parapply_slice_worker(v,C): return [C(x) | x<-v]."
function parapply_slice_worker(x1::LibPARI.Gen, x2::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:parapply_slice_worker, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"_pareval_worker(C): evaluate the closure C."
function pareval_worker(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:pareval_worker, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"_parfor_worker(i,C): evaluate the closure C on i and return [i,C(i)]"
function parfor_worker(x1::LibPARI.Gen, x2::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:parfor_worker, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"_parsqf_worker(gk,vR,data): auxiliary."
function parsqf_worker(x1::LibPARI.Gen, x2::LibPARI.Gen, x3::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:parsqf_worker, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                reinterpret(Int, Ptr{Int}(x3.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"_parsum_slice_worker(a,b,m,C): return sum(k=0,(b-a)\\m,C(a+k*m)).\na and m must be integers and m must be positive."
function parsum_slice_worker(
    x1::LibPARI.Gen,
    x2::LibPARI.Gen,
    x3::LibPARI.Gen,
    x4::LibPARI.Gen,
)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:parsum_slice_worker, LibPARI.PARI_jll.libpari)),
                4,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                reinterpret(Int, Ptr{Int}(x3.ptr)),
                reinterpret(Int, Ptr{Int}(x4.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"_parsumprimefun_worker(gk,s,zerf,data,vW,f): auxiliary"
function parsumprimefun_worker(
    x1::LibPARI.Gen,
    x2::LibPARI.Gen,
    x3::LibPARI.Gen,
    x4::LibPARI.Gen,
    x5::LibPARI.Gen,
    x6::LibPARI.Gen,
)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:parsumprimefun_worker, LibPARI.PARI_jll.libpari)),
                6,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                reinterpret(Int, Ptr{Int}(x3.ptr)),
                reinterpret(Int, Ptr{Int}(x4.ptr)),
                reinterpret(Int, Ptr{Int}(x5.ptr)),
                reinterpret(Int, Ptr{Int}(x6.ptr)),
                Int(0),
                Int(0),
            )
        end
    end
end

"worker for partmap_reverse_frac"
function partmap_reverse_frac_worker(
    x1::LibPARI.Gen,
    x2::LibPARI.Gen,
    x3::LibPARI.Gen,
    x4::LibPARI.Gen,
    x5::LibPARI.Gen,
    x6::Integer,
)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((
                    :partmap_reverse_frac_worker,
                    LibPARI.PARI_jll.libpari,
                )),
                6,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                reinterpret(Int, Ptr{Int}(x3.ptr)),
                reinterpret(Int, Ptr{Int}(x4.ptr)),
                reinterpret(Int, Ptr{Int}(x5.ptr)),
                Int(x6),
                Int(0),
                Int(0),
            )
        end
    end
end

"_parvector_worker(i,C): evaluate the closure C on i."
function parvector_worker(x1::LibPARI.Gen, x2::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:parvector_worker, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"used by polclass"
function polclass_worker(x1::LibPARI.Gen, x2::LibPARI.Gen, x3::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:polclass_worker, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                reinterpret(Int, Ptr{Int}(x3.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"used for parallel chinese"
function nmV_polint_center_tree_worker(
    x1::LibPARI.Gen,
    x2::LibPARI.Gen,
    x3::LibPARI.Gen,
    x4::LibPARI.Gen,
    x5::LibPARI.Gen,
)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((
                    :nmV_polint_center_tree_worker,
                    LibPARI.PARI_jll.libpari,
                )),
                5,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                reinterpret(Int, Ptr{Int}(x3.ptr)),
                reinterpret(Int, Ptr{Int}(x4.ptr)),
                reinterpret(Int, Ptr{Int}(x5.ptr)),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"used by polmodular"
function polmodular_worker(
    x1::LibPARI.Gen,
    x2::Integer,
    x3::LibPARI.Gen,
    x4::LibPARI.Gen,
    x5::LibPARI.Gen,
    x6::LibPARI.Gen,
    x7::Integer,
    x8::LibPARI.Gen,
    x9::LibPARI.Gen,
    x10::LibPARI.Gen,
    x11::LibPARI.Gen,
)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            ccall(
                (:polmodular_worker, LibPARI.PARI_jll.libpari),
                Ptr{Int},
                (
                    Ptr{Int},
                    UInt,
                    Ptr{Int},
                    Ptr{Int},
                    Ptr{Int},
                    Ptr{Int},
                    Int,
                    Ptr{Int},
                    Ptr{Int},
                    Ptr{Int},
                    Ptr{Int},
                ),
                x1.ptr,
                UInt(x2),
                x3.ptr,
                x4.ptr,
                x5.ptr,
                x6.ptr,
                Int(x7),
                x8.ptr,
                x9.ptr,
                x10.ptr,
                x11.ptr,
            )
        end
    end
end

"worker for primecertisvalid"
function primecertisvalid_ecpp_worker(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((
                    :primecertisvalid_ecpp_worker,
                    LibPARI.PARI_jll.libpari,
                )),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"worker for ramanujantau"
function ramanujantau_worker(
    x1::LibPARI.Gen,
    x2::LibPARI.Gen,
    x3::LibPARI.Gen,
    x4::LibPARI.Gen,
)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:ramanujantau_worker, LibPARI.PARI_jll.libpari)),
                4,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                reinterpret(Int, Ptr{Int}(x3.ptr)),
                reinterpret(Int, Ptr{Int}(x4.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"_serh_worker(gk,V,a,ns,gprec): auxiliary."
function serh_worker(
    x1::LibPARI.Gen,
    x2::LibPARI.Gen,
    x3::LibPARI.Gen,
    x4::LibPARI.Gen,
    x5::LibPARI.Gen,
)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:serh_worker, LibPARI.PARI_jll.libpari)),
                5,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                reinterpret(Int, Ptr{Int}(x3.ptr)),
                reinterpret(Int, Ptr{Int}(x4.ptr)),
                reinterpret(Int, Ptr{Int}(x5.ptr)),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"worker for ramanujantau"
function taugen_n_worker(x1::LibPARI.Gen, x2::LibPARI.Gen, x3::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:taugen_n_worker, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                reinterpret(Int, Ptr{Int}(x3.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"_wrap_G (PARI)"
function gp_call(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:gp_call, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"_wrap_GG (PARI)"
function gp_call2(x1::LibPARI.Gen, x2::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:gp_call2, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"_wrap_Gp (PARI)"
function gp_callprec(x1::LibPARI.Gen; prec::Integer = 4)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:gp_callprec, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                prec,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"_wrap_bG (PARI)"
function gp_callbool(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        Int(
            LibPARI._trap_call(
                Int,
                cglobal((:gp_callbool, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            ),
        )
    end
end

"_wrap_vG (PARI)"
function gp_callvoid(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        Int(
            LibPARI._trap_call(
                Int,
                cglobal((:gp_callvoid, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            ),
        )
    end
end

"x~: transpose of x."
function gtrans(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:gtrans, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"abs(x): absolute value (or modulus) of x."
function gabs(x1::LibPARI.Gen; prec::Integer = 4)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:gabs, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                prec,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"acos(x): arc cosine of x."
function gacos(x1::LibPARI.Gen; prec::Integer = 4)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:gacos, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                prec,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"acosh(x): inverse hyperbolic cosine of x."
function gacosh(x1::LibPARI.Gen; prec::Integer = 4)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:gacosh, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                prec,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"addhelp(sym,str): add/change help message for the symbol sym."
function addhelp(x1::AbstractString, x2::AbstractString)
    LibPARI.protected_call() do
        let _cs1 = Base.cconvert(Cstring, x1), _cs2 = Base.cconvert(Cstring, x2)
            GC.@preserve _cs1 _cs2 LibPARI._trap_call(
                Cvoid,
                cglobal((:addhelp, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Base.unsafe_convert(Cstring, _cs1)),
                reinterpret(Int, Base.unsafe_convert(Cstring, _cs2)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
    return nothing
end

"addprimes({x=[]}): add primes in the vector x to the prime table to\nbe used in trial division. x may also be a single integer. Composite\n\"primes\" are NOT allowed."
function addprimes(; x1 = nothing)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:addprimes, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}((x1 === nothing ? C_NULL : x1.ptr))),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"agm(x,y): arithmetic-geometric mean of x and y."
function agm(x1::LibPARI.Gen, x2::LibPARI.Gen; prec::Integer = 4)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:agm, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                prec,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"airy(z): Airy [Ai,Bi] function of argument z."
function airy(x1::LibPARI.Gen; prec::Integer = 4)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:airy, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                prec,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"algadd({al},x,y): element x+y in al (Hamilton quaternions if omitted)."
function algadd(x2::LibPARI.Gen, x3::LibPARI.Gen; x1 = nothing)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:algadd, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}((x1 === nothing ? C_NULL : x1.ptr))),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                reinterpret(Int, Ptr{Int}(x3.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"algalgtobasis(al,x): transforms the element x of the algebra al into a\ncolumn vector on the integral basis of al."
function algalgtobasis(x1::LibPARI.Gen, x2::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:algalgtobasis, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"algaut(al): the stored automorphism of the splitting field of the\ncyclic algebra al."
function algaut(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:algaut, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"algb(al): the element b of the center of the cyclic algebra al used\nto define it."
function algb(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:algb, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"algbasis(al): basis of the stored order of the central simple algebra al."
function algbasis(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:algbasis, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"algbasistoalg(al,x): transforms the column vector x on the integral\nbasis of al into an element of al in algebraic form."
function algbasistoalg(x1::LibPARI.Gen, x2::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:algbasistoalg, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"algcenter(al): center of the algebra al."
function algcenter(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:algcenter, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"algcentralproj(al,z,{maps=0}): projections of the algebra al on the\northogonal central idempotents z[i]."
function alg_centralproj(x1::LibPARI.Gen, x2::LibPARI.Gen; x3::Integer = 0)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:alg_centralproj, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(x3),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"algchar(al): characteristic of the algebra al."
function algchar(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:algchar, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"algdegree(al): degree of the central simple algebra al."
function algdegree(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        Int(
            LibPARI._trap_call(
                Int,
                cglobal((:algdegree, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            ),
        )
    end
end

"algdep(z,k,{flag=0}): algebraic relations up to degree k of z, using\nlindep([1,z,...,z^(k-1)], flag)."
function algdep0(x1::LibPARI.Gen, x2::Integer; x3::Integer = 0)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:algdep0, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(x2),
                Int(x3),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"algdim(al,{abs=0}): dimension of the algebra al."
function algdim(x1::LibPARI.Gen; x2::Integer = 0)
    return LibPARI.protected_call() do
        Int(
            LibPARI._trap_call(
                Int,
                cglobal((:algdim, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(x2),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            ),
        )
    end
end

"algdisc(al): discriminant of the stored order of the algebra al."
function algdisc(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:algdisc, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"algdivl({al},x,y): element x\\y in al (Hamilton quaternions if omitted)."
function algdivl(x2::LibPARI.Gen, x3::LibPARI.Gen; x1 = nothing)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:algdivl, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}((x1 === nothing ? C_NULL : x1.ptr))),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                reinterpret(Int, Ptr{Int}(x3.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"algdivr({al},x,y): element x/y in al (Hamilton quaternions if omitted)."
function algdivr(x2::LibPARI.Gen, x3::LibPARI.Gen; x1 = nothing)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:algdivr, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}((x1 === nothing ? C_NULL : x1.ptr))),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                reinterpret(Int, Ptr{Int}(x3.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"alggroup(gal,{p=0}): constructs the group algebra of gal over Q (resp. Fp)."
function alggroup(x1::LibPARI.Gen; x2 = nothing)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:alggroup, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}((x2 === nothing ? C_NULL : x2.ptr))),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"alggroupcenter(gal,{p=0},{&cc}): constructs the center of the group\nalgebra of gal over Q (resp. Fp), and sets cc to the conjugacy classes of gal."
function alggroupcenter(x1::LibPARI.Gen; x2 = nothing)
    return LibPARI.protected_call() do
        out1 = Ref{Ptr{Int}}(C_NULL)
        av = LibPARI._avma()
        r = LibPARI._trap_call(
            Ptr{Int},
            cglobal((:alggroupcenter, LibPARI.PARI_jll.libpari)),
            3,
            reinterpret(Int, Ptr{Int}(x1.ptr)),
            reinterpret(Int, Ptr{Int}((x2 === nothing ? C_NULL : x2.ptr))),
            reinterpret(Int, Base.unsafe_convert(Ptr{Ptr{Int}}, out1)),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
        )
        primary = LibPARI.Gen(r)
        o1 = LibPARI.Gen(out1[])
        LibPARI._set_avma(av)
        return (primary, o1)
    end
end

"alghasse(al,{pl}): the hasse invariant of the central simple algebra al at\nthe place pl."
function alghasse(x1::LibPARI.Gen; x2 = nothing)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:alghasse, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}((x2 === nothing ? C_NULL : x2.ptr))),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"alghassef(al): the hasse invariant of the central simple algebra al at finite places."
function alghassef(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:alghassef, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"alghassei(al): the hasse invariant of the central simple algebra al\nat infinite places."
function alghassei(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:alghassei, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"algindex(al,{pl}): the index of the central simple algebra al. If pl is\nset, it should be a prime ideal of the center or an integer between 1 and\nr1+r2, and in that case return the local index at the place pl instead."
function algindex(x1::LibPARI.Gen; x2 = nothing)
    return LibPARI.protected_call() do
        Int(
            LibPARI._trap_call(
                Int,
                cglobal((:algindex, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}((x2 === nothing ? C_NULL : x2.ptr))),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            ),
        )
    end
end

"alginv({al},x): element 1/x in al (Hamilton quaternions if omitted)."
function alginv(x2::LibPARI.Gen; x1 = nothing)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:alginv, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}((x1 === nothing ? C_NULL : x1.ptr))),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"alginvbasis(al): basis of the natural order of the central simple algebra\nal in terms of the stored order."
function alginvbasis(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:alginvbasis, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"algiscommutative(al): test whether the algebra al is commutative."
function algiscommutative(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        Int(
            LibPARI._trap_call(
                Cint,
                cglobal((:algiscommutative, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            ),
        )
    end
end

"algisdivision(al,{pl}): tests whether the central simple algebra al is a\ndivision algebra. If pl is set, it should be a prime ideal of the center or an\ninteger between 1 and r1+r2, and in that case tests whether al is locally a\ndivision algebra at the place pl instead."
function algisdivision(x1::LibPARI.Gen; x2 = nothing)
    return LibPARI.protected_call() do
        Int(
            LibPARI._trap_call(
                Cint,
                cglobal((:algisdivision, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}((x2 === nothing ? C_NULL : x2.ptr))),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            ),
        )
    end
end

"algisdivl({al},x,y,{&z}): tests whether y is left divisible by x and sets\nz to the left quotient x\\y."
function algisdivl(x2::LibPARI.Gen, x3::LibPARI.Gen; x1 = nothing)
    return LibPARI.protected_call() do
        out1 = Ref{Ptr{Int}}(C_NULL)
        av = LibPARI._avma()
        r = LibPARI._trap_call(
            Cint,
            cglobal((:algisdivl, LibPARI.PARI_jll.libpari)),
            4,
            reinterpret(Int, Ptr{Int}((x1 === nothing ? C_NULL : x1.ptr))),
            reinterpret(Int, Ptr{Int}(x2.ptr)),
            reinterpret(Int, Ptr{Int}(x3.ptr)),
            reinterpret(Int, Base.unsafe_convert(Ptr{Ptr{Int}}, out1)),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
        )
        primary = Int(r)
        o1 = LibPARI.Gen(out1[])
        LibPARI._set_avma(av)
        return (primary, o1)
    end
end

"algisinv({al},x,{&ix}): tests whether x is invertible in al (Hamilton\nquaternions if omitted) and sets ix to the inverse of x."
function algisinv(x2::LibPARI.Gen; x1 = nothing)
    return LibPARI.protected_call() do
        out1 = Ref{Ptr{Int}}(C_NULL)
        av = LibPARI._avma()
        r = LibPARI._trap_call(
            Cint,
            cglobal((:algisinv, LibPARI.PARI_jll.libpari)),
            3,
            reinterpret(Int, Ptr{Int}((x1 === nothing ? C_NULL : x1.ptr))),
            reinterpret(Int, Ptr{Int}(x2.ptr)),
            reinterpret(Int, Base.unsafe_convert(Ptr{Ptr{Int}}, out1)),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
        )
        primary = Int(r)
        o1 = LibPARI.Gen(out1[])
        LibPARI._set_avma(av)
        return (primary, o1)
    end
end

"algisramified(al,{pl}): tests whether the central simple algebra al is\nramified, i.e. not isomorphic to a matrix ring over its center. If pl is set,\nit should be a prime ideal of the center or an integer between 1 and r1+r2, and\nin that case tests whether al is locally ramified at the place pl instead."
function algisramified(x1::LibPARI.Gen; x2 = nothing)
    return LibPARI.protected_call() do
        Int(
            LibPARI._trap_call(
                Cint,
                cglobal((:algisramified, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}((x2 === nothing ? C_NULL : x2.ptr))),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            ),
        )
    end
end

"algissemisimple(al): test whether the algebra al is semisimple."
function algissemisimple(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        Int(
            LibPARI._trap_call(
                Cint,
                cglobal((:algissemisimple, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            ),
        )
    end
end

"algissimple(al,{ss=0}): test whether the algebra al is simple."
function algissimple(x1::LibPARI.Gen; x2::Integer = 0)
    return LibPARI.protected_call() do
        Int(
            LibPARI._trap_call(
                Cint,
                cglobal((:algissimple, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(x2),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            ),
        )
    end
end

"algissplit(al,{pl}): tests whether the central simple algebra al is\nsplit, i.e. isomorphic to a matrix ring over its center. If pl is set, it\nshould be a prime ideal of the center or an integer between 1 and r1+r2, and in\nthat case tests whether al is locally split at the place pl instead."
function algissplit(x1::LibPARI.Gen; x2 = nothing)
    return LibPARI.protected_call() do
        Int(
            LibPARI._trap_call(
                Cint,
                cglobal((:algissplit, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}((x2 === nothing ? C_NULL : x2.ptr))),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            ),
        )
    end
end

"alglatadd(al,lat1,lat2,{&ptinter}): the sum of the lattices lat1\nand lat2. If ptinter is present, set it to the intersection of the lattices."
function alglatadd(x1::LibPARI.Gen, x2::LibPARI.Gen, x3::LibPARI.Gen)
    return LibPARI.protected_call() do
        out1 = Ref{Ptr{Int}}(C_NULL)
        av = LibPARI._avma()
        r = LibPARI._trap_call(
            Ptr{Int},
            cglobal((:alglatadd, LibPARI.PARI_jll.libpari)),
            4,
            reinterpret(Int, Ptr{Int}(x1.ptr)),
            reinterpret(Int, Ptr{Int}(x2.ptr)),
            reinterpret(Int, Ptr{Int}(x3.ptr)),
            reinterpret(Int, Base.unsafe_convert(Ptr{Ptr{Int}}, out1)),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
        )
        primary = LibPARI.Gen(r)
        o1 = LibPARI.Gen(out1[])
        LibPARI._set_avma(av)
        return (primary, o1)
    end
end

"alglatcontains(al,lat,x,{&ptc}): tests whether the lattice lat contains the\nelement x. If ptc is present, sets it to the coordinates of x on the basis of\nlat."
function alglatcontains(x1::LibPARI.Gen, x2::LibPARI.Gen, x3::LibPARI.Gen)
    return LibPARI.protected_call() do
        out1 = Ref{Ptr{Int}}(C_NULL)
        av = LibPARI._avma()
        r = LibPARI._trap_call(
            Cint,
            cglobal((:alglatcontains, LibPARI.PARI_jll.libpari)),
            4,
            reinterpret(Int, Ptr{Int}(x1.ptr)),
            reinterpret(Int, Ptr{Int}(x2.ptr)),
            reinterpret(Int, Ptr{Int}(x3.ptr)),
            reinterpret(Int, Base.unsafe_convert(Ptr{Ptr{Int}}, out1)),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
        )
        primary = Int(r)
        o1 = LibPARI.Gen(out1[])
        LibPARI._set_avma(av)
        return (primary, o1)
    end
end

"alglatelement(al,lat,c): returns the element of al whose coordinates on\nthe Z-basis of lat are c."
function alglatelement(x1::LibPARI.Gen, x2::LibPARI.Gen, x3::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:alglatelement, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                reinterpret(Int, Ptr{Int}(x3.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"alglatindex(al,lat1,lat2): the generalized index (lat2:lat1)."
function alglatindex(x1::LibPARI.Gen, x2::LibPARI.Gen, x3::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:alglatindex, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                reinterpret(Int, Ptr{Int}(x3.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"alglatinter(al,lat1,lat2,{&ptsum}): the intersection of the lattices lat1\nand lat2. If ptsum is present, sets it to the sum of the lattices."
function alglatinter(x1::LibPARI.Gen, x2::LibPARI.Gen, x3::LibPARI.Gen)
    return LibPARI.protected_call() do
        out1 = Ref{Ptr{Int}}(C_NULL)
        av = LibPARI._avma()
        r = LibPARI._trap_call(
            Ptr{Int},
            cglobal((:alglatinter, LibPARI.PARI_jll.libpari)),
            4,
            reinterpret(Int, Ptr{Int}(x1.ptr)),
            reinterpret(Int, Ptr{Int}(x2.ptr)),
            reinterpret(Int, Ptr{Int}(x3.ptr)),
            reinterpret(Int, Base.unsafe_convert(Ptr{Ptr{Int}}, out1)),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
        )
        primary = LibPARI.Gen(r)
        o1 = LibPARI.Gen(out1[])
        LibPARI._set_avma(av)
        return (primary, o1)
    end
end

"alglatlefttransporter(al,lat1,lat2): the set of x in al such that x*lat1\nis contained in lat2."
function alglatlefttransporter(
    x1::LibPARI.Gen,
    x2::LibPARI.Gen,
    x3::LibPARI.Gen,
)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:alglatlefttransporter, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                reinterpret(Int, Ptr{Int}(x3.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"alglatmul(al,lat1,lat2): the lattice generated by the products of elements\nof lat1 and lat2."
function alglatmul(x1::LibPARI.Gen, x2::LibPARI.Gen, x3::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:alglatmul, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                reinterpret(Int, Ptr{Int}(x3.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"alglatrighttransporter(al,lat1,lat2): the set of x in al such that lat1*x\nis contained in lat2."
function alglatrighttransporter(
    x1::LibPARI.Gen,
    x2::LibPARI.Gen,
    x3::LibPARI.Gen,
)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:alglatrighttransporter, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                reinterpret(Int, Ptr{Int}(x3.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"alglatsubset(al,lat1,lat2,{&ptindex}): tests whether lat1 is contained in\nlat2 and if true and ptindex is present, sets it to the index (lat2:lat1)."
function alglatsubset(x1::LibPARI.Gen, x2::LibPARI.Gen, x3::LibPARI.Gen)
    return LibPARI.protected_call() do
        out1 = Ref{Ptr{Int}}(C_NULL)
        av = LibPARI._avma()
        r = LibPARI._trap_call(
            Cint,
            cglobal((:alglatsubset, LibPARI.PARI_jll.libpari)),
            4,
            reinterpret(Int, Ptr{Int}(x1.ptr)),
            reinterpret(Int, Ptr{Int}(x2.ptr)),
            reinterpret(Int, Ptr{Int}(x3.ptr)),
            reinterpret(Int, Base.unsafe_convert(Ptr{Ptr{Int}}, out1)),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
        )
        primary = Int(r)
        o1 = LibPARI.Gen(out1[])
        LibPARI._set_avma(av)
        return (primary, o1)
    end
end

"algmakeintegral(mt,{maps=0}): computes an integral multiplication table\nfor an isomorphic algebra."
function algmakeintegral(x1::LibPARI.Gen; x2::Integer = 0)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:algmakeintegral, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(x2),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"algmul({al},x,y): element x*y in al (Hamilton quaternions if omitted)."
function algmul(x2::LibPARI.Gen, x3::LibPARI.Gen; x1 = nothing)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:algmul, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}((x1 === nothing ? C_NULL : x1.ptr))),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                reinterpret(Int, Ptr{Int}(x3.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"algmultable(al): multiplication table of al over its prime subfield."
function algmultable(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:algmultable, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"algneg({al},x): element -x in al (Hamilton quaternions if omitted)."
function algneg(x2::LibPARI.Gen; x1 = nothing)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:algneg, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}((x1 === nothing ? C_NULL : x1.ptr))),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"algpoleval({al},T,b): T in K[X] evaluate T(b) in al (Hamilton quaternions\nif omitted)."
function algpoleval(x2::LibPARI.Gen, x3::LibPARI.Gen; x1 = nothing)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:algpoleval, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}((x1 === nothing ? C_NULL : x1.ptr))),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                reinterpret(Int, Ptr{Int}(x3.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"algpow({al},x,n): element x^n in al (Hamilton quaternions if omitted)."
function algpow(x2::LibPARI.Gen, x3::LibPARI.Gen; x1 = nothing)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:algpow, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}((x1 === nothing ? C_NULL : x1.ptr))),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                reinterpret(Int, Ptr{Int}(x3.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"algprimesubalg(al): prime subalgebra of the positive characteristic,\nsemisimple algebra al."
function algprimesubalg(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:algprimesubalg, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"algquotient(al,I,{maps=0}): quotient of the algebra al by the two-sided\nideal I."
function alg_quotient(x1::LibPARI.Gen, x2::LibPARI.Gen; x3::Integer = 0)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:alg_quotient, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(x3),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"algradical(al): Jacobson radical of the algebra al."
function algradical(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:algradical, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"algramifiedplaces(al): vector of the places of the center of al that\nramify in al. Each place is described as an integer between 1 and r1 or as a\nprime ideal."
function algramifiedplaces(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:algramifiedplaces, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"algrandom({al},b): random element in al (Hamilton quaternions if omitted)\nwith coefficients in [-b,b]."
function algrandom(x2::LibPARI.Gen; x1 = nothing)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:algrandom, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}((x1 === nothing ? C_NULL : x1.ptr))),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"algrelmultable(al): multiplication table of the central simple\nalgebra al over its center."
function algrelmultable(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:algrelmultable, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"algsimpledec(al,{maps=0}): [J,dec] where J is the Jacobson radical of al\nand dec is the decomposition into simple algebras of the semisimple algebra\nal/J."
function algsimpledec(x1::LibPARI.Gen; x2::Integer = 0)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:algsimpledec, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(x2),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"algsplit(al,{v='x}): computes an isomorphism between al and M_d(F_q)."
function algsplit(x1::LibPARI.Gen; x2::Integer = -1)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:algsplit, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(x2),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"algsplittingdata(al): data stored in the central simple algebra al to\ncompute a splitting of al over an extension."
function algsplittingdata(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:algsplittingdata, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"algsplittingfield(al): the stored splitting field of the central simple\nalgebra al."
function algsplittingfield(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:algsplittingfield, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"algsqr({al},x): element x^2 in al (Hamilton quaternions if omitted)."
function algsqr(x2::LibPARI.Gen; x1 = nothing)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:algsqr, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}((x1 === nothing ? C_NULL : x1.ptr))),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"algsub({al},x,y): element x-y in al (Hamilton quaternions if omitted)."
function algsub(x2::LibPARI.Gen, x3::LibPARI.Gen; x1 = nothing)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:algsub, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}((x1 === nothing ? C_NULL : x1.ptr))),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                reinterpret(Int, Ptr{Int}(x3.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"algsubalg(al,B): subalgebra of al with basis B."
function algsubalg(x1::LibPARI.Gen, x2::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:algsubalg, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"algtableinit(mt,{p=0}): initializes the associative algebra\nover Q (resp. Fp) defined by the multiplication table mt."
function algtableinit(x1::LibPARI.Gen; x2 = nothing)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:algtableinit, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}((x2 === nothing ? C_NULL : x2.ptr))),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"algtensor(al1,al2,{flag=3}): tensor product of al1 and al2."
function algtensor(x1::LibPARI.Gen, x2::LibPARI.Gen; x3::Integer = 3)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:algtensor, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(x3),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"algtype(al): type of the algebra al."
function algtype(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        Int(
            LibPARI._trap_call(
                Int,
                cglobal((:algtype, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            ),
        )
    end
end

"alias(newsym,sym): defines the symbol newsym as an alias for the symbol\nsym."
function alias0(x1::AbstractString, x2::AbstractString)
    LibPARI.protected_call() do
        let _cs1 = Base.cconvert(Cstring, x1), _cs2 = Base.cconvert(Cstring, x2)
            GC.@preserve _cs1 _cs2 LibPARI._trap_call(
                Cvoid,
                cglobal((:alias0, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Base.unsafe_convert(Cstring, _cs1)),
                reinterpret(Int, Base.unsafe_convert(Cstring, _cs2)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
    return nothing
end

"allocatemem({s=0}): allocates a new stack of s bytes. doubles the\nstack if s is omitted."
function gp_allocatemem(; x1 = nothing)
    LibPARI.protected_call() do
        LibPARI._trap_call(
            Cvoid,
            cglobal((:gp_allocatemem, LibPARI.PARI_jll.libpari)),
            1,
            reinterpret(Int, Ptr{Int}((x1 === nothing ? C_NULL : x1.ptr))),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
        )
    end
    return nothing
end

"apply(f,A): apply function f to each entry in A."
function apply0(x1::LibPARI.Gen, x2::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:apply0, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"arg(x): argument of x, such that -pi<arg(x)<=pi."
function garg(x1::LibPARI.Gen; prec::Integer = 4)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:garg, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                prec,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"arity(C): return the arity of the closure C."
function arity0(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:arity0, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"asin(x): arc sine of x."
function gasin(x1::LibPARI.Gen; prec::Integer = 4)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:gasin, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                prec,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"asinh(x): inverse hyperbolic sine of x."
function gasinh(x1::LibPARI.Gen; prec::Integer = 4)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:gasinh, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                prec,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"asympnum(expr,{alpha = 1}): asymptotic expansion of expr\nassuming it has rational coefficients with reasonable height; alpha is\nas in limitnum."
function asympnum0(x1::LibPARI.Gen; x2 = nothing, prec::Integer = 4)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:asympnum0, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}((x2 === nothing ? C_NULL : x2.ptr))),
                prec,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"asympnumraw(expr,N,{alpha = 1}): N+1 first terms of asymptotic expansion\nof expr as floating point numbers; alpha is as in limitnum."
function asympnumraw0(
    x1::LibPARI.Gen,
    x2::Integer;
    x3 = nothing,
    prec::Integer = 4,
)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:asympnumraw0, LibPARI.PARI_jll.libpari)),
                4,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(x2),
                reinterpret(Int, Ptr{Int}((x3 === nothing ? C_NULL : x3.ptr))),
                prec,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"atan(x): arc tangent of x."
function gatan(x1::LibPARI.Gen; prec::Integer = 4)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:gatan, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                prec,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"atanh(x): inverse hyperbolic tangent of x."
function gatanh(x1::LibPARI.Gen; prec::Integer = 4)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:gatanh, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                prec,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"bernfrac(n): Bernoulli number B_n, as a rational number."
function bernfrac(x1::Integer)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:bernfrac, LibPARI.PARI_jll.libpari)),
                1,
                Int(x1),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"bernpol(n,{a='x}): Bernoulli polynomial B_n, evaluated at a"
function bernpol_eval(x1::Integer; x2 = nothing)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:bernpol_eval, LibPARI.PARI_jll.libpari)),
                2,
                Int(x1),
                reinterpret(Int, Ptr{Int}((x2 === nothing ? C_NULL : x2.ptr))),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"bernreal(n): Bernoulli number B_n, as a real number with the current\nprecision."
function bernreal(x1::Integer; prec::Integer = 4)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:bernreal, LibPARI.PARI_jll.libpari)),
                2,
                Int(x1),
                prec,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"bernvec(n): returns a vector containing, as rational numbers,\nthe Bernoulli numbers B_0, B_2, ..., B_{2n}."
function bernvec(x1::Integer)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:bernvec, LibPARI.PARI_jll.libpari)),
                1,
                Int(x1),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"besselh1(nu,x): H^1-bessel function of index nu and argument x."
function hbessel1(x1::LibPARI.Gen, x2::LibPARI.Gen; prec::Integer = 4)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:hbessel1, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                prec,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"besselh2(nu,x): H^2-bessel function of index nu and argument x."
function hbessel2(x1::LibPARI.Gen, x2::LibPARI.Gen; prec::Integer = 4)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:hbessel2, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                prec,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"besseli(nu,x): I-bessel function of index nu and argument x."
function ibessel(x1::LibPARI.Gen, x2::LibPARI.Gen; prec::Integer = 4)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:ibessel, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                prec,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"besselj(nu,x): J-bessel function of index nu and argument x."
function jbessel(x1::LibPARI.Gen, x2::LibPARI.Gen; prec::Integer = 4)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:jbessel, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                prec,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"besseljh(n,x): J-bessel function of index n+1/2 and argument x, where\nn is a nonnegative integer."
function jbesselh(x1::LibPARI.Gen, x2::LibPARI.Gen; prec::Integer = 4)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:jbesselh, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                prec,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"besseljzero(nu,{k=1}): k-th zero of the J-bessel function of index nu. Works for real and complex ordrers but the result is guaranteed only if nu is nonnegative."
function besseljzero(x1::LibPARI.Gen; x2::Integer = 1, bitprec::Integer = 128)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:besseljzero, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(x2),
                bitprec,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"besselk(nu,x): K-bessel function of index nu and argument x."
function kbessel(x1::LibPARI.Gen, x2::LibPARI.Gen; prec::Integer = 4)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:kbessel, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                prec,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"besseln(nu,x): deprecated alias for bessely."
function ybessel(x1::LibPARI.Gen, x2::LibPARI.Gen; prec::Integer = 4)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:ybessel, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                prec,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"besselyzero(nu,{k=1}): k-th zero of the Y-bessel function of index nu. Works for real and complex ordrers but the result is guaranteed only if nu is nonnegative."
function besselyzero(x1::LibPARI.Gen; x2::Integer = 1, bitprec::Integer = 128)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:besselyzero, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(x2),
                bitprec,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"bestappr(x,{B}): return a rational approximation to x, whose\ndenominator is limited by B, if present. This function applies to reals,\nintmods, p-adics, and rationals of course. Otherwise it applies recursively\nto all components."
function bestappr(x1::LibPARI.Gen; x2 = nothing)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:bestappr, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}((x2 === nothing ? C_NULL : x2.ptr))),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"bestapprPade(x,{B},{Q}): returns a rational function approximation to x.\nThis function applies to series, polmods, and rational functions of course.\nOtherwise it applies recursively to all components."
function bestapprPade0(x1::LibPARI.Gen; x2::Integer = -1, x3::Integer = -1)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:bestapprPade0, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(x2),
                Int(x3),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"bestapprnf(V,T,{rootT}): T being an integral polynomial\nand V being a scalar, vector, or matrix, return a reasonable\napproximation of V with polmods modulo T. The rootT argument,\nif present, must be an element of polroots(T), i.e. a root of T fixing a\ncomplex embedding of Q[x]/(T)."
function bestapprnf(
    x1::LibPARI.Gen,
    x2::LibPARI.Gen;
    x3 = nothing,
    prec::Integer = 4,
)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:bestapprnf, LibPARI.PARI_jll.libpari)),
                4,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                reinterpret(Int, Ptr{Int}((x3 === nothing ? C_NULL : x3.ptr))),
                prec,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"bezout(x,y): deprecated alias for gcdext."
function gcdext0(x1::LibPARI.Gen, x2::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:gcdext0, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"bezoutres(A,B,{v}): deprecated alias for polresultantext."
function polresultantext0(x1::LibPARI.Gen, x2::LibPARI.Gen; x3::Integer = -1)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:polresultantext0, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(x3),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"bigomega(x): number of prime divisors of x, counted with multiplicity."
function bigomega(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        Int(
            LibPARI._trap_call(
                Int,
                cglobal((:bigomega, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            ),
        )
    end
end

"binary(x): gives the vector formed by the binary digits of x (x\ninteger)."
function binaire(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:binaire, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"binomial(n,{k}): binomial coefficient n*(n-1)...*(n-k+1)/k! defined for\nk in Z and any n. If k is omitted and n a nonnegative integer, return the\nvector [binomial(n,0),...,binomial(n,n)]."
function binomial0(x1::LibPARI.Gen; x2 = nothing)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:binomial0, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}((x2 === nothing ? C_NULL : x2.ptr))),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"bitand(x,y): bitwise \"and\" of two integers x and y. Negative numbers\nbehave as if modulo big power of 2."
function gbitand(x1::LibPARI.Gen, x2::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:gbitand, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"bitneg(x,{n=-1}): bitwise negation of an integers x truncated to n\nbits. n=-1 means represent infinite sequences of bit 1 as negative numbers.\nNegative numbers behave as if modulo big power of 2."
function gbitneg(x1::LibPARI.Gen; x2::Integer = -1)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:gbitneg, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(x2),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"bitnegimply(x,y): bitwise \"negated imply\" of two integers x and y,\nin other words, x BITAND BITNEG(y). Negative numbers behave as if modulo big\npower of 2."
function gbitnegimply(x1::LibPARI.Gen, x2::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:gbitnegimply, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"bitor(x,y): bitwise \"or\" of two integers x and y. Negative numbers\nbehave as if modulo big power of 2."
function gbitor(x1::LibPARI.Gen, x2::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:gbitor, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"bitprecision(x,{n}): if n is present and positive, return x at precision\nn bits. If n is omitted, return real precision of object x in bits."
function bitprecision00(x1::LibPARI.Gen; x2 = nothing)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:bitprecision00, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}((x2 === nothing ? C_NULL : x2.ptr))),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"bittest(x,n): gives bit number n (coefficient of 2^n) of the integer x.\nNegative numbers behave as if modulo big power of 2."
function gbittest(x1::LibPARI.Gen, x2::Integer)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:gbittest, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(x2),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"bitxor(x,y): bitwise \"exclusive or\" of two integers x and y.\nNegative numbers behave as if modulo big power of 2."
function gbitxor(x1::LibPARI.Gen, x2::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:gbitxor, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"bnfcertify(bnf,{flag = 0}): certify the correctness (i.e. remove the GRH)\nof the bnf data output by bnfinit. If flag is present, only certify that the\nclass group is a quotient of the one computed in bnf (much simpler in general)."
function bnfcertify0(x1::LibPARI.Gen; x2::Integer = 0)
    return LibPARI.protected_call() do
        Int(
            LibPARI._trap_call(
                Int,
                cglobal((:bnfcertify0, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(x2),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            ),
        )
    end
end

"bnfdecodemodule(nf,m): given a coded module m as in bnrdisclist,\ngives the true module."
function decodemodule(x1::LibPARI.Gen, x2::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:decodemodule, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"bnfinit(P,{flag=0},{tech=[]}): compute the necessary data for future\nuse in ideal and unit group computations, including fundamental units if\nthey are not too large. flag and tech are both optional. flag can be any of\n0: default, 1: include all data in algebraic form (compact units).\nSee manual for details about tech."
function bnfinit0(
    x1::LibPARI.Gen;
    x2::Integer = 0,
    x3 = nothing,
    prec::Integer = 4,
)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:bnfinit0, LibPARI.PARI_jll.libpari)),
                4,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(x2),
                reinterpret(Int, Ptr{Int}((x3 === nothing ? C_NULL : x3.ptr))),
                prec,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"bnfisintnorm(bnf,x,{flag=0}): compute a complete system of solutions (modulo\nunits of positive norm) of the absolute norm equation N(a)=x, where a\nbelongs to the maximal order of big number field bnf (if bnf is not\ncertified, this depends on GRH). If (optional) flag is set, allow returning\nsolutions in factored form."
function bnfisintnorm0(x1::LibPARI.Gen, x2::LibPARI.Gen; x3::Integer = 0)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:bnfisintnorm0, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(x3),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"bnfisnorm(bnf,x,{flag=1}): tries to tell whether x (in Q) is the norm\nof some fractional y (in bnf). Returns a vector [a,b] where x=Norm(a)*b.\nLooks for a solution which is a S-unit, with S a certain list of primes (in\nbnf) containing (among others) all primes dividing x. If bnf is known to be\nGalois, you may set flag=0 (in this case, x is a norm iff b=1). If flag is\nnonzero the program adds to S all the primes: dividing flag if flag<0, or\nless than flag if flag>0. The answer is guaranteed (i.e x norm iff b=1)\nunder GRH, if S contains all primes less than 4log(disc(Bnf))^2, where\nBnf is the Galois closure of bnf."
function bnfisnorm(x1::LibPARI.Gen, x2::LibPARI.Gen; x3::Integer = 1)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:bnfisnorm, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(x3),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"bnfisprincipal(bnf,x,{flag=1}): bnf being output by bnfinit, gives\n[e,t], where e is the vector of exponents on the class group generators and\nt is the generator of the resulting principal ideal. In particular x is\nprincipal if and only if e is the zero vector. flag is optional, whose\nbinary digits mean 1: output [e,t] (only e if unset); 2: increase precision\nuntil t can be computed (do not insist if unset); 4: return t in\nfactored form (compact representation)."
function bnfisprincipal0(x1::LibPARI.Gen, x2::LibPARI.Gen; x3::Integer = 1)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:bnfisprincipal0, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(x3),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"bnfissunit(bnf,sfu,x): this function is obsolete, use bnfisunit."
function bnfissunit(x1::LibPARI.Gen, x2::LibPARI.Gen, x3::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:bnfissunit, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                reinterpret(Int, Ptr{Int}(x3.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"bnfisunit(bnf,x,{U}): bnf being output by bnfinit, give\nthe column vector of exponents of x on the fundamental units and the roots\nof unity if x is a unit, the empty vector otherwise. If U is present,\nas given by bnfunits, decompose x on the attached S-units generators."
function bnfisunit0(x1::LibPARI.Gen, x2::LibPARI.Gen; x3 = nothing)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:bnfisunit0, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                reinterpret(Int, Ptr{Int}((x3 === nothing ? C_NULL : x3.ptr))),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"bnflog(bnf,l): let bnf be attached to a number field F and let l be\na prime number. Return the logarithmic l-class group Cl~_F."
function bnflog(x1::LibPARI.Gen, x2::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:bnflog, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"bnflogdegree(nf,A,l): let A be an ideal, return exp(deg_F A)\nthe exponential of the l-adic logarithmic degree."
function bnflogdegree(x1::LibPARI.Gen, x2::LibPARI.Gen, x3::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:bnflogdegree, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                reinterpret(Int, Ptr{Int}(x3.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"bnflogef(nf,pr): return [e~, f~] the logarithmic ramification and\nresidue degrees for the maximal ideal pr."
function bnflogef(x1::LibPARI.Gen, x2::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:bnflogef, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"bnfnarrow(bnf): given a big number field as output by bnfinit, gives\nas a 3-component vector the structure of the narrow class group."
function bnfnarrow(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:bnfnarrow, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"bnfsignunit(bnf): matrix of signs of the real embeddings of the system\nof fundamental units found by bnfinit."
function signunits(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:signunits, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"bnfsunit(bnf,S): compute the fundamental S-units of the number field\nbnf output by bnfinit, S being a list of prime ideals. res[1] contains the\nS-units, res[5] the S-classgroup."
function bnfsunit(x1::LibPARI.Gen, x2::LibPARI.Gen; prec::Integer = 4)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:bnfsunit, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                prec,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"bnfunits(bnf,{S}): return the fundamental units of the number field\nbnf output by bnfinit; if S is present and is a list of prime ideals, compute\nfundamental S-units instead. The first component of the result contains the\nS-units, followed by fundamental units, followed by the torsion unit.\nThe result may be used as an optional argument to bnfisunit."
function bnfunits(x1::LibPARI.Gen; x2 = nothing)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:bnfunits, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}((x2 === nothing ? C_NULL : x2.ptr))),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"bnrchar(G,g,{v}): returns all characters chi on G such that\nchi(g[i]) = e(v[i]); if v is omitted, returns all characters that are\ntrivial on the g[i]."
function bnrchar(x1::LibPARI.Gen, x2::LibPARI.Gen; x3 = nothing)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:bnrchar, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                reinterpret(Int, Ptr{Int}((x3 === nothing ? C_NULL : x3.ptr))),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"bnrclassno(A,{B},{C}): relative degree of the class field defined by\nA,B,C. [A,{B},{C}] is of type [bnr], [bnr,subgroup], [bnf,modulus],\nor [bnf,modulus,subgroup].\nFaster than bnrinit if only the ray class number is wanted."
function bnrclassno0(x1::LibPARI.Gen; x2 = nothing, x3 = nothing)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:bnrclassno0, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}((x2 === nothing ? C_NULL : x2.ptr))),
                reinterpret(Int, Ptr{Int}((x3 === nothing ? C_NULL : x3.ptr))),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"bnrclassnolist(bnf,list): if list is as output by ideallist or\nsimilar, gives list of corresponding ray class numbers."
function bnrclassnolist(x1::LibPARI.Gen, x2::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:bnrclassnolist, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"bnrcompositum(A,B): compositum [bnr,H] of the two abelian extensions\ngiven by A = [bnr1,H1] and B = [bnr2,H2], where bnr1 and bnr2 are attached\nto the same base field."
function bnrcompositum(x1::LibPARI.Gen, x2::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:bnrcompositum, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"bnrconductorofchar(bnr,chi): this function is obsolete, use bnrconductor."
function bnrconductorofchar(x1::LibPARI.Gen, x2::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:bnrconductorofchar, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"bnrdisclist(bnf,bound,{arch}): list of discriminants of\nray class fields of all conductors up to norm bound.\nThe ramified Archimedean places are given by arch; all possible values are\ntaken if arch is omitted. Supports the alternative syntax\nbnrdisclist(bnf,list), where list is as output by ideallist or ideallistarch\n(with units)."
function bnrdisclist0(x1::LibPARI.Gen, x2::LibPARI.Gen; x3 = nothing)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:bnrdisclist0, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                reinterpret(Int, Ptr{Int}((x3 === nothing ? C_NULL : x3.ptr))),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"bnrgaloisapply(bnr,mat,H): apply the automorphism given by its matrix\nmat to the congruence subgroup H given as a HNF matrix. The matrix mat can be\ncomputed with bnrgaloismatrix."
function bnrgaloisapply(x1::LibPARI.Gen, x2::LibPARI.Gen, x3::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:bnrgaloisapply, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                reinterpret(Int, Ptr{Int}(x3.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"bnrgaloismatrix(bnr,aut): return the matrix of the action of the\nautomorphism aut of the base field bnf.nf on the generators of the ray class\nfield bnr.gen; aut can be given as a polynomial, or a vector of automorphisms\nor a galois group as output by galoisinit, in which case a vector of matrices\nis returned (in the later case, only for the generators aut.gen)."
function bnrgaloismatrix(x1::LibPARI.Gen, x2::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:bnrgaloismatrix, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"bnrinit(bnf,f,{flag=0},{cycmod}): given a bnf as output by\nbnfinit and a modulus f, initializes data\nlinked to the ray class group structure corresponding to this module. flag\nis optional, and can be 0: default, 1: compute also the generators. If\nthe positive integer cycmod is present, only compute the ray class group\nmodulo cycmod-th powers."
function bnrinitmod(
    x1::LibPARI.Gen,
    x2::LibPARI.Gen;
    x3::Integer = 0,
    x4 = nothing,
)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:bnrinitmod, LibPARI.PARI_jll.libpari)),
                4,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(x3),
                reinterpret(Int, Ptr{Int}((x4 === nothing ? C_NULL : x4.ptr))),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"bnrisconductor(A,{B},{C}): returns 1 if the modulus is the\nconductor of the subfield of the ray class field given by A,B,C (see\nbnrdisc), and 0 otherwise. Slightly faster than bnrconductor if this is the\nonly desired result."
function bnrisconductor0(x1::LibPARI.Gen; x2 = nothing, x3 = nothing)
    return LibPARI.protected_call() do
        Int(
            LibPARI._trap_call(
                Int,
                cglobal((:bnrisconductor0, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}((x2 === nothing ? C_NULL : x2.ptr))),
                reinterpret(Int, Ptr{Int}((x3 === nothing ? C_NULL : x3.ptr))),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            ),
        )
    end
end

"bnrisgalois(bnr,gal,H): check whether the class field attached to\nthe subgroup H is Galois over the subfield of bnr.nf fixed by the Galois\ngroup gal, which can be given as output by galoisinit, or as a matrix or a\nvector of matrices as output by bnrgaloismatrix. The ray class field\nattached to bnr need to be Galois, which is not checked."
function bnrisgalois(x1::LibPARI.Gen, x2::LibPARI.Gen, x3::LibPARI.Gen)
    return LibPARI.protected_call() do
        Int(
            LibPARI._trap_call(
                Int,
                cglobal((:bnrisgalois, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                reinterpret(Int, Ptr{Int}(x3.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            ),
        )
    end
end

"bnrisprincipal(bnr,x,{flag=1}): bnr being output by bnrinit and x\nbeing an ideal coprime to bnr.mod, returns [v,alpha], where v is the vector\nof exponents on the ray class group generators and alpha is the generator of\nthe resulting principal ideal. If (optional) flag is set to 0, output only v."
function bnrisprincipal(x1::LibPARI.Gen, x2::LibPARI.Gen; x3::Integer = 1)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:bnrisprincipal, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(x3),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"bnrmap(A,B): if A and B are bnr structures for the same bnf attached\nto moduli mA and mB with mB | mA, return the canonical surjection from\nA to B. Alternatively, if A is a map from bnrmap and B is a congruence\nsubgroup or ray class character modulo mA, return the corresponding object on\nCl(mB)."
function bnrmap(x1::LibPARI.Gen, x2::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:bnrmap, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"bnrrootnumber(bnr,chi,{flag=0}): returns the so-called Artin Root\nNumber, i.e. the constant W appearing in the functional equation of the\nHecke L-function attached to chi. Set flag = 1 if the character is known\nto be primitive."
function bnrrootnumber(
    x1::LibPARI.Gen,
    x2::LibPARI.Gen;
    x3::Integer = 0,
    prec::Integer = 4,
)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:bnrrootnumber, LibPARI.PARI_jll.libpari)),
                4,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(x3),
                prec,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"bnrstark(bnr,{subgroup}): bnr being as output by\nbnrinit, finds a relative equation for the class field corresponding to\nthe module in bnr and the given congruence subgroup (the trivial subgroup if\nomitted) using Stark's units. The ground field and the class field must be\ntotally real."
function bnrstark(x1::LibPARI.Gen; x2 = nothing, prec::Integer = 4)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:bnrstark, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}((x2 === nothing ? C_NULL : x2.ptr))),
                prec,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"bnrstarkunit(bnr,{subgroup}): bnr being as output by bnrinit, returns\nthe characteristic polynomial of the (conjectural) Stark unit corresponding\nto the module in bnr and the given congruence subgroup (the trivial subgroup\nif omitted). The ground field must be totally real and all but one infinite\nplace must become complex in the class field."
function bnrstarkunit(x1::LibPARI.Gen; x2 = nothing)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:bnrstarkunit, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}((x2 === nothing ? C_NULL : x2.ptr))),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"break({n=1}): interrupt execution of current instruction sequence, and\nexit from the n innermost enclosing loops."
function break0(; x1::Integer = 1)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:break0, LibPARI.PARI_jll.libpari)),
                1,
                Int(x1),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"breakpoint(): interrupt the program and enter the breakloop. The program\ncontinues when the breakloop is exited."
function pari_breakpoint()
    LibPARI.protected_call() do
        LibPARI._trap_call(
            Cvoid,
            cglobal((:pari_breakpoint, LibPARI.PARI_jll.libpari)),
            0,
            Int(0),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
        )
    end
    return nothing
end

"call(f,A): A being a vector, evaluates f(A[1],...,A[#A])."
function call0(x1::LibPARI.Gen, x2::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:call0, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"ceil(x): ceiling of x = smallest integer >= x."
function gceil(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:gceil, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"centerlift(x,{v}): centered lift of x. Same as lift except for\nintmod and padic components."
function centerlift0(x1::LibPARI.Gen; x2::Integer = -1)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:centerlift0, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(x2),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"characteristic(x): characteristic of the base ring over which x is\ndefined."
function characteristic(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:characteristic, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"charconj(cyc,chi): given a finite abelian group (by its elementary\ndivisors cyc) and a character chi, return the conjugate character."
function charconj0(x1::LibPARI.Gen, x2::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:charconj0, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"chardiv(cyc,a,b): given a finite abelian group (by its elementary\ndivisors cyc) and two characters a and b, return the character a/b."
function chardiv0(x1::LibPARI.Gen, x2::LibPARI.Gen, x3::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:chardiv0, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                reinterpret(Int, Ptr{Int}(x3.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"chareval(G,chi,x,{z}): given an abelian group structure affording\na discrete logarithm method, e.g. G = znstar(N,1) or a bnr structure,\nlet x be an element of G and let chi be a character of G. This function\nreturns the value of chi at x, where the encoding depends on the optional\nargument z; if z is omitted, we fix a canonical o-th root of 1, zeta_o,\nwhere o is the character order and return the rational number c/o where\nchi(x) = (zeta_o)^c."
function chareval(
    x1::LibPARI.Gen,
    x2::LibPARI.Gen,
    x3::LibPARI.Gen;
    x4 = nothing,
)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:chareval, LibPARI.PARI_jll.libpari)),
                4,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                reinterpret(Int, Ptr{Int}(x3.ptr)),
                reinterpret(Int, Ptr{Int}((x4 === nothing ? C_NULL : x4.ptr))),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"chargalois(cyc,{ORD}): let cyc represent a finite abelian group G\nby its elementary divisors cyc, return a list of representatives for the\nGalois orbits of characters of G. If ORD is present, select characters\ndepending on their orders: if ORD is a t_INT, restrict to orders less than\nthis bound; if ORD is a t_VEC or t_VECSMALL, restrict to orders in the list."
function chargalois(x1::LibPARI.Gen; x2 = nothing)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:chargalois, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}((x2 === nothing ? C_NULL : x2.ptr))),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"charker(cyc,chi): given a finite abelian group (by its elementary\ndivisors cyc) and a character chi, return its kernel."
function charker0(x1::LibPARI.Gen, x2::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:charker0, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"charmul(cyc,a,b): given a finite abelian group (by its elementary\ndivisors cyc) and two characters a and b, return the product character\nab."
function charmul0(x1::LibPARI.Gen, x2::LibPARI.Gen, x3::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:charmul0, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                reinterpret(Int, Ptr{Int}(x3.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"charorder(cyc,chi): given a finite abelian group (by its elementary\ndivisors cyc) and a character chi, return the order of chi."
function charorder0(x1::LibPARI.Gen, x2::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:charorder0, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"charpow(cyc,a,n): given a finite abelian group (by its elementary\ndivisors cyc) a character a and an integer n return the character a^n."
function charpow0(x1::LibPARI.Gen, x2::LibPARI.Gen, x3::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:charpow0, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                reinterpret(Int, Ptr{Int}(x3.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"chinese(x,{y}): x,y being both intmods (or polmods) computes z in the\nsame residue classes as x and y."
function chinese(x1::LibPARI.Gen; x2 = nothing)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:chinese, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}((x2 === nothing ? C_NULL : x2.ptr))),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"cmp(x,y): compare two arbitrary objects x and y (1 if x>y, 0 if x=y, -1\nif x<y). The function is used to implement sets, and has no useful\nmathematical meaning."
function cmp_universal(x1::LibPARI.Gen, x2::LibPARI.Gen)
    return LibPARI.protected_call() do
        Int(
            LibPARI._trap_call(
                Cint,
                cglobal((:cmp_universal, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            ),
        )
    end
end

"component(x,n): the n'th component of the internal representation of\nx. For vectors or matrices, it is simpler to use x[]. For list objects such\nas nf, bnf, bnr or ell, it is much easier to use member functions starting\nwith \".\"."
function compo(x1::LibPARI.Gen, x2::Integer)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:compo, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(x2),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"concat(x,{y}): concatenation of x and y, which can be scalars, vectors\nor matrices, or lists (in this last case, both x and y have to be lists). If\ny is omitted, x has to be a list or row vector and its elements are\nconcatenated."
function gconcat(x1::LibPARI.Gen; x2 = nothing)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:gconcat, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}((x2 === nothing ? C_NULL : x2.ptr))),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"conj(x): the algebraic conjugate of x."
function gconj(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:gconj, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"conjvec(z): conjugate vector of the algebraic number z."
function conjvec(x1::LibPARI.Gen; prec::Integer = 4)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:conjvec, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                prec,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"content(x,{D}): gcd of all the components of x, when this makes sense."
function content0(x1::LibPARI.Gen; x2 = nothing)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:content0, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}((x2 === nothing ? C_NULL : x2.ptr))),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"contfraceval(CF,t,{lim=-1}): given a continued fraction CF from\ncontfracinit, evaluate the first lim terms of the continued fraction at t\n(all terms if lim is negative or omitted)."
function contfraceval(x1::LibPARI.Gen, x2::LibPARI.Gen; x3::Integer = -1)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:contfraceval, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(x3),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"contfracinit(M,{lim = -1}): given M representing the power\nseries S = sum_{n>=0} M[n+1]z^n, transform it into a continued fraction\nsuitable for evaluation."
function contfracinit(x1::LibPARI.Gen; x2::Integer = -1)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:contfracinit, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(x2),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"contfracpnqn(x,{n=-1}): [p_n,p_{n-1}; q_n,q_{n-1}] corresponding to the\ncontinued fraction x. If n >= 0 is present, returns all convergents from\np_0/q_0 up to p_n/q_n."
function contfracpnqn(x1::LibPARI.Gen; x2::Integer = -1)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:contfracpnqn, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(x2),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"core(n,{flag=0}): unique squarefree integer d\ndividing n such that n/d is a square. If (optional) flag is nonzero, output\nthe two-component row vector [d,f], where d is the unique squarefree integer\ndividing n such that n/d=f^2 is a square."
function core0(x1::LibPARI.Gen; x2::Integer = 0)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:core0, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(x2),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"coredisc(n,{flag=0}): discriminant of the quadratic field Q(sqrt(n)).\nIf (optional) flag is nonzero, output a two-component row vector [d,f],\nwhere d is the discriminant of the quadratic field Q(sqrt(n)) and n=df^2. f\nmay be a half integer."
function coredisc0(x1::LibPARI.Gen; x2::Integer = 0)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:coredisc0, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(x2),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"cos(x): cosine of x."
function gcos(x1::LibPARI.Gen; prec::Integer = 4)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:gcos, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                prec,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"cosh(x): hyperbolic cosine of x."
function gcosh(x1::LibPARI.Gen; prec::Integer = 4)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:gcosh, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                prec,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"cotan(x): cotangent of x."
function gcotan(x1::LibPARI.Gen; prec::Integer = 4)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:gcotan, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                prec,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"cotanh(x): hyperbolic cotangent of x."
function gcotanh(x1::LibPARI.Gen; prec::Integer = 4)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:gcotanh, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                prec,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"dbg_down({n=1}): (break loop) go down n frames. Cancel a previous dbg_up."
function dbg_down(; x1::Integer = 1)
    LibPARI.protected_call() do
        LibPARI._trap_call(
            Cvoid,
            cglobal((:dbg_down, LibPARI.PARI_jll.libpari)),
            1,
            Int(x1),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
        )
    end
    return nothing
end

"dbg_err(): (break loop) return the error data of the current error, if any."
function dbg_err()
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:dbg_err, LibPARI.PARI_jll.libpari)),
                0,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"dbg_up({n=1}): (break loop) go up n frames, which allows to inspect data\nof the parent function."
function dbg_up(; x1::Integer = 1)
    LibPARI.protected_call() do
        LibPARI._trap_call(
            Cvoid,
            cglobal((:dbg_up, LibPARI.PARI_jll.libpari)),
            1,
            Int(x1),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
        )
    end
    return nothing
end

"dbg_x(A,{n}): print inner structure of A, complete if n is omitted, up to\nlevel n otherwise. Intended for debugging."
function dbgGEN(x1::LibPARI.Gen; x2::Integer = -1)
    LibPARI.protected_call() do
        LibPARI._trap_call(
            Cvoid,
            cglobal((:dbgGEN, LibPARI.PARI_jll.libpari)),
            2,
            reinterpret(Int, Ptr{Int}(x1.ptr)),
            Int(x2),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
        )
    end
    return nothing
end

"denominator(f,{D}): denominator of f."
function denominator(x1::LibPARI.Gen; x2 = nothing)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:denominator, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}((x2 === nothing ? C_NULL : x2.ptr))),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"diffop(x,v,d,{n=1}): apply the differential operator D to x, where D is defined\nby D(v[i])=d[i], where v is a vector of variable names. D is 0 for variables\noutside of v unless they appear as modulus of a POLMOD. If the optional parameter n\nis given, return D^n(x) instead."
function diffop0(
    x1::LibPARI.Gen,
    x2::LibPARI.Gen,
    x3::LibPARI.Gen;
    x4::Integer = 1,
)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:diffop0, LibPARI.PARI_jll.libpari)),
                4,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                reinterpret(Int, Ptr{Int}(x3.ptr)),
                Int(x4),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"digits(x,{b}): gives the vector formed by the digits of x in base b."
function digits(x1::LibPARI.Gen; x2 = nothing)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:digits, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}((x2 === nothing ? C_NULL : x2.ptr))),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"dilog(x): dilogarithm of x."
function dilog(x1::LibPARI.Gen; prec::Integer = 4)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:dilog, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                prec,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"dirdiv(x,y): division of the Dirichlet series x by the Dirichlet\nseries y."
function dirdiv(x1::LibPARI.Gen, x2::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:dirdiv, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"dirmul(x,y): multiplication of the Dirichlet series x by the Dirichlet\nseries y."
function dirmul(x1::LibPARI.Gen, x2::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:dirmul, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"dirpowers(n,x): return the vector [1^x,2^x,...,n^x]."
function dirpowers(x1::Integer, x2::LibPARI.Gen; prec::Integer = 4)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:dirpowers, LibPARI.PARI_jll.libpari)),
                3,
                Int(x1),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                prec,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"dirzetak(nf,b): Dirichlet series of the Dedekind zeta function of the\nnumber field nf up to the bound b-1."
function dirzetak(x1::LibPARI.Gen, x2::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:dirzetak, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"divisors(x,{flag=0}): gives a vector formed by the divisors of x in\nincreasing order. If flag = 1, return pairs [d, factor(d)]."
function divisors0(x1::LibPARI.Gen; x2::Integer = 0)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:divisors0, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(x2),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"divisorslenstra(N,r,s): finds all divisors d of N such that d = r\n(mod s). Assume that (r,s) = 1 and s^3 > N."
function divisorslenstra(x1::LibPARI.Gen, x2::LibPARI.Gen, x3::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:divisorslenstra, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                reinterpret(Int, Ptr{Int}(x3.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"divrem(x,y,{v}): euclidean division of x by y giving as a\n2-dimensional column vector the quotient and the remainder, with respect to\nv (to main variable if v is omitted)."
function divrem(x1::LibPARI.Gen, x2::LibPARI.Gen; x3::Integer = -1)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:divrem, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(x3),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"eint1(x,{n}): exponential integral E1(x). If n is present and x > 0,\ncomputes the vector of the first n values of the exponential integral E1(n x)."
function veceint1(x1::LibPARI.Gen; x2 = nothing, prec::Integer = 4)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:veceint1, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}((x2 === nothing ? C_NULL : x2.ptr))),
                prec,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"ell2cover(E): if E is an elliptic curve over Q, returns a basis of the\nset of everywhere locally soluble 2-covers of the curve E. For each cover a\npair [R,P] is returned where y^2-R(x) is a quartic curve and P belongs to\nE(k), where k = Q(x)[y] / (y^2-R(x))."
function ell2cover(x1::LibPARI.Gen; prec::Integer = 4)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:ell2cover, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                prec,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"ellE(k): Complete elliptic integral of the second kind for the\ncomplex parameter k using the agm."
function ellE(x1::LibPARI.Gen; prec::Integer = 4)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:ellE, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                prec,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"ellK(k): Complete elliptic integral of the first kind for the\ncomplex parameter k using the agm."
function ellK(x1::LibPARI.Gen; prec::Integer = 4)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:ellK, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                prec,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"ellL1(E,{r=0}): returns the value at s=1 of the derivative of order r of\nthe L-function of the elliptic curve E."
function ellL1(x1::LibPARI.Gen; x2::Integer = 0, bitprec::Integer = 128)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:ellL1, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(x2),
                bitprec,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"elladd(E,z1,z2): sum of the points z1 and z2 on elliptic curve E."
function elladd(x1::LibPARI.Gen, x2::LibPARI.Gen, x3::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:elladd, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                reinterpret(Int, Ptr{Int}(x3.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"ellak(E,n): computes the n-th Fourier coefficient of the L-function of\nthe elliptic curve E (assumes E is an integral model)."
function akell(x1::LibPARI.Gen, x2::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:akell, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"ellan(E,n): computes the first n Fourier coefficients of the\nL-function of the elliptic curve E defined over a number field."
function ellan(x1::LibPARI.Gen, x2::Integer)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:ellan, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(x2),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"ellanalyticrank(E,{eps}): returns the order of vanishing at s=1\nof the L-function of the elliptic curve E and the value of the first\nnonzero derivative. To determine this order, it is assumed that any\nvalue less than eps is zero. If no value of eps is given, 2^(-bitprecision/2)\nis used."
function ellanalyticrank(x1::LibPARI.Gen; x2 = nothing, bitprec::Integer = 128)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:ellanalyticrank, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}((x2 === nothing ? C_NULL : x2.ptr))),
                bitprec,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"ellap(E,{p}): given an elliptic curve E defined over\na finite field Fq, return the trace of Frobenius a_p = q+1-#E(Fq); for other\nfields of definition K, p must define a finite residue field,\n(p prime for K = Qp or Q; p a maximal ideal for K a number field),\nreturn the order of the (nonsingular) reduction of E."
function ellap(x1::LibPARI.Gen; x2 = nothing)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:ellap, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}((x2 === nothing ? C_NULL : x2.ptr))),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"ellbil(E,z1,z2): deprecated alias for ellheight(E,P,Q)."
function bilhell(
    x1::LibPARI.Gen,
    x2::LibPARI.Gen,
    x3::LibPARI.Gen;
    prec::Integer = 4,
)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:bilhell, LibPARI.PARI_jll.libpari)),
                4,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                reinterpret(Int, Ptr{Int}(x3.ptr)),
                prec,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"ellbsd(E): E being an elliptic curve over a number field,\nreturns a real number c such that the BSD conjecture predicts that\nlfun(E,1,r)/r! = c*R*S where r is the rank, R is the regulator and S is the\ncardinal of the Tate-Shafarevich group."
function ellbsd(x1::LibPARI.Gen; prec::Integer = 4)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:ellbsd, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                prec,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"ellcard(E,{p}): given an elliptic curve E defined over\na finite field Fq, return the order of the group E(Fq); for other fields\nof definition K, p must define a finite residue field,\n(p prime for K = Qp or Q; p a maximal ideal for K a number field),\nreturn the order of the (nonsingular) reduction of E."
function ellcard(x1::LibPARI.Gen; x2 = nothing)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:ellcard, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}((x2 === nothing ? C_NULL : x2.ptr))),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"ellchangecurve(E,v): change data on elliptic curve according to\nv=[u,r,s,t]."
function ellchangecurve(x1::LibPARI.Gen, x2::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:ellchangecurve, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"ellchangepoint(x,v): change data on point or vector of points x on an\nelliptic curve according to v=[u,r,s,t]."
function ellchangepoint(x1::LibPARI.Gen, x2::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:ellchangepoint, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"ellchangepointinv(x,v): change data on point or vector of points x on an\nelliptic curve according to v=[u,r,s,t], inverse of ellchangepoint."
function ellchangepointinv(x1::LibPARI.Gen, x2::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:ellchangepointinv, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"ellconvertname(name): convert an elliptic curve name (as found in\nthe elldata database) from a string to a triplet [conductor, isogeny class,\nindex]. It will also convert a triplet back to a curve name."
function ellconvertname(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:ellconvertname, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"elldivpol(E,n,{v='x}): n-division polynomial f_n for the curve E in the\nvariable v."
function elldivpol(x1::LibPARI.Gen, x2::Integer; x3::Integer = -1)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:elldivpol, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(x2),
                Int(x3),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"elleisnum(w,k,{flag=0}): k being an even positive integer, computes the\nnumerical value of the Eisenstein series of weight k at the lattice\nw, as given by ellperiods. When flag is nonzero and k=4 or 6, this gives the\nelliptic invariants g2 or g3 with the correct normalization."
function elleisnum(
    x1::LibPARI.Gen,
    x2::Integer;
    x3::Integer = 0,
    prec::Integer = 4,
)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:elleisnum, LibPARI.PARI_jll.libpari)),
                4,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(x2),
                Int(x3),
                prec,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"elleta(w): w=[w1,w2], returns the vector [eta1,eta2] of quasi-periods\nattached to [w1,w2]."
function elleta(x1::LibPARI.Gen; prec::Integer = 4)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:elleta, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                prec,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"ellformaldifferential(E,{n=seriesprecision},{t='x}) : E elliptic curve,\nn integer. Returns n terms of the power series [f, g] such that\nomega = dx/(2y+a_1x+a_3) = f(t) dt and eta = x(t) * omega = g(t) dt in the\nlocal parameter t=-x/y."
function ellformaldifferential(
    x1::LibPARI.Gen;
    seriesprec::Integer = 16,
    x2::Integer = -1,
)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:ellformaldifferential, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                seriesprec,
                Int(x2),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"ellformalexp(E,{n=seriesprecision},{z='x}): E elliptic curve,\nreturns n terms of the formal elliptic exponential on E as a series in z."
function ellformalexp(
    x1::LibPARI.Gen;
    seriesprec::Integer = 16,
    x2::Integer = -1,
)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:ellformalexp, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                seriesprec,
                Int(x2),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"ellformallog(E,{n=seriesprecision},{v='x}): E elliptic curve,\nreturns n terms of the elliptic logarithm as a series of t =-x/y."
function ellformallog(
    x1::LibPARI.Gen;
    seriesprec::Integer = 16,
    x2::Integer = -1,
)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:ellformallog, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                seriesprec,
                Int(x2),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"ellformalpoint(E,{n=seriesprecision},{v='x}): E elliptic curve,\nn integer; return the coordinates [x(t), y(t)] on the elliptic curve as a\nformal expansion in the formal parameter t = -x/y."
function ellformalpoint(
    x1::LibPARI.Gen;
    seriesprec::Integer = 16,
    x2::Integer = -1,
)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:ellformalpoint, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                seriesprec,
                Int(x2),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"ellformalw(E,{n=seriesprecision},{t='x}): E elliptic curve,\nn integer; returns n terms of the formal expansion of w = -1/y in the formal\nparameter t = -x/y."
function ellformalw(x1::LibPARI.Gen; seriesprec::Integer = 16, x2::Integer = -1)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:ellformalw, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                seriesprec,
                Int(x2),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"ellfromeqn(P): given a genus 1 plane curve, defined by the affine\nequation f(x,y) = 0, return the coefficients [a1,a2,a3,a4,a6] of a\nWeierstrass equation for its Jacobian.\nThis allows to recover a Weierstrass model for an elliptic curve given by a\ngeneral plane cubic or by a binary quartic or biquadratic model."
function ellfromeqn(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:ellfromeqn, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"ellfromj(j): returns the coefficients [a1,a2,a3,a4,a6] of a fixed\nelliptic curve with j-invariant j."
function ellfromj(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:ellfromj, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"ellgenerators(E): if E is an elliptic curve over the rationals,\nreturn the generators of the Mordell-Weil group attached to the curve.\nThis relies on the curve being referenced in the elldata database.\nIf E is an elliptic curve over a finite field Fq as output by ellinit(),\nreturn a minimal set of generators for the group E(Fq)."
function ellgenerators(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:ellgenerators, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"ellglobalred(E): E being an elliptic curve over a number field,\nreturns [N, v, c, faN, L], where N is the conductor of E,\nc is the product of the local Tamagawa numbers c_p, faN is the\nfactorization of N and L[i] is elllocalred(E, faN[i,1]); v is an obsolete\nfield."
function ellglobalred(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:ellglobalred, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"ellheegner(E): return a rational nontorsion point on the elliptic curve E\nassumed to be of rank 1."
function ellheegner(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:ellheegner, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"ellheight(E,{P},{Q}): Faltings height of the curve E, resp. canonical\nheight of the point P on elliptic curve E, resp. the value of the attached\nbilinear form at (P,Q)."
function ellheight0(
    x1::LibPARI.Gen;
    x2 = nothing,
    x3 = nothing,
    prec::Integer = 4,
)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:ellheight0, LibPARI.PARI_jll.libpari)),
                4,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}((x2 === nothing ? C_NULL : x2.ptr))),
                reinterpret(Int, Ptr{Int}((x3 === nothing ? C_NULL : x3.ptr))),
                prec,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"ellheightmatrix(E,x): gives the height matrix for vector of points x\non elliptic curve E."
function ellheightmatrix(x1::LibPARI.Gen, x2::LibPARI.Gen; prec::Integer = 4)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:ellheightmatrix, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                prec,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"ellidentify(E): look up the elliptic curve E in the elldata database and\nreturn [[N, M, ...], C] where N is the name of the curve in Cremona's\ndatabase, M the minimal model and C the change of coordinates (see\nellchangecurve)."
function ellidentify(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:ellidentify, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"ellinit(x,{D=1}): let x be a vector [a1,a2,a3,a4,a6], or [a4,a6] if\na1=a2=a3=0, defining the curve Y^2 + a1.XY + a3.Y = X^3 + a2.X^2 + a4.X +\na6; x can also be a string, in which case the curve with matching name is\nretrieved from the elldata database, if available. This function initializes\nan elliptic curve over the domain D (inferred from coefficients if omitted)."
function ellinit(x1::LibPARI.Gen; x2 = nothing, prec::Integer = 4)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:ellinit, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}((x2 === nothing ? C_NULL : x2.ptr))),
                prec,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"ellintegralmodel(E,{&v}): given an elliptic curve E defined\nover a number field or Qp, returns an integral model. If v is present,\nsets the variable v to the corresponding change of variable."
function ellintegralmodel(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        out1 = Ref{Ptr{Int}}(C_NULL)
        av = LibPARI._avma()
        r = LibPARI._trap_call(
            Ptr{Int},
            cglobal((:ellintegralmodel, LibPARI.PARI_jll.libpari)),
            2,
            reinterpret(Int, Ptr{Int}(x1.ptr)),
            reinterpret(Int, Base.unsafe_convert(Ptr{Ptr{Int}}, out1)),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
        )
        primary = LibPARI.Gen(r)
        o1 = LibPARI.Gen(out1[])
        LibPARI._set_avma(av)
        return (primary, o1)
    end
end

"elliscm(E): return 0 if the elliptic curve E, defined\nover a number field, is not CM, otherwise return the discriminant of its\nendomorphism ring."
function elliscm(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        Int(
            LibPARI._trap_call(
                Int,
                cglobal((:elliscm, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            ),
        )
    end
end

"ellisdivisible(E,P,n,{&Q}): given E/K and P in E(K),\nchecks whether P = [n]R for some R in E(K) and sets Q to one such R if so;\nthe integer n >= 0 may be given as ellxn(E,n)."
function ellisdivisible(x1::LibPARI.Gen, x2::LibPARI.Gen, x3::LibPARI.Gen)
    return LibPARI.protected_call() do
        out1 = Ref{Ptr{Int}}(C_NULL)
        av = LibPARI._avma()
        r = LibPARI._trap_call(
            Int,
            cglobal((:ellisdivisible, LibPARI.PARI_jll.libpari)),
            4,
            reinterpret(Int, Ptr{Int}(x1.ptr)),
            reinterpret(Int, Ptr{Int}(x2.ptr)),
            reinterpret(Int, Ptr{Int}(x3.ptr)),
            reinterpret(Int, Base.unsafe_convert(Ptr{Ptr{Int}}, out1)),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
        )
        primary = Int(r)
        o1 = LibPARI.Gen(out1[])
        LibPARI._set_avma(av)
        return (primary, o1)
    end
end

"ellisisom(E,F): return 0 if the elliptic curves E and F defined over the\nsame number field are not isomorphic, otherwise return [u,r,s,t] suitable for\nellchangecurve, mapping E to F."
function ellisisom(x1::LibPARI.Gen, x2::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:ellisisom, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"ellisogeny(E,G,{only_image=0},{x='x},{y='y}): compute the image\nand isogeny corresponding to the quotient of E by the subgroup G."
function ellisogeny(
    x1::LibPARI.Gen,
    x2::LibPARI.Gen;
    x3::Integer = 0,
    x4::Integer = -1,
    x5::Integer = -1,
)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:ellisogeny, LibPARI.PARI_jll.libpari)),
                5,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(x3),
                Int(x4),
                Int(x5),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"ellisogenyapply(f,g): given an isogeny f and g either a point P (in the\ndomain of f) or an isogeny, apply f to g: return the image of P under f or\nthe composite isogeny f o g."
function ellisogenyapply(x1::LibPARI.Gen, x2::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:ellisogenyapply, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"ellisomat(E,{p=0},{flag=0}): E being an elliptic curve over a number\nfield K, returns a list of representatives of the isomorphism classes of\nelliptic curves defined over K and K-isogenous to E, with the corresponding\nisogenies from E and their dual, and the matrix of the isogeny degrees between\nthe curves. If flag is 1, the isogenies are not computed, which saves\ntime. If p is set, it must be a prime number: in this case only isogenies of\ndegree a power of p are considered."
function ellisomat(x1::LibPARI.Gen; x2::Integer = 0, x3::Integer = 0)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:ellisomat, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(x2),
                Int(x3),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"ellisoncurve(E,z): true(1) if z is on elliptic curve E, false(0) if not."
function ellisoncurve(x1::LibPARI.Gen, x2::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:ellisoncurve, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"ellisotree(E): E being an elliptic curve over Q or a set of isogenous\nrational curves as given by ellisomat, return minimal models of the isomorphism\nclasses of elliptic curves isogenous to E (or in the set) and the oriented\ngraph of isogenies of prime degree (adjacency matrix)."
function ellisotree(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:ellisotree, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"ellissupersingular(E,{p}): return 1 if the elliptic curve E, defined\nover a number field or a finite field, is supersingular at p, and 0 otherwise."
function ellissupersingular(x1::LibPARI.Gen; x2 = nothing)
    return LibPARI.protected_call() do
        Int(
            LibPARI._trap_call(
                Cint,
                cglobal((:ellissupersingular, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}((x2 === nothing ? C_NULL : x2.ptr))),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            ),
        )
    end
end

"ellj(x): elliptic j invariant of x."
function jell(x1::LibPARI.Gen; prec::Integer = 4)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:jell, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                prec,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"elllocalred(E,{p}): E being an elliptic curve, returns\n[f,kod,[u,r,s,t],c], where f is the conductor's exponent, kod is the Kodaira\ntype for E at p, [u,r,s,t] is the change of variable needed to make E\nminimal at p, and c is the local Tamagawa number c_p."
function elllocalred(x1::LibPARI.Gen; x2 = nothing)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:elllocalred, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}((x2 === nothing ? C_NULL : x2.ptr))),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"elllog(E,P,G,{o}): return the discrete logarithm of the point P of\nthe elliptic curve E in base G. If present, o represents the order of G.\nIf not present, assume that G generates the curve."
function elllog(x1::LibPARI.Gen, x2::LibPARI.Gen, x3::LibPARI.Gen; x4 = nothing)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:elllog, LibPARI.PARI_jll.libpari)),
                4,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                reinterpret(Int, Ptr{Int}(x3.ptr)),
                reinterpret(Int, Ptr{Int}((x4 === nothing ? C_NULL : x4.ptr))),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"elllseries(E,s,{A=1}): L-series at s of the elliptic curve E, where A\na cut-off point close to 1."
function elllseries(
    x1::LibPARI.Gen,
    x2::LibPARI.Gen;
    x3 = nothing,
    prec::Integer = 4,
)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:elllseries, LibPARI.PARI_jll.libpari)),
                4,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                reinterpret(Int, Ptr{Int}((x3 === nothing ? C_NULL : x3.ptr))),
                prec,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"ellmaninconstant(E): let E be an elliptic curve over Q given by\nellinit or a rational isogeny class given by ellisomat. Return the\nManin constant of the curve, see ellweilcurve.\nThe algorithm is slow but unconditional."
function ellmaninconstant(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:ellmaninconstant, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"ellminimaldisc(E): E being an elliptic curve defined over a number\nfield output by ellinit, return the minimal discriminant ideal of E."
function ellminimaldisc(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:ellminimaldisc, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"ellminimalmodel(E,{&v}): determines whether the elliptic curve E defined\nover a number field admits a global minimal model. If so return it\nand sets v to the corresponding change of variable. Else return the\n(nonprincipal) Weierstrass class of E."
function ellminimalmodel(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        out1 = Ref{Ptr{Int}}(C_NULL)
        av = LibPARI._avma()
        r = LibPARI._trap_call(
            Ptr{Int},
            cglobal((:ellminimalmodel, LibPARI.PARI_jll.libpari)),
            2,
            reinterpret(Int, Ptr{Int}(x1.ptr)),
            reinterpret(Int, Base.unsafe_convert(Ptr{Ptr{Int}}, out1)),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
        )
        primary = LibPARI.Gen(r)
        o1 = LibPARI.Gen(out1[])
        LibPARI._set_avma(av)
        return (primary, o1)
    end
end

"ellminimaltwist(E,{flag=0}): E being an elliptic curve defined over Q,\nreturn a discriminant D such that the twist of E by D is minimal among all\npossible quadratic twists, i.e., if flag=0, its minimal model has minimal\ndiscriminant, or if flag=1, it has minimal conductor."
function ellminimaltwist0(x1::LibPARI.Gen; x2::Integer = 0)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:ellminimaltwist0, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(x2),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"ellmoddegree(e): e being an elliptic curve defined over Q output by\nellinit, compute the modular degree of e divided by the square of the\nManin constant."
function ellmoddegree(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:ellmoddegree, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"ellmodulareqn(N,{x},{y}): given a prime N < 500, return a vector [P, t]\nwhere P(x,y) is a modular equation of level N. This requires the package\nseadata. The equation is either of canonical type (t=0) or of Atkin type (t=1)."
function ellmodulareqn(x1::Integer; x2::Integer = -1, x3::Integer = -1)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:ellmodulareqn, LibPARI.PARI_jll.libpari)),
                3,
                Int(x1),
                Int(x2),
                Int(x3),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"ellmul(E,z,n): n times the point z on elliptic curve E (n in Z)."
function ellmul(x1::LibPARI.Gen, x2::LibPARI.Gen, x3::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:ellmul, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                reinterpret(Int, Ptr{Int}(x3.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"ellneg(E,z): opposite of the point z on elliptic curve E."
function ellneg(x1::LibPARI.Gen, x2::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:ellneg, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"ellnonsingularmultiple(E,P): given E/Q and P in E(Q), returns the pair\n[R,n] where n is the least positive integer such that R = [n]P has\neverywhere good reduction. More precisely, its image in a minimal model\nis everywhere nonsingular."
function ellnonsingularmultiple(x1::LibPARI.Gen, x2::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:ellnonsingularmultiple, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"ellorder(E,z,{o}): order of the point z on the elliptic curve E over\na number field or a finite field, 0 if nontorsion. The parameter o,\nif present, represents a nonzero multiple of the order of z."
function ellorder(x1::LibPARI.Gen, x2::LibPARI.Gen; x3 = nothing)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:ellorder, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                reinterpret(Int, Ptr{Int}((x3 === nothing ? C_NULL : x3.ptr))),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"ellordinate(E,x): y-coordinates corresponding to x-ordinate x on\nelliptic curve E."
function ellordinate(x1::LibPARI.Gen, x2::LibPARI.Gen; prec::Integer = 4)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:ellordinate, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                prec,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"ellpadicbsd(E,p,n,{D=1}): returns [r,Lp] where\nr is the (conjectural) analytic rank of the p-adic L-function attached\nto the quadratic twist E_D and Lp is (conjecturally) equal\nto the product of the p-adic regulator and the cardinal of the\nTate-Shafarevich group."
function ellpadicbsd(
    x1::LibPARI.Gen,
    x2::LibPARI.Gen,
    x3::Integer;
    x4 = nothing,
)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:ellpadicbsd, LibPARI.PARI_jll.libpari)),
                4,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(x3),
                reinterpret(Int, Ptr{Int}((x4 === nothing ? C_NULL : x4.ptr))),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"ellpadicfrobenius(E,p,n): matrix of the Frobenius at p>2 in the standard\nbasis of H^1_dR(E) to absolute p-adic precision p^n."
function ellpadicfrobenius(x1::LibPARI.Gen, x2::Integer, x3::Integer)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:ellpadicfrobenius, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, UInt(x2)),
                Int(x3),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"ellpadicheight(E,p,n,P,{Q}): E elliptic curve/Q, P in E(Q),\np prime, n an integer; returns the cyclotomic p-adic heights of P.\nResp. the value of the attached bilinear form at (P,Q)."
function ellpadicheight0(
    x1::LibPARI.Gen,
    x2::LibPARI.Gen,
    x3::Integer,
    x4::LibPARI.Gen;
    x5 = nothing,
)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:ellpadicheight0, LibPARI.PARI_jll.libpari)),
                5,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(x3),
                reinterpret(Int, Ptr{Int}(x4.ptr)),
                reinterpret(Int, Ptr{Int}((x5 === nothing ? C_NULL : x5.ptr))),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"ellpadicheightmatrix(E,p,n,Q): gives the height-pairing matrix for vector\nof points Q on elliptic curve E."
function ellpadicheightmatrix(
    x1::LibPARI.Gen,
    x2::LibPARI.Gen,
    x3::Integer,
    x4::LibPARI.Gen,
)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:ellpadicheightmatrix, LibPARI.PARI_jll.libpari)),
                4,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(x3),
                reinterpret(Int, Ptr{Int}(x4.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"ellpadiclambdamu(E,p,{D=1},{i=0}): returns the Iwasawa invariants for\nthe p-adic L-function attached to E, twisted by (D,.) and the i-th power\nof the Teichmuller character."
function ellpadiclambdamu(
    x1::LibPARI.Gen,
    x2::Integer;
    x3::Integer = 1,
    x4::Integer = 0,
)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:ellpadiclambdamu, LibPARI.PARI_jll.libpari)),
                4,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(x2),
                Int(x3),
                Int(x4),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"ellpadiclog(E,p,n,P): returns the logarithm of P (in the kernel of\nreduction) to relative p-adic precision p^n."
function ellpadiclog(
    x1::LibPARI.Gen,
    x2::LibPARI.Gen,
    x3::Integer,
    x4::LibPARI.Gen,
)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:ellpadiclog, LibPARI.PARI_jll.libpari)),
                4,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(x3),
                reinterpret(Int, Ptr{Int}(x4.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"ellpadicregulator(E,p,n,S): E elliptic curve/Q, S a vector of\npoints in E(Q), p prime, n an integer; returns the p-adic\ncyclotomic regulator of the points of S at precision p^n."
function ellpadicregulator(
    x1::LibPARI.Gen,
    x2::LibPARI.Gen,
    x3::Integer,
    x4::LibPARI.Gen,
)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:ellpadicregulator, LibPARI.PARI_jll.libpari)),
                4,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(x3),
                reinterpret(Int, Ptr{Int}(x4.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"ellpadics2(E,p,n): returns s2 to absolute p-adic precision p^n."
function ellpadics2(x1::LibPARI.Gen, x2::LibPARI.Gen, x3::Integer)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:ellpadics2, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(x3),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"ellperiods(w,{flag=0}): w describes a complex period lattice ([w1,w2]\nor an ellinit structure). Returns normalized periods [W1,W2] generating the\nsame lattice such that tau := W1/W2 satisfies Im(tau) > 0 and lies in the\nstandard fundamental domain for SL2. If flag is 1, the return value is\n[[W1,W2], [e1,e2]], where e1, e2 are the quasi-periods attached to\n[W1,W2], satisfying e2 W1 - e1 W2 = 2 Pi I."
function ellperiods(x1::LibPARI.Gen; x2::Integer = 0, prec::Integer = 4)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:ellperiods, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(x2),
                prec,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"ellpointtoz(E,P): lattice point z corresponding to the point P on the\nelliptic curve E."
function zell(x1::LibPARI.Gen, x2::LibPARI.Gen; prec::Integer = 4)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:zell, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                prec,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"ellrank(E,{effort=0},{points}): if E is an elliptic curve over Q,\nattempts to compute the Mordell-Weil group attached to the curve.\nThe output is [r1,r2,s,L], where r1 <= rank(E) <= r2, s gives information\non the Tate-Shafarevich group (see documentation), and and L is a list of\nindependent, non-torsion rational points on the curve. E can also be given as\nthe output of ellrankinit(E)."
function ellrank(
    x1::LibPARI.Gen;
    x2::Integer = 0,
    x3 = nothing,
    prec::Integer = 4,
)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:ellrank, LibPARI.PARI_jll.libpari)),
                4,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(x2),
                reinterpret(Int, Ptr{Int}((x3 === nothing ? C_NULL : x3.ptr))),
                prec,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"ellrankinit(E): if E is an elliptic curve over Q,\ninitialize data for further calls to ellrank."
function ellrankinit(x1::LibPARI.Gen; prec::Integer = 4)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:ellrankinit, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                prec,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"ellratpoints(E,h,{flag=0}): E being an rational model of an\nelliptic curve, return a vector containing the affine rational points on the curve\nof naive height less than h.\nIf fl=1, stop as soon as a point is found."
function ellratpoints(x1::LibPARI.Gen, x2::LibPARI.Gen; x3::Integer = 0)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:ellratpoints, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(x3),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"ellrootno(E,{p}): root number for the L-function of the elliptic\ncurve E/Q at a prime p (including 0, for the infinite place); global root\nnumber if p is omitted. If p is omitted, the curve can also be defined over\na number field."
function ellrootno(x1::LibPARI.Gen; x2 = nothing)
    return LibPARI.protected_call() do
        Int(
            LibPARI._trap_call(
                Int,
                cglobal((:ellrootno, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}((x2 === nothing ? C_NULL : x2.ptr))),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            ),
        )
    end
end

"ellsaturation(E,V,B): let E be an elliptic curve over Q\nand V be a vector of independent rational points on E of infinite order that\ngenerate a subgroup G of E(Q) of finite index.\nReturn a new set W of the same length that generate a subgroup H of\nE(Q) containing G and such that [E(Q):H] is not divisible by any prime\nnumber less than B."
function ellsaturation(
    x1::LibPARI.Gen,
    x2::LibPARI.Gen,
    x3::Integer;
    prec::Integer = 4,
)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:ellsaturation, LibPARI.PARI_jll.libpari)),
                4,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(x3),
                prec,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"ellsea(E,{tors=0}): computes the order of the group E(Fq)\nfor the elliptic curve E, defined over a finite field,\nusing SEA algorithm, with early abort for curves (or their quadratic\ntwist) with nonprime order."
function ellsea(x1::LibPARI.Gen; x2::Integer = 0)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:ellsea, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(x2),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"ellsearch(N): returns all curves in the elldata database matching\nconstraint N:  given name (N = \"11a1\" or [11,0,1]),\ngiven isogeny class (N = \"11a\" or [11,0]), or\ngiven conductor (N = 11, \"11\", or [11])."
function ellsearch(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:ellsearch, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"ellsub(E,z1,z2): difference of the points z1 and z2 on elliptic curve E."
function ellsub(x1::LibPARI.Gen, x2::LibPARI.Gen, x3::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:ellsub, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                reinterpret(Int, Ptr{Int}(x3.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"ellsupersingularj(p): return a random supersingular j-invariant defined\nover F_p^2 if p is prime number, over the (finite) field of definition of p\notherwise"
function ellsupersingularj(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:ellsupersingularj, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"elltamagawa(E): E being an elliptic curve over a number field,\nreturns the global Tamagawa number of the curve."
function elltamagawa(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:elltamagawa, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"elltaniyama(E,{n=seriesprecision}): modular parametrization of\nelliptic curve E/Q."
function elltaniyama(x1::LibPARI.Gen; seriesprec::Integer = 16)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:elltaniyama, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                seriesprec,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"elltatepairing(E,P,Q,m): computes the Tate pairing of the two points\nP and Q on the elliptic curve E. The point P must be of m-torsion."
function elltatepairing(
    x1::LibPARI.Gen,
    x2::LibPARI.Gen,
    x3::LibPARI.Gen,
    x4::LibPARI.Gen,
)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:elltatepairing, LibPARI.PARI_jll.libpari)),
                4,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                reinterpret(Int, Ptr{Int}(x3.ptr)),
                reinterpret(Int, Ptr{Int}(x4.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"elltors(E): torsion subgroup of elliptic curve E: order, structure,\ngenerators."
function elltors(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:elltors, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"elltrace(E,P): sum of the Galois conjugates of the point P on elliptic\ncurve E."
function elltrace(x1::LibPARI.Gen, x2::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:elltrace, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"elltwist(E,{P}): returns an ell structure for the twist of the elliptic\ncurve E by the quadratic extension defined by P (when P is a polynomial of\ndegree 2) or quadpoly(P) (when P is an integer). If E is defined over a\nfinite field, then P can be omitted."
function elltwist(x1::LibPARI.Gen; x2 = nothing)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:elltwist, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}((x2 === nothing ? C_NULL : x2.ptr))),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"ellweilcurve(E,{&ms}): let E be an elliptic curve over Q given by\nellinit or a rational isogeny class given by ellisomat. Return a list\nof isomorphism classes of elliptic curves isogenous to E as given by ellisomat\nand the list of the Smith invariants of the lattice associated to E in\nH^1(E,Q) in the lattice associated to the modular form. If ms is present,\nit contains the output of msfromell(Emin,0) where Emin is the list of minimal\nmodels attached to the curves in the isogeny class."
function ellweilcurve(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        out1 = Ref{Ptr{Int}}(C_NULL)
        av = LibPARI._avma()
        r = LibPARI._trap_call(
            Ptr{Int},
            cglobal((:ellweilcurve, LibPARI.PARI_jll.libpari)),
            2,
            reinterpret(Int, Ptr{Int}(x1.ptr)),
            reinterpret(Int, Base.unsafe_convert(Ptr{Ptr{Int}}, out1)),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
        )
        primary = LibPARI.Gen(r)
        o1 = LibPARI.Gen(out1[])
        LibPARI._set_avma(av)
        return (primary, o1)
    end
end

"ellweilpairing(E,P,Q,m): computes the Weil pairing of the two points\nof m-torsion P and Q on the elliptic curve E."
function ellweilpairing(
    x1::LibPARI.Gen,
    x2::LibPARI.Gen,
    x3::LibPARI.Gen,
    x4::LibPARI.Gen,
)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:ellweilpairing, LibPARI.PARI_jll.libpari)),
                4,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                reinterpret(Int, Ptr{Int}(x3.ptr)),
                reinterpret(Int, Ptr{Int}(x4.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"ellxn(E,n,{v='x}): return polynomials [A,B] in the variable v such that\nx([n]P) = (A/B)(t) for any P = [t,u] on E outside of n-torsion."
function ellxn(x1::LibPARI.Gen, x2::Integer; x3::Integer = -1)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:ellxn, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(x2),
                Int(x3),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"ellzeta(w,{z='x}): computes the value at z of the Weierstrass Zeta\nfunction attached to the lattice w, as given by ellperiods(,1)."
function ellzeta(x1::LibPARI.Gen; x2 = nothing, prec::Integer = 4)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:ellzeta, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}((x2 === nothing ? C_NULL : x2.ptr))),
                prec,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"ellztopoint(E,z): inverse of ellpointtoz. Returns the coordinates of\npoint P on the curve E corresponding to a complex or p-adic z."
function pointell(x1::LibPARI.Gen, x2::LibPARI.Gen; prec::Integer = 4)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:pointell, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                prec,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"erfc(x): complementary error function."
function gerfc(x1::LibPARI.Gen; prec::Integer = 4)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:gerfc, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                prec,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"errname(E): returns the type of the error message E."
function errname(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:errname, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"eta(z,{flag=0}): if flag=0, returns prod(n=1,oo, 1-q^n), where\nq = exp(2 i Pi z) if z is a complex scalar (belonging to the upper half plane);\nq = z if z is a p-adic number or can be converted to a power series.\nIf flag is nonzero, the function only applies to complex scalars and returns\nthe true eta function, with the factor q^(1/24) included."
function eta0(x1::LibPARI.Gen; x2::Integer = 0, prec::Integer = 4)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:eta0, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(x2),
                prec,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"eulerfrac(n): Euler number E_n, as a rational number."
function eulerfrac(x1::Integer)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:eulerfrac, LibPARI.PARI_jll.libpari)),
                1,
                Int(x1),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"eulerianpol(n,{v='x}): Eulerian polynomial A_n, in variable v."
function eulerianpol(x1::Integer; x2::Integer = -1)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:eulerianpol, LibPARI.PARI_jll.libpari)),
                2,
                Int(x1),
                Int(x2),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"eulerphi(x): Euler's totient function of x."
function eulerphi(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:eulerphi, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"eulerpol(n,{v='x}): Euler polynomial E_n, in variable v."
function eulerpol(x1::Integer; x2::Integer = -1)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:eulerpol, LibPARI.PARI_jll.libpari)),
                2,
                Int(x1),
                Int(x2),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"eulerreal(n): Euler number E_n, as a real number."
function eulerreal(x1::Integer; prec::Integer = 4)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:eulerreal, LibPARI.PARI_jll.libpari)),
                2,
                Int(x1),
                prec,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"eulervec(n): returns a vector containing\nthe nonzero Euler numbers E_0, E_2, ..., E_{2n}."
function eulervec(x1::Integer)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:eulervec, LibPARI.PARI_jll.libpari)),
                1,
                Int(x1),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"exp(x): exponential of x."
function gexp(x1::LibPARI.Gen; prec::Integer = 4)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:gexp, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                prec,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"expm1(x): exp(x)-1."
function gexpm1(x1::LibPARI.Gen; prec::Integer = 4)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:gexpm1, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                prec,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"exponent(x): binary exponent of x"
function gpexponent(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:gpexponent, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"exportall(): declare all current dynamic variables as exported variables."
function exportall()
    LibPARI.protected_call() do
        LibPARI._trap_call(
            Cvoid,
            cglobal((:exportall, LibPARI.PARI_jll.libpari)),
            0,
            Int(0),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
        )
    end
    return nothing
end

"extern(str): execute shell command str, and feeds the result to GP (as\nif loading from file)."
function gpextern(x1::AbstractString)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            let _cs1 = Base.cconvert(Cstring, x1)
                GC.@preserve _cs1 LibPARI._trap_call(
                    Ptr{Int},
                    cglobal((:gpextern, LibPARI.PARI_jll.libpari)),
                    1,
                    reinterpret(Int, Base.unsafe_convert(Cstring, _cs1)),
                    Int(0),
                    Int(0),
                    Int(0),
                    Int(0),
                    Int(0),
                    Int(0),
                    Int(0),
                )
            end
        end
    end
end

"externstr(str): execute shell command str, and returns the result as a\nvector of GP strings, one component per output line."
function externstr(x1::AbstractString)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            let _cs1 = Base.cconvert(Cstring, x1)
                GC.@preserve _cs1 LibPARI._trap_call(
                    Ptr{Int},
                    cglobal((:externstr, LibPARI.PARI_jll.libpari)),
                    1,
                    reinterpret(Int, Base.unsafe_convert(Cstring, _cs1)),
                    Int(0),
                    Int(0),
                    Int(0),
                    Int(0),
                    Int(0),
                    Int(0),
                    Int(0),
                )
            end
        end
    end
end

"factor(x,{D}): factorization of x over domain D. If x and D are both\nintegers, return partial factorization, using primes < D."
function factor0(x1::LibPARI.Gen; x2 = nothing)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:factor0, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}((x2 === nothing ? C_NULL : x2.ptr))),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"factorback(f,{e}): given a factorization f, gives the factored\nobject back. If e is present, f has to be a vector of the same length, and\nwe return the product of the f[i]^e[i]."
function factorback2(x1::LibPARI.Gen; x2 = nothing)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:factorback2, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}((x2 === nothing ? C_NULL : x2.ptr))),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"factorcantor(x,p): this function is obsolete, use factormod."
function factmod(x1::LibPARI.Gen, x2::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:factmod, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"factorff(x,{p},{a}): obsolete, use factormod."
function factorff(x1::LibPARI.Gen; x2 = nothing, x3 = nothing)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:factorff, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}((x2 === nothing ? C_NULL : x2.ptr))),
                reinterpret(Int, Ptr{Int}((x3 === nothing ? C_NULL : x3.ptr))),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"factorial(x): factorial of x, the result being given as a real number."
function mpfactr(x1::Integer; prec::Integer = 4)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:mpfactr, LibPARI.PARI_jll.libpari)),
                2,
                Int(x1),
                prec,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"factorint(x,{flag=0}): factor the integer x. flag is optional, whose\nbinary digits mean 1: avoid MPQS, 2: avoid first-stage ECM (may fall back on\nit later), 4: avoid Pollard-Brent Rho and Shanks SQUFOF, 8: skip final ECM\n(huge composites will be declared prime)."
function factorint(x1::LibPARI.Gen; x2::Integer = 0)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:factorint, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(x2),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"factormodDDF(f,{D}): distinct-degree factorization of the\nsquarefree polynomial f over the finite field defined by the domain D."
function factormodDDF(x1::LibPARI.Gen; x2 = nothing)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:factormodDDF, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}((x2 === nothing ? C_NULL : x2.ptr))),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"factormodSQF(f,{D}): squarefree factorization of the polynomial f over\nthe finite field defined by the domain D."
function factormodSQF(x1::LibPARI.Gen; x2 = nothing)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:factormodSQF, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}((x2 === nothing ? C_NULL : x2.ptr))),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"factormodcyclo(n,p,{single=0},{v='x}): factor n-th\ncyclotomic polynomial mod p."
function factormodcyclo(
    x1::Integer,
    x2::LibPARI.Gen;
    x3::Integer = 0,
    x4::Integer = -1,
)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:factormodcyclo, LibPARI.PARI_jll.libpari)),
                4,
                Int(x1),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(x3),
                Int(x4),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"factornf(x,t): this function is obsolete, use nffactor."
function polfnf(x1::LibPARI.Gen, x2::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:polfnf, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"factorpadic(pol,p,r): p-adic factorization of the polynomial pol\nto precision r."
function factorpadic(x1::LibPARI.Gen, x2::LibPARI.Gen, x3::Integer)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:factorpadic, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(x3),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"ffcompomap(f,g): Let k, l, m be three finite fields and f a (partial) map\nfrom l to m and g a partial map from k to l, return the (partial) map f o g\nfrom k to m."
function ffcompomap(x1::LibPARI.Gen, x2::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:ffcompomap, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"ffembed(a,b): given two elements a and b in finite fields, return a map\nembedding the definition field of a to the definition field of b."
function ffembed(x1::LibPARI.Gen, x2::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:ffembed, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"ffextend(a,P,{v}):\nextend the field K of definition of a by a root of the polynomial P, assumed\nto be irreducible over K.  Return [r, m] where r is a root of P in the\nextension field L and m is a map from K to L, see \\kbd{ffmap}. If v is given,\nthe variable name is used to display the generator of L, else the name of the\nvariable of P is used."
function ffextend(x1::LibPARI.Gen, x2::LibPARI.Gen; x3::Integer = -1)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:ffextend, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(x3),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"fffrobenius(m,{n=1}): return the n-th power of the Frobenius map over\nthe field of definition of m."
function fffrobenius(x1::LibPARI.Gen; x2::Integer = 1)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:fffrobenius, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(x2),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"ffgen(k,{v = 'x}): return a generator of the finite field k\n(not necessarily a generator of its multiplicative group) as a t_FFELT.\nk can be given by its order q, the pair [p,f] with q=p^f, by an irreducible\npolynomial with t_INTMOD coefficients, or by a finite field element.\nIf v is given, the variable name is used to display g, else the variable of\nthe polynomial or finite field element, or x if only the order was given."
function ffgen(x1::LibPARI.Gen; x2::Integer = -1)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:ffgen, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(x2),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"ffinit(p,n,{v='x}): monic irreducible polynomial of degree n in F_p[v]."
function ffinit(x1::LibPARI.Gen, x2::Integer; x3::Integer = -1)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:ffinit, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(x2),
                Int(x3),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"ffinvmap(m): given a map m between finite fields, return a partial map\nthat return the pre-images by the map m."
function ffinvmap(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:ffinvmap, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"fflog(x,g,{o}): return the discrete logarithm of the finite field\nelement x in base g. If present, o must represent the multiplicative\norder of g. If no o is given, assume that g is a primitive root."
function fflog(x1::LibPARI.Gen, x2::LibPARI.Gen; x3 = nothing)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:fflog, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                reinterpret(Int, Ptr{Int}((x3 === nothing ? C_NULL : x3.ptr))),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"ffmap(m,x): given a (partial) map m between two finite fields,\nreturn the image of x by m. The function is applied recursively to the\ncomponent of vectors, matrices and polynomials. If m is a partial map that\nis not defined at x, return []"
function ffmap(x1::LibPARI.Gen, x2::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:ffmap, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"ffmaprel(m,x): given a (partial) map m between two finite fields,\nexpress x as an algebraic element over the codomain of m in a way which\nis compatible with m.\nThe function is applied recursively to the component of vectors, matrices and\npolynomials."
function ffmaprel(x1::LibPARI.Gen, x2::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:ffmaprel, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"ffnbirred(q,n,{flag=0}): number of monic irreducible polynomials over F_q,\nof degree n (flag=0, default) or at most n (flag=1)."
function ffnbirred0(x1::LibPARI.Gen, x2::Integer; x3::Integer = 0)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:ffnbirred0, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(x2),
                Int(x3),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"fforder(x,{o}): multiplicative order of the finite field element x.\nOptional o represents a multiple of the order of the element."
function fforder(x1::LibPARI.Gen; x2 = nothing)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:fforder, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}((x2 === nothing ? C_NULL : x2.ptr))),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"ffprimroot(x,{&o}): return a primitive root of the multiplicative group\nof the definition field of the finite field element x (not necessarily the\nsame as the field generated by x). If present, o is set to [ord, fa], where\nord is the order of the group, and fa its factorization\n(useful in fflog and fforder)."
function ffprimroot(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        out1 = Ref{Ptr{Int}}(C_NULL)
        av = LibPARI._avma()
        r = LibPARI._trap_call(
            Ptr{Int},
            cglobal((:ffprimroot, LibPARI.PARI_jll.libpari)),
            2,
            reinterpret(Int, Ptr{Int}(x1.ptr)),
            reinterpret(Int, Base.unsafe_convert(Ptr{Ptr{Int}}, out1)),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
        )
        primary = LibPARI.Gen(r)
        o1 = LibPARI.Gen(out1[])
        LibPARI._set_avma(av)
        return (primary, o1)
    end
end

"fft(w,P): given w from rootsof1, return the discrete Fourier transform\nof P."
function FFT(x1::LibPARI.Gen, x2::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:FFT, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"fftinv(w,P): given w from rootsof1, return the inverse Fourier transform\nof P."
function FFTinv(x1::LibPARI.Gen, x2::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:FFTinv, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"fibonacci(x): Fibonacci number of index x."
function fibo(x1::Integer)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:fibo, LibPARI.PARI_jll.libpari)),
                1,
                Int(x1),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"fileclose(n): close the file descriptor n."
function gp_fileclose(x1::Integer)
    LibPARI.protected_call() do
        LibPARI._trap_call(
            Cvoid,
            cglobal((:gp_fileclose, LibPARI.PARI_jll.libpari)),
            1,
            Int(x1),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
        )
    end
    return nothing
end

"fileextern(str): execute shell command str and returns a file\ndescriptor attached to the command output as if it were read from a file."
function gp_fileextern(x1::AbstractString)
    return LibPARI.protected_call() do
        Int(
            let _cs1 = Base.cconvert(Cstring, x1)
                GC.@preserve _cs1 LibPARI._trap_call(
                    Int,
                    cglobal((:gp_fileextern, LibPARI.PARI_jll.libpari)),
                    1,
                    reinterpret(Int, Base.unsafe_convert(Cstring, _cs1)),
                    Int(0),
                    Int(0),
                    Int(0),
                    Int(0),
                    Int(0),
                    Int(0),
                    Int(0),
                )
            end,
        )
    end
end

"fileflush({n}): flush the file descriptor n (all descriptors to output\nstreams if n is omitted)."
function gp_fileflush0(; x1 = nothing)
    LibPARI.protected_call() do
        LibPARI._trap_call(
            Cvoid,
            cglobal((:gp_fileflush0, LibPARI.PARI_jll.libpari)),
            1,
            reinterpret(Int, Ptr{Int}((x1 === nothing ? C_NULL : x1.ptr))),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
        )
    end
    return nothing
end

"fileopen(path,mode): open the file pointed to by 'path' and return a\nfile descriptor which can be used with other file functions.\nThe mode is \"r\" (default, read), \"w\" (write, truncate), \"a\" (write, append)."
function gp_fileopen(x1::AbstractString; x2::AbstractString = "r")
    return LibPARI.protected_call() do
        Int(
            let _cs1 = Base.cconvert(Cstring, x1),
                _cs2 = Base.cconvert(Cstring, x2)

                GC.@preserve _cs1 _cs2 LibPARI._trap_call(
                    Int,
                    cglobal((:gp_fileopen, LibPARI.PARI_jll.libpari)),
                    2,
                    reinterpret(Int, Base.unsafe_convert(Cstring, _cs1)),
                    reinterpret(Int, Base.unsafe_convert(Cstring, _cs2)),
                    Int(0),
                    Int(0),
                    Int(0),
                    Int(0),
                    Int(0),
                    Int(0),
                )
            end,
        )
    end
end

"fileread(n): read a logical line from the file attached to the\ndescriptor n, opened for reading with fileopen. Return 0 at end of file."
function gp_fileread(x1::Integer)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:gp_fileread, LibPARI.PARI_jll.libpari)),
                1,
                Int(x1),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"filereadstr(n): read a raw line from the file attached to the\ndescriptor n, opened for reading with fileopen. Discard the terminating\nnewline.  Return 0 at end of file."
function gp_filereadstr(x1::Integer)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:gp_filereadstr, LibPARI.PARI_jll.libpari)),
                1,
                Int(x1),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"filewrite(n,s): write the string s to file attached to descriptor n,\nending with a newline. The file must have been opened with fileopen in\n\"w\" or \"a\" mode."
function gp_filewrite(x1::Integer, x2::AbstractString)
    LibPARI.protected_call() do
        let _cs1 = Base.cconvert(Cstring, x2)
            GC.@preserve _cs1 LibPARI._trap_call(
                Cvoid,
                cglobal((:gp_filewrite, LibPARI.PARI_jll.libpari)),
                2,
                Int(x1),
                reinterpret(Int, Base.unsafe_convert(Cstring, _cs1)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
    return nothing
end

"filewrite1(n,s): write the string s to file number n without ending with newline."
function gp_filewrite1(x1::Integer, x2::AbstractString)
    LibPARI.protected_call() do
        let _cs1 = Base.cconvert(Cstring, x2)
            GC.@preserve _cs1 LibPARI._trap_call(
                Cvoid,
                cglobal((:gp_filewrite1, LibPARI.PARI_jll.libpari)),
                2,
                Int(x1),
                reinterpret(Int, Base.unsafe_convert(Cstring, _cs1)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
    return nothing
end

"floor(x): floor of x = largest integer <= x."
function gfloor(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:gfloor, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"fold(f,A): return f(...f(f(A[1],A[2]),A[3]),...,A[#A])."
function fold0(x1::LibPARI.Gen, x2::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:fold0, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"frac(x): fractional part of x = x-floor(x)."
function gfrac(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:gfrac, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"fromdigits(x,{b=10}): gives the integer formed by the elements of x seen\nas the digits of a number in base b."
function fromdigits(x1::LibPARI.Gen; x2 = nothing)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:fromdigits, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}((x2 === nothing ? C_NULL : x2.ptr))),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"galoischardet(gal,chi,{o=1}): return the determinant character of the\ncharacter chi."
function galoischardet(x1::LibPARI.Gen, x2::LibPARI.Gen; x3::Integer = 1)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:galoischardet, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(x3),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"galoischarpoly(gal,chi,{o=1}): return the list of characteristic\npolynomials of the representation attached to the character chi."
function galoischarpoly(x1::LibPARI.Gen, x2::LibPARI.Gen; x3::Integer = 1)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:galoischarpoly, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(x3),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"galoischartable(gal): return the character table of the underlying\ngroup of gal."
function galoischartable(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:galoischartable, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"galoisconjclasses(gal): gal being output by galoisinit,\nreturn the list of conjugacy classes."
function galoisconjclasses(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:galoisconjclasses, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"galoisexport(gal,{flag}): gal being a Galois group as output by\ngaloisinit, output a string representing the underlying permutation group in\nGAP notation (default) or Magma notation (flag = 1)."
function galoisexport(x1::LibPARI.Gen; x2::Integer = 0)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:galoisexport, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(x2),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"galoisfixedfield(gal,perm,{flag},{v=y}): gal being a Galois group as\noutput by galoisinit and perm a subgroup, an element of gal.group or a vector\nof such elements, return [P,x] such that P is a polynomial defining the fixed\nfield of gal[1] by the subgroup generated by perm, and x is a root of P in gal\nexpressed as a polmod in gal.pol. If flag is 1 return only P. If flag is 2\nreturn [P,x,F] where F is the factorization of gal.pol over the field\ndefined by P, where the variable v stands for a root of P."
function galoisfixedfield(
    x1::LibPARI.Gen,
    x2::LibPARI.Gen;
    x3::Integer = 0,
    x4::Integer = -1,
)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:galoisfixedfield, LibPARI.PARI_jll.libpari)),
                4,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(x3),
                Int(x4),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"galoisgetgroup(a,{b}): query the galpol package for a group of order a\nwith index b in the GAP4 Small Group library. If b is omitted, return the\nnumber of isomorphism classes of groups of order a."
function galoisgetgroup(x1::Integer; x2::Integer = 0)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:galoisgetgroup, LibPARI.PARI_jll.libpari)),
                2,
                Int(x1),
                Int(x2),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"galoisgetname(a,b): query the galpol package for a string describing the\ngroup of order a with index b in the GAP4 Small Group library."
function galoisgetname(x1::Integer, x2::Integer)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:galoisgetname, LibPARI.PARI_jll.libpari)),
                2,
                Int(x1),
                Int(x2),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"galoisgetpol(a,{b},{s}): query the galpol package for a polynomial with\nGalois group isomorphic to GAP4(a,b), totally real if s=1 (default) and\ntotally complex if s=2.  The output is a vector [pol, den] where pol is the\npolynomial and den is the common denominator of the conjugates expressed\nas a polynomial in a root of pol. If b and s are omitted, return the number of\nisomorphism classes of groups of order a."
function galoisgetpol(x1::Integer; x2::Integer = 0, x3::Integer = 1)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:galoisgetpol, LibPARI.PARI_jll.libpari)),
                3,
                Int(x1),
                Int(x2),
                Int(x3),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"galoisidentify(gal): gal being a Galois group as output by galoisinit,\noutput the isomorphism class of the underlying abstract group as a\ntwo-components vector [o,i], where o is the group order, and i is the group\nindex in the GAP4 small group library."
function galoisidentify(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:galoisidentify, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"galoisinit(pol,{den}): pol being a polynomial or a number field as\noutput by nfinit defining a Galois extension of Q, compute the Galois group\nand all necessary information for computing fixed fields. den is optional\nand has the same meaning as in nfgaloisconj(,4)(see manual)."
function galoisinit(x1::LibPARI.Gen; x2 = nothing)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:galoisinit, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}((x2 === nothing ? C_NULL : x2.ptr))),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"galoisisabelian(gal,{flag=0}): gal being as output by galoisinit,\nreturn 0 if gal is not abelian, the HNF matrix of gal over gal.gen if\nflag=0, 1 if flag is 1, and the SNF matrix of gal if flag=2."
function galoisisabelian(x1::LibPARI.Gen; x2::Integer = 0)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:galoisisabelian, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(x2),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"galoisisnormal(gal,subgrp): gal being as output by galoisinit,\nand subgrp a subgroup of gal as output by galoissubgroups,\nreturn 1 if subgrp is a normal subgroup of gal, else return 0."
function galoisisnormal(x1::LibPARI.Gen, x2::LibPARI.Gen)
    return LibPARI.protected_call() do
        Int(
            LibPARI._trap_call(
                Int,
                cglobal((:galoisisnormal, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            ),
        )
    end
end

"galoispermtopol(gal,perm): gal being a Galois group as output by\ngaloisinit and perm a element of gal.group, return the polynomial defining\nthe corresponding Galois automorphism."
function galoispermtopol(x1::LibPARI.Gen, x2::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:galoispermtopol, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"galoissplittinginit(P,{d}): Galois group over Q of the splitting field of\nP, for P integral, monic and irreducible or given by a nf structure. If d is given, it must be a multiple of the splitting field degree. The output is compatible with functions expecting a galoisinit structure."
function galoissplittinginit(x1::LibPARI.Gen; x2 = nothing)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:galoissplittinginit, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}((x2 === nothing ? C_NULL : x2.ptr))),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"galoissubfields(G,{flag=0},{v}): output all the subfields of G; flag\nhas the same meaning as for galoisfixedfield."
function galoissubfields(x1::LibPARI.Gen; x2::Integer = 0, x3::Integer = -1)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:galoissubfields, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(x2),
                Int(x3),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"galoissubgroups(G): output all the subgroups of G."
function galoissubgroups(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:galoissubgroups, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"gamma(s): gamma function at s, a complex or p-adic number, or a series."
function ggamma(x1::LibPARI.Gen; prec::Integer = 4)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:ggamma, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                prec,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"gammah(x): gamma of x+1/2 (x integer)."
function ggammah(x1::LibPARI.Gen; prec::Integer = 4)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:ggammah, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                prec,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"gammamellininv(G,t,{m=0}): returns G(t), where G is as output\nby gammamellininvinit (its m-th derivative if m is present)."
function gammamellininv(
    x1::LibPARI.Gen,
    x2::LibPARI.Gen;
    x3::Integer = 0,
    bitprec::Integer = 128,
)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:gammamellininv, LibPARI.PARI_jll.libpari)),
                4,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(x3),
                bitprec,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"gammamellininvinit(A,{m=0}): initialize data for the computation by\ngammamellininv() of the m-th derivative of the inverse Mellin transform\nof the function f(s) = Gamma_R(s+a1)*...*Gamma_R(s+ad), where\nA is the vector [a1,...,ad] and Gamma_R(s) = Pi^(-s/2)*gamma(s/2)."
function gammamellininvinit(
    x1::LibPARI.Gen;
    x2::Integer = 0,
    bitprec::Integer = 128,
)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:gammamellininvinit, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(x2),
                bitprec,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"gcd(x,{y}): greatest common divisor of x and y."
function ggcd0(x1::LibPARI.Gen; x2 = nothing)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:ggcd0, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}((x2 === nothing ? C_NULL : x2.ptr))),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"gcharalgebraic(gc,{type}): returns a matrix whose columns form a basis of\nthe algebraic Grossencharacters in gc. If type is specified as a vector of\ninteger exponents [p,q] for each complex place, returns a vector containing\nan algebraic character of that infinity type (or the empty vector if such a\ncharacter does not exist)."
function gcharalgebraic(x1::LibPARI.Gen; x2 = nothing)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:gcharalgebraic, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}((x2 === nothing ? C_NULL : x2.ptr))),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"gcharconductor(gc,chi): returns the conductor of chi, as a modulus over gc.bnf."
function gchar_conductor(x1::LibPARI.Gen, x2::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:gchar_conductor, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"gcharduallog(gc,chi): returns logarithm vector of character chi\nin R^n.\nWe have gchareval(gc,chi,x,0) = gcharduallog(gc,chi)*gcharlog(gc,x) in R/Z."
function gcharduallog(x1::LibPARI.Gen, x2::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:gcharduallog, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"gchareval(gc,chi,x,{flag=1}): computes the evaluation chi(x) in C* if\nflag=1 and in C/Z if flag=0."
function gchareval(
    x1::LibPARI.Gen,
    x2::LibPARI.Gen,
    x3::LibPARI.Gen;
    x4::Integer = 1,
)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:gchareval, LibPARI.PARI_jll.libpari)),
                4,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                reinterpret(Int, Ptr{Int}(x3.ptr)),
                Int(x4),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"gcharidentify(gc,Lv,Lchiv): returns a Grossencharacter chi belonging to gc\nthat approximately satisfies the constraints that chi_v is Lchiv[i] at the\nplace v=Lv[i]."
function gchar_identify(
    x1::LibPARI.Gen,
    x2::LibPARI.Gen,
    x3::LibPARI.Gen;
    prec::Integer = 4,
)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:gchar_identify, LibPARI.PARI_jll.libpari)),
                4,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                reinterpret(Int, Ptr{Int}(x3.ptr)),
                prec,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"gcharinit(bnf,f): given a bnf as output by bnfinit and a modulus f, initializes data\nrelated to the group of Grossencharacters of conductor dividing this modulus."
function gcharinit(x1::LibPARI.Gen, x2::LibPARI.Gen; prec::Integer = 4)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:gcharinit, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                prec,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"gcharisalgebraic(gc,chi,{&type}): returns 1 if chi is an algebraic (type A0)\ncharacter. If type is present, it is set to the infinity type [p,q] of chi."
function gcharisalgebraic(x1::LibPARI.Gen, x2::LibPARI.Gen)
    return LibPARI.protected_call() do
        out1 = Ref{Ptr{Int}}(C_NULL)
        av = LibPARI._avma()
        r = LibPARI._trap_call(
            Cint,
            cglobal((:gcharisalgebraic, LibPARI.PARI_jll.libpari)),
            3,
            reinterpret(Int, Ptr{Int}(x1.ptr)),
            reinterpret(Int, Ptr{Int}(x2.ptr)),
            reinterpret(Int, Base.unsafe_convert(Ptr{Ptr{Int}}, out1)),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
        )
        primary = Int(r)
        o1 = LibPARI.Gen(out1[])
        LibPARI._set_avma(av)
        return (primary, o1)
    end
end

"gcharlocal(gc,chi,v,{&BID}): if v is a place, return the local character\nchi_v. If v is a prime dividing the modulus and the optional argument 'BID'\nis present, set BID to the corresponding idealstar structure."
function gcharlocal(
    x1::LibPARI.Gen,
    x2::LibPARI.Gen,
    x3::LibPARI.Gen;
    prec::Integer = 4,
)
    return LibPARI.protected_call() do
        out1 = Ref{Ptr{Int}}(C_NULL)
        av = LibPARI._avma()
        r = LibPARI._trap_call(
            Ptr{Int},
            cglobal((:gcharlocal, LibPARI.PARI_jll.libpari)),
            5,
            reinterpret(Int, Ptr{Int}(x1.ptr)),
            reinterpret(Int, Ptr{Int}(x2.ptr)),
            reinterpret(Int, Ptr{Int}(x3.ptr)),
            prec,
            reinterpret(Int, Base.unsafe_convert(Ptr{Ptr{Int}}, out1)),
            Int(0),
            Int(0),
            Int(0),
        )
        primary = LibPARI.Gen(r)
        o1 = LibPARI.Gen(out1[])
        LibPARI._set_avma(av)
        return (primary, o1)
    end
end

"gcharlog(gc,x): returns the internal representation (logarithm) of the\nideal x suitable for computations in gc, as a column vector."
function gcharlog(x1::LibPARI.Gen, x2::LibPARI.Gen; prec::Integer = 4)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:gcharlog, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                prec,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"gcharnewprec(gc): given a Grossencharacter group \\kbd{gc}, recomputes\nits invariants to ensure accurate results to current precision."
function gcharnewprec(x1::LibPARI.Gen; prec::Integer = 4)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:gcharnewprec, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                prec,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"genus2igusa(PQ,{k}): let PQ be a polynomial P, resp. a vector [P,Q] of\npolynomials defined over a field F of characteristic != 2. Returns the Igusa\ninvariants of the hyperelliptic curve C/F of genus 2 defined by y^2 = P,\nresp. y^2 + Q*y = P."
function genus2igusa(x1::LibPARI.Gen; x2::Integer = 0)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:genus2igusa, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(x2),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"genus2red(PQ,{p}): let PQ be a polynomial P, resp. a vector [P,Q] of\npolynomials, with rational coefficients.  Determines the reduction at p > 2\nof the (proper, smooth) hyperelliptic curve C/Q of genus 2 defined by\ny^2 = P, resp. y^2 + Q*y = P. More precisely, determines the special fiber X_p\nof the minimal regular model X of C over Z."
function genus2red(x1::LibPARI.Gen; x2 = nothing)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:genus2red, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}((x2 === nothing ? C_NULL : x2.ptr))),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"getabstime(): milliseconds of CPU time since startup."
function getabstime()
    return LibPARI.protected_call() do
        Int(
            LibPARI._trap_call(
                Int,
                cglobal((:getabstime, LibPARI.PARI_jll.libpari)),
                0,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            ),
        )
    end
end

"getcache(): returns information about various auto-growing caches. For\neach resource, we report its name, its size, the number of cache misses\n(since the last extension) and the largest cache miss."
function getcache()
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:getcache, LibPARI.PARI_jll.libpari)),
                0,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"getenv(s): value of the environment variable s, 0 if it is not defined."
function gp_getenv(x1::AbstractString)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            let _cs1 = Base.cconvert(Cstring, x1)
                GC.@preserve _cs1 LibPARI._trap_call(
                    Ptr{Int},
                    cglobal((:gp_getenv, LibPARI.PARI_jll.libpari)),
                    1,
                    reinterpret(Int, Base.unsafe_convert(Cstring, _cs1)),
                    Int(0),
                    Int(0),
                    Int(0),
                    Int(0),
                    Int(0),
                    Int(0),
                    Int(0),
                )
            end
        end
    end
end

"getheap(): 2-component vector giving the current number of objects in\nthe heap and the space they occupy (in long words)."
function getheap()
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:getheap, LibPARI.PARI_jll.libpari)),
                0,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"getlocalbitprec(): returns the current dynamic bit precision."
function getlocalbitprec(; bitprec::Integer = 128)
    return LibPARI.protected_call() do
        Int(
            LibPARI._trap_call(
                Int,
                cglobal((:getlocalbitprec, LibPARI.PARI_jll.libpari)),
                1,
                bitprec,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            ),
        )
    end
end

"getlocalprec(): returns the current dynamic precision, in decimal\ndigits."
function getlocalprec(; prec::Integer = 4)
    return LibPARI.protected_call() do
        Int(
            LibPARI._trap_call(
                Int,
                cglobal((:getlocalprec, LibPARI.PARI_jll.libpari)),
                1,
                prec,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            ),
        )
    end
end

"getrand(): current value of random number seed."
function getrand()
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:getrand, LibPARI.PARI_jll.libpari)),
                0,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"getstack(): current value of stack pointer avma."
function getstack()
    return LibPARI.protected_call() do
        Int(
            LibPARI._trap_call(
                Int,
                cglobal((:getstack, LibPARI.PARI_jll.libpari)),
                0,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            ),
        )
    end
end

"gettime(): milliseconds of CPU time used since the last call to gettime."
function gettime()
    return LibPARI.protected_call() do
        Int(
            LibPARI._trap_call(
                Int,
                cglobal((:gettime, LibPARI.PARI_jll.libpari)),
                0,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            ),
        )
    end
end

"getwalltime(): time (in milliseconds) since the UNIX Epoch."
function getwalltime()
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:getwalltime, LibPARI.PARI_jll.libpari)),
                0,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"halfgcd(x,y): return a vector [M, [a,b]~], where M is an invertible 2x2\nmatrix such that M*[x,y]~ = [a,b]~, where b is small. More precisely,\nif x,y are integers, we have b < sqrt(max(|x|,|y|)) <= a. If x,y\nare polynomials, we have deg b < ceil((max(|x|,|y|))/2) <= deg a."
function ghalfgcd(x1::LibPARI.Gen, x2::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:ghalfgcd, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"hammingweight(x): returns the Hamming weight of x."
function hammingweight(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        Int(
            LibPARI._trap_call(
                Int,
                cglobal((:hammingweight, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            ),
        )
    end
end

"harmonic(n,{r=1}): generalized harmonic number of index n in power r."
function harmonic0(x1::Integer; x2 = nothing)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:harmonic0, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, UInt(x1)),
                reinterpret(Int, Ptr{Int}((x2 === nothing ? C_NULL : x2.ptr))),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"hgmalpha(H): returns the alpha and beta parameters of the hypergeometric\nmotive template H."
function hgmalpha(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:hgmalpha, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"hgmbydegree(n): outputs [L(0),...,L(n-1)] where L(w) is the list of\ncyclotomic parameters of all possible hypergeometric motive templates of\ndegree n and weight w."
function hgmbydegree(x1::Integer)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:hgmbydegree, LibPARI.PARI_jll.libpari)),
                1,
                Int(x1),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"hgmcoef(H,t,n): (H,t) being a hypergeometric motive, returns the\nn-th coefficient of its L-function."
function hgmcoef(x1::LibPARI.Gen, x2::LibPARI.Gen, x3::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:hgmcoef, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                reinterpret(Int, Ptr{Int}(x3.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"hgmcoefs(H,t,n): (H,t) being a hypergeometric motive, returns the\nfirst n coefficients of its L-function, where Euler factors at wild primes\nare set to 1."
function hgmcoefs(x1::LibPARI.Gen, x2::LibPARI.Gen, x3::Integer)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:hgmcoefs, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(x3),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"hgmcyclo(H): returns the cyclotomic parameters (D,E) of the\nhypergeometric motive template H."
function hgmcyclo(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:hgmcyclo, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"hgmeulerfactor(H,t,p,{&e}): (H,t) being a hypergeometric motive,\nreturns the Euler factor P_p at the prime p; if present, set e to the valuation\nof the conductor at p."
function hgmeulerfactor(x1::LibPARI.Gen, x2::LibPARI.Gen, x3::Integer)
    return LibPARI.protected_call() do
        out1 = Ref{Ptr{Int}}(C_NULL)
        av = LibPARI._avma()
        r = LibPARI._trap_call(
            Ptr{Int},
            cglobal((:hgmeulerfactor, LibPARI.PARI_jll.libpari)),
            4,
            reinterpret(Int, Ptr{Int}(x1.ptr)),
            reinterpret(Int, Ptr{Int}(x2.ptr)),
            Int(x3),
            reinterpret(Int, Base.unsafe_convert(Ptr{Ptr{Int}}, out1)),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
        )
        primary = LibPARI.Gen(r)
        o1 = LibPARI.Gen(out1[])
        LibPARI._set_avma(av)
        return (primary, o1)
    end
end

"hgmgamma(H): returns the gamma vector of the hypergeometric motive\ntemplate H."
function hgmgamma(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:hgmgamma, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"hgminit(a,{b}): Create the template for a hypergeometric\nmotive with parameters a and possibly b. The format of the parameters may\nbe alpha: Galois invariant lists of rational numbers a=alpha and b=beta;\nor cyclo: lists A and B of positive integers corresponding to alpha and beta;\nor gamma: list of cn such that the hypergeometric quotient is prod_n(x^n-1)^cn."
function hgminit(x1::LibPARI.Gen; x2 = nothing)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:hgminit, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}((x2 === nothing ? C_NULL : x2.ptr))),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"hgmissymmetrical(H): is the hypergeometric motive template H symmetrical\nat t=1?"
function hgmissymmetrical(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        Int(
            LibPARI._trap_call(
                Int,
                cglobal((:hgmissymmetrical, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            ),
        )
    end
end

"hgmparams(H): H being a hypergeometric motive template, returns\n[d, w, [P, T], M], where d is the degree, w the weight,\nP the Hodge polynomial and T the Tate twist number (so that the Hodge\nfunction itself is P/x^T); finally M is the so-called M-value."
function hgmparams(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:hgmparams, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"hgmtwist(H): twist by 1/2 of alpha and beta of the hypergeometric motive\ntemplate H."
function hgmtwist(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:hgmtwist, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"hilbert(x,y,{p}): Hilbert symbol at p of x,y."
function hilbert(x1::LibPARI.Gen, x2::LibPARI.Gen; x3 = nothing)
    return LibPARI.protected_call() do
        Int(
            LibPARI._trap_call(
                Int,
                cglobal((:hilbert, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                reinterpret(Int, Ptr{Int}((x3 === nothing ? C_NULL : x3.ptr))),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            ),
        )
    end
end

"hyperellchangecurve(C,m): C being a nonsingular\nhyperelliptic model of a curve, apply the change of coordinate\ngiven by m.\nC can be given either by a squarefree polynomial P such that\nC:y^2=P(x) or by a vector [P,Q] such that C:y^2+Q(x)*y=P(x) and Q^2+4P is\nsquarefree."
function hyperellchangecurve(x1::LibPARI.Gen, x2::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:hyperellchangecurve, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"hyperellcharpoly(X): X being a nonsingular hyperelliptic curve defined\nover a finite field, return the characteristic polynomial of the Frobenius\nautomorphism.  X can be given either by a squarefree polynomial P such that\nX:y^2=P(x) or by a vector [P,Q] such that X:y^2+Q(x)*y=P(x) and Q^2+4P is\nsquarefree."
function hyperellcharpoly(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:hyperellcharpoly, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"hyperelldisc(X): X being a nonsingular hyperelliptic model of a curve,\ndefined over a field of characteristic distinct from 2, returns its discriminant.\nX can be given either by a squarefree polynomial P such that\nX:y^2=P(x) or by a vector [P,Q] such that X:y^2+Q(x)*y=P(x) and Q^2+4P is\nsquarefree."
function hyperelldisc(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:hyperelldisc, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"hyperellisoncurve(X,p): X being a nonsingular hyperelliptic model of a curve,\ntest whether the point p is on the curve.\nX can be given either by a squarefree polynomial P such that\nX:y^2=P(x) or by a vector [P,Q] such that X:y^2+Q(x)*y=P(x) and Q^2+4P is\nsquarefree."
function hyperellisoncurve(x1::LibPARI.Gen, x2::LibPARI.Gen)
    return LibPARI.protected_call() do
        Int(
            LibPARI._trap_call(
                Cint,
                cglobal((:hyperellisoncurve, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            ),
        )
    end
end

"hyperellminimaldisc(C,{pr}): C being a nonsingular integral\nhyperelliptic model of a curve, return the minimal discrminant of an integral\nmodel of C.  If pr is given, it must be a list of primes and the discriminant\nis then only garanteed minimal at the elements of pr.\nC can be given either by a squarefree polynomial P such that\nC:y^2=P(x) or by a vector [P,Q] such that C:y^2+Q(x)*y=P(x) and Q^2+4P is\nsquarefree."
function hyperellminimaldisc(x1::LibPARI.Gen; x2 = nothing)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:hyperellminimaldisc, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}((x2 === nothing ? C_NULL : x2.ptr))),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"hyperellminimalmodel(C,{&m},{pr}): C being a nonsingular integral\nhyperelliptic model of a curve, return an integral model of C with minimal\ndiscriminant. If pr is given, it must be a list of primes and the model is\nthen only garanteed minimal at the elements of pr.\nC can be given either by a squarefree polynomial P such that\nC:y^2=P(x) or by a vector [P,Q] such that C:y^2+Q(x)*y=P(x) and Q^2+4P is\nsquarefree."
function hyperellminimalmodel(x1::LibPARI.Gen; x2 = nothing)
    return LibPARI.protected_call() do
        out1 = Ref{Ptr{Int}}(C_NULL)
        av = LibPARI._avma()
        r = LibPARI._trap_call(
            Ptr{Int},
            cglobal((:hyperellminimalmodel, LibPARI.PARI_jll.libpari)),
            3,
            reinterpret(Int, Ptr{Int}(x1.ptr)),
            reinterpret(Int, Base.unsafe_convert(Ptr{Ptr{Int}}, out1)),
            reinterpret(Int, Ptr{Int}((x2 === nothing ? C_NULL : x2.ptr))),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
        )
        primary = LibPARI.Gen(r)
        o1 = LibPARI.Gen(out1[])
        LibPARI._set_avma(av)
        return (primary, o1)
    end
end

"hyperellordinate(H,x): y-coordinates corresponding to x-ordinate x on\nhyperelliptic curve H."
function hyperellordinate(x1::LibPARI.Gen, x2::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:hyperellordinate, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"hyperellpadicfrobenius(Q,q,n): Q being a rational polynomial of degree\nd and X being the curve defined by y^2=Q(x), return the matrix of the\nFrobenius at the prime q >= d in the standard basis of H^1_dR(X) to absolute\nq-adic precision q^n; q may also be of the form [T,p] where T is an integral\npolynomial which is irreducible mod p."
function hyperellpadicfrobenius0(x1::LibPARI.Gen, x2::LibPARI.Gen, x3::Integer)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:hyperellpadicfrobenius0, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(x3),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"hyperellratpoints(X,h,{flag=0}): X being a nonsingular hyperelliptic\ncurve given by an rational model, return a vector containing the affine\nrational points on the curve of naive height less than h.\nIf fl=1, stop as soon as a point is found.\nX can be given either by a squarefree polynomial P such that\nX:y^2=P(x) or by a vector [P,Q] such that X:y^2+Q(x)y=P(x) and Q^2+4P is\nsquarefree."
function hyperellratpoints(x1::LibPARI.Gen, x2::LibPARI.Gen; x3::Integer = 0)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:hyperellratpoints, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(x3),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"hyperellred(C,{&m}): C being a nonsingular integral hyperelliptic model\nof a curve, return an integral model of C with the same discriminant but small\ncoefficients. C can be given either by a squarefree polynomial P such that\nC:y^2=P(x) or by a vector [P,Q] such that C:y^2+Q(x)*y=P(x) and Q^2+4P is\nsquarefree."
function hyperellred(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        out1 = Ref{Ptr{Int}}(C_NULL)
        av = LibPARI._avma()
        r = LibPARI._trap_call(
            Ptr{Int},
            cglobal((:hyperellred, LibPARI.PARI_jll.libpari)),
            2,
            reinterpret(Int, Ptr{Int}(x1.ptr)),
            reinterpret(Int, Base.unsafe_convert(Ptr{Ptr{Int}}, out1)),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
        )
        primary = LibPARI.Gen(r)
        o1 = LibPARI.Gen(out1[])
        LibPARI._set_avma(av)
        return (primary, o1)
    end
end

"hypergeom({N},{D},z): general hypergeometric function, where\nN and D are the vector of parameters in the numerator and denominator\nrespectively, evaluated at the argument z."
function hypergeom(
    x3::LibPARI.Gen;
    x1 = nothing,
    x2 = nothing,
    prec::Integer = 4,
)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:hypergeom, LibPARI.PARI_jll.libpari)),
                4,
                reinterpret(Int, Ptr{Int}((x1 === nothing ? C_NULL : x1.ptr))),
                reinterpret(Int, Ptr{Int}((x2 === nothing ? C_NULL : x2.ptr))),
                reinterpret(Int, Ptr{Int}(x3.ptr)),
                prec,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"hyperu(a,b,z): U-confluent hypergeometric function."
function hyperu(
    x1::LibPARI.Gen,
    x2::LibPARI.Gen,
    x3::LibPARI.Gen;
    prec::Integer = 4,
)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:hyperu, LibPARI.PARI_jll.libpari)),
                4,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                reinterpret(Int, Ptr{Int}(x3.ptr)),
                prec,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"idealadd(nf,x,y): sum of two ideals x and y in the number field\ndefined by nf."
function idealadd(x1::LibPARI.Gen, x2::LibPARI.Gen, x3::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:idealadd, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                reinterpret(Int, Ptr{Int}(x3.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"idealaddtoone(nf,x,{y}): if y is omitted, when the sum of the ideals\nin the number field K defined by nf and given in the vector x is equal to\nZ_K, gives a vector of elements of the corresponding ideals who sum to 1.\nOtherwise, x and y are ideals, and if they sum up to 1, find one element in\neach of them such that the sum is 1."
function idealaddtoone0(x1::LibPARI.Gen, x2::LibPARI.Gen; x3 = nothing)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:idealaddtoone0, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                reinterpret(Int, Ptr{Int}((x3 === nothing ? C_NULL : x3.ptr))),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"idealappr(nf,x,{flag}): x being a fractional ideal, gives an element\nb such that v_p(b)=v_p(x) for all prime ideals p dividing x, and v_p(b)>=0\nfor all other p; x may also be a prime ideal factorization with possibly\nzero exponents. flag is deprecated (ignored), kept for backward compatibility."
function idealappr0(x1::LibPARI.Gen, x2::LibPARI.Gen; x3::Integer = 0)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:idealappr0, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(x3),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"idealchinese(nf,x,{y}): x being a prime ideal factorization and y a\nvector of elements, gives an element b such that v_p(b-y_p)>=v_p(x) for all\nprime ideals p dividing x, and v_p(b)>=0 for all other p. If y is omitted,\nreturn a data structure which can be used in place of x in later calls."
function idealchinese(x1::LibPARI.Gen, x2::LibPARI.Gen; x3 = nothing)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:idealchinese, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                reinterpret(Int, Ptr{Int}((x3 === nothing ? C_NULL : x3.ptr))),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"idealcoprime(nf,x,y): gives an element b in nf such that b. x is an\nintegral ideal coprime to the integral ideal y."
function idealcoprime(x1::LibPARI.Gen, x2::LibPARI.Gen, x3::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:idealcoprime, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                reinterpret(Int, Ptr{Int}(x3.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"idealdiv(nf,x,y,{flag=0}): quotient x/y of two ideals x and y in HNF\nin the number field nf. If (optional) flag is nonzero, the quotient is\nsupposed to be an integral ideal (slightly faster)."
function idealdiv0(
    x1::LibPARI.Gen,
    x2::LibPARI.Gen,
    x3::LibPARI.Gen;
    x4::Integer = 0,
)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:idealdiv0, LibPARI.PARI_jll.libpari)),
                4,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                reinterpret(Int, Ptr{Int}(x3.ptr)),
                Int(x4),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"idealdown(nf,x): finds the intersection of the ideal x with Q."
function idealdown(x1::LibPARI.Gen, x2::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:idealdown, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"idealfactor(nf,x,{lim}): factorization of the ideal x into prime ideals\nin the number field nf. If lim is set return partial factorization, using\nprimes < lim."
function gpidealfactor(x1::LibPARI.Gen, x2::LibPARI.Gen; x3 = nothing)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:gpidealfactor, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                reinterpret(Int, Ptr{Int}((x3 === nothing ? C_NULL : x3.ptr))),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"idealfrobenius(nf,gal,pr): returns the Frobenius element (pr|nf/Q)\nattached to the unramified prime ideal pr in prid format, in the Galois\ngroup gal of the number field nf."
function idealfrobenius(x1::LibPARI.Gen, x2::LibPARI.Gen, x3::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:idealfrobenius, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                reinterpret(Int, Ptr{Int}(x3.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"idealhnf(nf,u,{v}): hermite normal form of the ideal u in the number\nfield nf if v is omitted. If called as idealhnf(nf,u,v), the ideal\nis given as uZ_K + vZ_K in the number field K defined by nf."
function idealhnf0(x1::LibPARI.Gen, x2::LibPARI.Gen; x3 = nothing)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:idealhnf0, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                reinterpret(Int, Ptr{Int}((x3 === nothing ? C_NULL : x3.ptr))),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"idealintersect(nf,A,B): intersection of two ideals A and B in the\nnumber field defined by nf."
function idealintersect(x1::LibPARI.Gen, x2::LibPARI.Gen, x3::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:idealintersect, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                reinterpret(Int, Ptr{Int}(x3.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"idealinv(nf,x): inverse of the ideal x in the number field nf."
function idealinv(x1::LibPARI.Gen, x2::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:idealinv, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"idealismaximal(nf,x): if x is a maximal ideal, return it in prid form,\nelse return 0."
function idealismaximal(x1::LibPARI.Gen, x2::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:idealismaximal, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"idealispower(nf,A,n,{&B}): return 1 if A = B^n is an n-th power\nelse return 0."
function idealispower(x1::LibPARI.Gen, x2::LibPARI.Gen, x3::Integer)
    return LibPARI.protected_call() do
        out1 = Ref{Ptr{Int}}(C_NULL)
        av = LibPARI._avma()
        r = LibPARI._trap_call(
            Int,
            cglobal((:idealispower, LibPARI.PARI_jll.libpari)),
            4,
            reinterpret(Int, Ptr{Int}(x1.ptr)),
            reinterpret(Int, Ptr{Int}(x2.ptr)),
            Int(x3),
            reinterpret(Int, Base.unsafe_convert(Ptr{Ptr{Int}}, out1)),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
        )
        primary = Int(r)
        o1 = LibPARI.Gen(out1[])
        LibPARI._set_avma(av)
        return (primary, o1)
    end
end

"ideallist(nf,bound,{flag=4}): vector of vectors L of all idealstar of\nall ideals of norm<=bound. If (optional) flag is present, its binary digits\nare toggles meaning 1: give generators; 2: add units; 4: give only the\nideals and not the bid; 8: omit ideals which cannot be conductors."
function gideallist(x1::LibPARI.Gen, x2::LibPARI.Gen; x3::Integer = 4)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:gideallist, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(x3),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"ideallistarch(nf,list,arch): list is a vector of vectors of bid's as\noutput by ideallist. Return a vector of vectors with the same number of\ncomponents as the original list. The leaves give information about\nmoduli whose finite part is as in original list, in the same order, and\nArchimedean part is now arch. The information contained is of the same kind\nas was present in the input."
function ideallistarch(x1::LibPARI.Gen, x2::LibPARI.Gen, x3::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:ideallistarch, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                reinterpret(Int, Ptr{Int}(x3.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"ideallog({nf},x,bid): if bid is a big ideal, as given by\nidealstar(nf,D,...), gives the vector of exponents on the generators bid.gen\n(even if these generators have not been explicitly computed)."
function ideallog(x2::LibPARI.Gen, x3::LibPARI.Gen; x1 = nothing)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:ideallog, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}((x1 === nothing ? C_NULL : x1.ptr))),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                reinterpret(Int, Ptr{Int}(x3.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"idealmin(nf,ix,{vdir}): pseudo-minimum of the ideal ix in the direction\nvdir in the number field nf."
function idealmin(x1::LibPARI.Gen, x2::LibPARI.Gen; x3 = nothing)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:idealmin, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                reinterpret(Int, Ptr{Int}((x3 === nothing ? C_NULL : x3.ptr))),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"idealmul(nf,x,y,{flag=0}): product of the two ideals x and y in the\nnumber field nf. If (optional) flag is nonzero, reduce the result."
function idealmul0(
    x1::LibPARI.Gen,
    x2::LibPARI.Gen,
    x3::LibPARI.Gen;
    x4::Integer = 0,
)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:idealmul0, LibPARI.PARI_jll.libpari)),
                4,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                reinterpret(Int, Ptr{Int}(x3.ptr)),
                Int(x4),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"idealnorm(nf,x): norm of the ideal x in the number field nf."
function idealnorm(x1::LibPARI.Gen, x2::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:idealnorm, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"idealnumden(nf,x): returns [A,B], where A,B are coprime integer ideals\nsuch that x = A/B."
function idealnumden(x1::LibPARI.Gen, x2::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:idealnumden, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"idealpow(nf,x,k,{flag=0}): k-th power of the ideal x in HNF in the\nnumber field nf. If (optional) flag is nonzero, reduce the result."
function idealpow0(
    x1::LibPARI.Gen,
    x2::LibPARI.Gen,
    x3::LibPARI.Gen;
    x4::Integer = 0,
)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:idealpow0, LibPARI.PARI_jll.libpari)),
                4,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                reinterpret(Int, Ptr{Int}(x3.ptr)),
                Int(x4),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"idealprimedec(nf,p,{f=0}): prime ideal decomposition of the prime number\np in the number field nf as a vector of prime ideals. If f is present\nand nonzero, restrict the result to primes of residue degree <= f."
function idealprimedec_limit_f(
    x1::LibPARI.Gen,
    x2::LibPARI.Gen;
    x3::Integer = 0,
)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:idealprimedec_limit_f, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(x3),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"idealprincipalunits(nf,pr,k): returns the structure [no, cyc, gen]\nof the multiplicative group (1 + pr) / (1 + pr^k)."
function idealprincipalunits(x1::LibPARI.Gen, x2::LibPARI.Gen, x3::Integer)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:idealprincipalunits, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(x3),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"idealramgroups(nf,gal,pr): let pr be a prime ideal in prid format, and\ngal the Galois group of the number field nf, return a vector g such that g[1]\nis the decomposition group of pr, g[2] is the inertia group, g[i] is the\n(i-2)th ramification group of pr, all trivial subgroups being omitted."
function idealramgroups(x1::LibPARI.Gen, x2::LibPARI.Gen, x3::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:idealramgroups, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                reinterpret(Int, Ptr{Int}(x3.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"idealred(nf,I,{v=0}): LLL reduction of the ideal I in the number\nfield nf along direction v, in HNF."
function idealred0(x1::LibPARI.Gen, x2::LibPARI.Gen; x3 = nothing)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:idealred0, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                reinterpret(Int, Ptr{Int}((x3 === nothing ? C_NULL : x3.ptr))),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"idealredmodpower(nf,x,n,{B=factorlimit}): return b such that x * b^n = v\nis small."
function idealredmodpower(
    x1::LibPARI.Gen,
    x2::LibPARI.Gen,
    x3::Integer;
    x4::Integer = 0,
)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:idealredmodpower, LibPARI.PARI_jll.libpari)),
                4,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                reinterpret(Int, UInt(x3)),
                reinterpret(Int, UInt(x4)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"idealtwoelt(nf,x,{a}): two-element representation of an ideal x in the\nnumber field nf. If (optional) a is nonzero, first element will be equal to a."
function idealtwoelt0(x1::LibPARI.Gen, x2::LibPARI.Gen; x3 = nothing)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:idealtwoelt0, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                reinterpret(Int, Ptr{Int}((x3 === nothing ? C_NULL : x3.ptr))),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"idealval(nf,x,pr): valuation at pr given in idealprimedec format of the\nideal x in the number field nf."
function gpidealval(x1::LibPARI.Gen, x2::LibPARI.Gen, x3::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:gpidealval, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                reinterpret(Int, Ptr{Int}(x3.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"imag(x): imaginary part of x."
function gimag(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:gimag, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"incgam(s,x,{g}): incomplete gamma function. g is optional and is the\nprecomputed value of gamma(s)."
function incgam0(
    x1::LibPARI.Gen,
    x2::LibPARI.Gen;
    x3 = nothing,
    prec::Integer = 4,
)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:incgam0, LibPARI.PARI_jll.libpari)),
                4,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                reinterpret(Int, Ptr{Int}((x3 === nothing ? C_NULL : x3.ptr))),
                prec,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"incgamc(s,x): complementary incomplete gamma function."
function incgamc(x1::LibPARI.Gen, x2::LibPARI.Gen; prec::Integer = 4)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:incgamc, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                prec,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"input(): read an expression from the input file or standard input."
function gp_input()
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:gp_input, LibPARI.PARI_jll.libpari)),
                0,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"install(name,code,{gpname},{lib}): load from dynamic library 'lib' the\nfunction 'name'. Assign to it the name 'gpname' in this GP session, with\nprototype 'code'. If 'lib' is omitted, all symbols known to gp\n(includes the whole 'libpari.so' and possibly others) are available.\nIf 'gpname' is omitted, use 'name'."
function gpinstall(
    x1::AbstractString,
    x2::AbstractString;
    x3::AbstractString = "",
    x4::AbstractString = "",
)
    LibPARI.protected_call() do
        let _cs1 = Base.cconvert(Cstring, x1),
            _cs2 = Base.cconvert(Cstring, x2),
            _cs3 = Base.cconvert(Cstring, x3),
            _cs4 = Base.cconvert(Cstring, x4)

            GC.@preserve _cs1 _cs2 _cs3 _cs4 LibPARI._trap_call(
                Cvoid,
                cglobal((:gpinstall, LibPARI.PARI_jll.libpari)),
                4,
                reinterpret(Int, Base.unsafe_convert(Cstring, _cs1)),
                reinterpret(Int, Base.unsafe_convert(Cstring, _cs2)),
                reinterpret(Int, Base.unsafe_convert(Cstring, _cs3)),
                reinterpret(Int, Base.unsafe_convert(Cstring, _cs4)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
    return nothing
end

"intformal(x,{v}): formal integration of x with respect to v, or to the\nmain variable of x if v is omitted."
function integ(x1::LibPARI.Gen; x2::Integer = -1)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:integ, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(x2),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"intnumgaussinit({n}): initialize tables for n-point Gauss-Legendre\nintegration on a compact interval."
function intnumgaussinit(; x1::Integer = 0, prec::Integer = 4)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:intnumgaussinit, LibPARI.PARI_jll.libpari)),
                2,
                Int(x1),
                prec,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"intnuminit(a,b,{m=0}): initialize tables for integrations from a to b.\nSee help for intnum for coding of a and b. Possible types: compact interval,\nsemi-compact (one extremity at + or - infinity) or R, and very slowly, slowly\nor exponentially decreasing, or sine or cosine oscillating at infinities."
function intnuminit(
    x1::LibPARI.Gen,
    x2::LibPARI.Gen;
    x3::Integer = 0,
    prec::Integer = 4,
)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:intnuminit, LibPARI.PARI_jll.libpari)),
                4,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(x3),
                prec,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"isfundamental(D): true(1) if D is a fundamental discriminant\n(including 1), false(0) if not."
function isfundamental(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        Int(
            LibPARI._trap_call(
                Int,
                cglobal((:isfundamental, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            ),
        )
    end
end

"ispolygonal(x,s,{&N}): true(1) if x is an s-gonal number, false(0) if\nnot (s > 2). If N is given set it to n if x is the n-th s-gonal number."
function ispolygonal(x1::LibPARI.Gen, x2::LibPARI.Gen)
    return LibPARI.protected_call() do
        out1 = Ref{Ptr{Int}}(C_NULL)
        av = LibPARI._avma()
        r = LibPARI._trap_call(
            Int,
            cglobal((:ispolygonal, LibPARI.PARI_jll.libpari)),
            3,
            reinterpret(Int, Ptr{Int}(x1.ptr)),
            reinterpret(Int, Ptr{Int}(x2.ptr)),
            reinterpret(Int, Base.unsafe_convert(Ptr{Ptr{Int}}, out1)),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
        )
        primary = Int(r)
        o1 = LibPARI.Gen(out1[])
        LibPARI._set_avma(av)
        return (primary, o1)
    end
end

"ispower(x,{k},{&n}): if k > 0 is given, return true (1) if x is a k-th\npower, false (0) if not. If k is omitted, return the maximal k >= 2 such\nthat x = n^k is a perfect power, or 0 if no such k exist.\nIf n is present, and the function returns a nonzero result, set n to the\nk-th root of x."
function ispower(x1::LibPARI.Gen; x2 = nothing)
    return LibPARI.protected_call() do
        out1 = Ref{Ptr{Int}}(C_NULL)
        av = LibPARI._avma()
        r = LibPARI._trap_call(
            Int,
            cglobal((:ispower, LibPARI.PARI_jll.libpari)),
            3,
            reinterpret(Int, Ptr{Int}(x1.ptr)),
            reinterpret(Int, Ptr{Int}((x2 === nothing ? C_NULL : x2.ptr))),
            reinterpret(Int, Base.unsafe_convert(Ptr{Ptr{Int}}, out1)),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
        )
        primary = Int(r)
        o1 = LibPARI.Gen(out1[])
        LibPARI._set_avma(av)
        return (primary, o1)
    end
end

"ispowerful(x): true(1) if x is a powerful integer (valuation at all\nprimes dividing x is greater than 1), false(0) if not."
function ispowerful(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        Int(
            LibPARI._trap_call(
                Int,
                cglobal((:ispowerful, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            ),
        )
    end
end

"isprime(x,{flag=0}): true(1) if x is a (proven) prime number, false(0)\nif not. If flag is 0 or omitted, use a combination of algorithms. If flag is\n1, the primality is certified by the Pocklington-Lehmer Test. If flag is 2,\nthe primality is certified using the APRCL test. If flag is 3, use ECPP."
function gisprime(x1::LibPARI.Gen; x2::Integer = 0)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:gisprime, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(x2),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"isprimepower(x,{&n}): if x = p^k is a prime power (p prime, k > 0),\nreturn k, else return 0. If n is present, and the function returns a nonzero\nresult, set n to p, the k-th root of x."
function isprimepower(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        out1 = Ref{Ptr{Int}}(C_NULL)
        av = LibPARI._avma()
        r = LibPARI._trap_call(
            Int,
            cglobal((:isprimepower, LibPARI.PARI_jll.libpari)),
            2,
            reinterpret(Int, Ptr{Int}(x1.ptr)),
            reinterpret(Int, Base.unsafe_convert(Ptr{Ptr{Int}}, out1)),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
        )
        primary = Int(r)
        o1 = LibPARI.Gen(out1[])
        LibPARI._set_avma(av)
        return (primary, o1)
    end
end

"ispseudoprime(x,{flag}): true(1) if x is a strong pseudoprime, false(0)\nif not. If flag is 0 or omitted, use BPSW test, otherwise use strong\nRabin-Miller test for flag randomly chosen bases."
function gispseudoprime(x1::LibPARI.Gen; x2::Integer = 0)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:gispseudoprime, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(x2),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"ispseudoprimepower(x,{&n}): if x = p^k is a pseudo-prime power (p\npseudo-prime, k > 0),\nreturn k, else return 0. If n is present, and the function returns a nonzero\nresult, set n to p, the k-th root of x."
function ispseudoprimepower(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        out1 = Ref{Ptr{Int}}(C_NULL)
        av = LibPARI._avma()
        r = LibPARI._trap_call(
            Int,
            cglobal((:ispseudoprimepower, LibPARI.PARI_jll.libpari)),
            2,
            reinterpret(Int, Ptr{Int}(x1.ptr)),
            reinterpret(Int, Base.unsafe_convert(Ptr{Ptr{Int}}, out1)),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
        )
        primary = Int(r)
        o1 = LibPARI.Gen(out1[])
        LibPARI._set_avma(av)
        return (primary, o1)
    end
end

"issquare(x,{&n}): true(1) if x is a square, false(0) if not. If n is\ngiven puts the exact square root there if it was computed."
function issquareall(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        out1 = Ref{Ptr{Int}}(C_NULL)
        av = LibPARI._avma()
        r = LibPARI._trap_call(
            Int,
            cglobal((:issquareall, LibPARI.PARI_jll.libpari)),
            2,
            reinterpret(Int, Ptr{Int}(x1.ptr)),
            reinterpret(Int, Base.unsafe_convert(Ptr{Ptr{Int}}, out1)),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
        )
        primary = Int(r)
        o1 = LibPARI.Gen(out1[])
        LibPARI._set_avma(av)
        return (primary, o1)
    end
end

"issquarefree(x): true(1) if x is squarefree, false(0) if not."
function issquarefree(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        Int(
            LibPARI._trap_call(
                Int,
                cglobal((:issquarefree, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            ),
        )
    end
end

"istotient(x,{&N}): true(1) if x = eulerphi(n) for some integer n,\nfalse(0) if not. If N is given, set N = n as well."
function istotient(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        out1 = Ref{Ptr{Int}}(C_NULL)
        av = LibPARI._avma()
        r = LibPARI._trap_call(
            Int,
            cglobal((:istotient, LibPARI.PARI_jll.libpari)),
            2,
            reinterpret(Int, Ptr{Int}(x1.ptr)),
            reinterpret(Int, Base.unsafe_convert(Ptr{Ptr{Int}}, out1)),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
        )
        primary = Int(r)
        o1 = LibPARI.Gen(out1[])
        LibPARI._set_avma(av)
        return (primary, o1)
    end
end

"kill(sym): restores the symbol sym to its ``undefined'' status and kill\nattached help messages."
function kill0(x1::AbstractString)
    LibPARI.protected_call() do
        let _cs1 = Base.cconvert(Cstring, x1)
            GC.@preserve _cs1 LibPARI._trap_call(
                Cvoid,
                cglobal((:kill0, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Base.unsafe_convert(Cstring, _cs1)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
    return nothing
end

"kronecker(x,y): kronecker symbol (x/y)."
function kronecker(x1::LibPARI.Gen, x2::LibPARI.Gen)
    return LibPARI.protected_call() do
        Int(
            LibPARI._trap_call(
                Int,
                cglobal((:kronecker, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            ),
        )
    end
end

"lambertw(y,{branch=0}): solution of the implicit equation x*exp(x)=y.\nIn the p-adic case, give a solution of x*exp(x)=y if y has valuation > 1\n(or p odd and positive valuation), of log(x)+x=log(y) otherwise."
function glambertW(x1::LibPARI.Gen; x2::Integer = 0, prec::Integer = 4)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:glambertW, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(x2),
                prec,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"laurentseries(f,{M=seriesprecision},{x='x}): expand f around 0 as a\nLaurent series in x to order M."
function laurentseries0(
    x1::LibPARI.Gen;
    seriesprec::Integer = 16,
    x2::Integer = -1,
    prec::Integer = 4,
)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:laurentseries0, LibPARI.PARI_jll.libpari)),
                4,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                seriesprec,
                Int(x2),
                prec,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"lcm(x,{y}): least common multiple of x and y, i.e. x*y / gcd(x,y)\nup to units."
function glcm0(x1::LibPARI.Gen; x2 = nothing)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:glcm0, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}((x2 === nothing ? C_NULL : x2.ptr))),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"lerchphi(z,s,a): Lerch transcendent equal to sum for n >= 0 of\nz^n / (n+a)^s for reasonable values of the arguments."
function lerchphi(
    x1::LibPARI.Gen,
    x2::LibPARI.Gen,
    x3::LibPARI.Gen;
    prec::Integer = 4,
)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:lerchphi, LibPARI.PARI_jll.libpari)),
                4,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                reinterpret(Int, Ptr{Int}(x3.ptr)),
                prec,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"lerchzeta(s,a,lam): Lerch zeta function equal to sum for n >= 0 of\ne^(2 pi i lam n) / (n+a)^s for reasonable values of the arguments."
function lerchzeta(
    x1::LibPARI.Gen,
    x2::LibPARI.Gen,
    x3::LibPARI.Gen;
    prec::Integer = 4,
)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:lerchzeta, LibPARI.PARI_jll.libpari)),
                4,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                reinterpret(Int, Ptr{Int}(x3.ptr)),
                prec,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"lex(x,y): compare x and y lexicographically (1 if x>y, 0 if x=y, -1 if x<y)."
function lexcmp(x1::LibPARI.Gen, x2::LibPARI.Gen)
    return LibPARI.protected_call() do
        Int(
            LibPARI._trap_call(
                Cint,
                cglobal((:lexcmp, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            ),
        )
    end
end

"lfun(L,s,{D=0}): compute the L-function value L(s), or\nif D is set, the derivative of order D at s. L is either an\nLmath, an Ldata or an Linit."
function lfun0(
    x1::LibPARI.Gen,
    x2::LibPARI.Gen;
    x3::Integer = 0,
    bitprec::Integer = 128,
)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:lfun0, LibPARI.PARI_jll.libpari)),
                4,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(x3),
                bitprec,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"lfunan(L,n): compute the first n terms of the Dirichlet series\nattached to the L-function given by L (Lmath, Ldata or Linit)."
function lfunan(x1::LibPARI.Gen, x2::Integer; prec::Integer = 4)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:lfunan, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(x2),
                prec,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"lfunartin(nf,gal,rho,n): returns the Ldata structure attached to the\nArtin L-function provided by the representation rho of the Galois group of the\nextension K/Q, defined over the cyclotomic field Q(zeta_n), where nf is the\nnfinit structure attached to K, gal is the galoisinit structure attached to\nK/Q, and rho is given either by the values of its character on the conjugacy\nclasses or by the matrices that are the images of the generators. Cyclotomic\nnumbers in rho are represented by polynomials, whose variable is understood as\nthe complex number exp(2*I*Pi/n)."
function lfunartin(
    x1::LibPARI.Gen,
    x2::LibPARI.Gen,
    x3::LibPARI.Gen,
    x4::Integer;
    bitprec::Integer = 128,
)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:lfunartin, LibPARI.PARI_jll.libpari)),
                5,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                reinterpret(Int, Ptr{Int}(x3.ptr)),
                Int(x4),
                bitprec,
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"lfuncheckfeq(L,{t}): given an L-function (Lmath, Ldata or Linit),\ncheck whether the functional equation is satisfied. If the function has\npoles, the polar part must be specified. The program returns a bit accuracy\nwhich should be a large negative value close to the current bit accuracy.\nIf t is given, it checks the functional equation for the theta function\nat t and 1/t."
function lfuncheckfeq(x1::LibPARI.Gen; x2 = nothing, bitprec::Integer = 128)
    return LibPARI.protected_call() do
        Int(
            LibPARI._trap_call(
                Int,
                cglobal((:lfuncheckfeq, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}((x2 === nothing ? C_NULL : x2.ptr))),
                bitprec,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            ),
        )
    end
end

"lfuncreate(obj): given either an object such as a polynomial, elliptic\ncurve, Dirichlet or Hecke character, eta quotient, etc., or an explicit\n6 or 7 component vector [dir,real,Vga,k,N,eps,r],\ncreate the Ldata structure necessary for lfun computation."
function lfuncreate(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:lfuncreate, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"lfundiv(L1,L2): creates the Ldata structure (without\ninitialization) corresponding to the quotient of the Dirichlet series\ngiven by L1 and L2."
function lfundiv(x1::LibPARI.Gen, x2::LibPARI.Gen; bitprec::Integer = 128)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:lfundiv, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                bitprec,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"lfundual(L): creates the Ldata structure (without\ninitialization) corresponding to the dual L-function of L."
function lfundual(x1::LibPARI.Gen; bitprec::Integer = 128)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:lfundual, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                bitprec,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"lfunetaquo(M): returns the Ldata structure attached to the\nmodular form z->prod(i=1,#M[,1],eta(M[i,1]*z)^M[i,2])."
function lfunetaquo(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:lfunetaquo, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"lfuneuler(L,p): return the Euler factor at p\nof the L-function given by L (Lmath, Ldata or Linit) assuming the L-function\nadmits an Euler product factorization and that it can be determined."
function lfuneuler(x1::LibPARI.Gen, x2::LibPARI.Gen; prec::Integer = 4)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:lfuneuler, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                prec,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"lfungenus2(F): returns the Ldata structure attached to the\nL-function attached to the genus-2 curve defined by y^2=F(x)\nor y^2+Q(x)*y=P(x) if F=[P,Q].\nCurrently, only odd conductors are supported."
function lfungenus2(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:lfungenus2, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"lfunhardy(L,t): variant of the Hardy L-function attached to L, used for\nplotting on the critical line."
function lfunhardy(x1::LibPARI.Gen, x2::LibPARI.Gen; bitprec::Integer = 128)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:lfunhardy, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                bitprec,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"lfunhgm(H,t,{hint}): (H,t) being a hypergeometric motive, returns the\ncorresponding lfuncreate data for use with the L function package."
function lfunhgm(
    x1::LibPARI.Gen,
    x2::LibPARI.Gen;
    x3 = nothing,
    bitprec::Integer = 128,
)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:lfunhgm, LibPARI.PARI_jll.libpari)),
                4,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                reinterpret(Int, Ptr{Int}((x3 === nothing ? C_NULL : x3.ptr))),
                bitprec,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"lfuninit(L,sdom,{der=0}): precompute data\nfor evaluating the L-function given by 'L' (and its derivatives\nof order der, if set) in rectangular domain sdom = [center,w,h]\ncentered on the real axis, |Re(s)-center| <= w, |Im(s)| <= h,\nwhere all three components of sdom are real and w,h are nonnegative.\nThe subdomain [k/2, 0, h] on the critical line can be encoded as [h] for\nbrevity."
function lfuninit0(
    x1::LibPARI.Gen,
    x2::LibPARI.Gen;
    x3::Integer = 0,
    bitprec::Integer = 128,
)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:lfuninit0, LibPARI.PARI_jll.libpari)),
                4,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(x3),
                bitprec,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"lfunlambda(L,s,{D=0}): compute the completed L function Lambda(s),\nor if D is set, the derivative of order D at s. L is either\nan Lmath, an Ldata or an Linit."
function lfunlambda0(
    x1::LibPARI.Gen,
    x2::LibPARI.Gen;
    x3::Integer = 0,
    bitprec::Integer = 128,
)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:lfunlambda0, LibPARI.PARI_jll.libpari)),
                4,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(x3),
                bitprec,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"lfunmf(mf,{F}): If F is a modular form in mf, output the L-functions\ncorresponding to its complex embeddings. If F is omitted, output the\nL-functions corresponding to all eigenforms in the new space."
function lfunmf(x1::LibPARI.Gen; x2 = nothing, bitprec::Integer = 128)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:lfunmf, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}((x2 === nothing ? C_NULL : x2.ptr))),
                bitprec,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"lfunmfspec(L): L corresponding to a modular eigenform, returns\n[vo,ve,om,op] in even weight, where vo (resp., ve) is the vector of odd\n(resp., even) periods, and om and op the corresponding real numbers\nomega^- and omega^+. Returns [v,om] in odd weight."
function lfunmfspec(x1::LibPARI.Gen; bitprec::Integer = 128)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:lfunmfspec, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                bitprec,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"lfunmul(L1,L2): creates the Ldata structure (without\ninitialization) corresponding to the product of the Dirichlet series\ngiven by L1 and L2."
function lfunmul(x1::LibPARI.Gen, x2::LibPARI.Gen; bitprec::Integer = 128)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:lfunmul, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                bitprec,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"lfunorderzero(L,{m=-1}): computes the order of the possible zero\nof the L-function at the center k/2 of the critical strip. If m is\ngiven and has a nonnegative value, assumes the order is at most m."
function lfunorderzero(
    x1::LibPARI.Gen;
    x2::Integer = -1,
    bitprec::Integer = 128,
)
    return LibPARI.protected_call() do
        Int(
            LibPARI._trap_call(
                Int,
                cglobal((:lfunorderzero, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(x2),
                bitprec,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            ),
        )
    end
end

"lfunparams(ldata): returns the parameters [N, k, vga] of the L-function\ndefined by ldata (see lfuncreate).\nThe parameters Vga (gamma shifts) are returned to the current precision."
function lfunparams(x1::LibPARI.Gen; prec::Integer = 4)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:lfunparams, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                prec,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"lfunqf(Q): returns the Ldata structure attached to the\ntheta function of the lattice attached to the definite positive quadratic\nform Q."
function lfunqf(x1::LibPARI.Gen; prec::Integer = 4)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:lfunqf, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                prec,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"lfunrootres(data): given the Ldata attached to an L-function (or the\noutput of lfunthetainit), compute the root number and the\nresidues. In the present implementation, if the polar part is not already\nknown completely, at most a single pole is allowed.\nThe output is a 3-component vector\n[[[a_1, r_1],...,[a_n, r_n],[[b_1, R_1],...[b_m,R_m]]~, w], where r_i is the\npolar part of L(s) at a_i, R_i is is the polar part of Lambda(s) at b_i,\nor [0,0,r] if there is no pole, and r is the root number."
function lfunrootres(x1::LibPARI.Gen; bitprec::Integer = 128)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:lfunrootres, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                bitprec,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"lfunshift(L,d,{flag}): creates the Ldata structure (without\ninitialization) corresponding to the function Ld such that Ld(s) = L(s-d).\nIf fl=1, return the product L*Ld instead."
function lfunshift(
    x1::LibPARI.Gen,
    x2::LibPARI.Gen;
    x3::Integer = 0,
    bitprec::Integer = 128,
)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:lfunshift, LibPARI.PARI_jll.libpari)),
                4,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(x3),
                bitprec,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"lfunsympow(E,m): returns the Ldata structure attached to the\nL-function attached to m-th symmetric power of the elliptic curve E defined\nover the rationals."
function lfunsympow(x1::LibPARI.Gen, x2::Integer)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:lfunsympow, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, UInt(x2)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"lfuntheta(data,t,{m=0}): compute the value of the m-th derivative\nat t of the theta function attached to the L-function given by data.\ndata can be either the standard L-function data, or the output of\nlfunthetainit."
function lfuntheta(
    x1::LibPARI.Gen,
    x2::LibPARI.Gen;
    x3::Integer = 0,
    bitprec::Integer = 128,
)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:lfuntheta, LibPARI.PARI_jll.libpari)),
                4,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(x3),
                bitprec,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"lfuntwist(L,chi): creates the Ldata structure (without\ninitialization) corresponding to the twist of L by the primitive character\nattached to the Dirichlet L-function chi. This requires that the conductor\nof the character is coprime to the conductor of the L-function L."
function lfuntwist(x1::LibPARI.Gen, x2::LibPARI.Gen; bitprec::Integer = 128)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:lfuntwist, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                bitprec,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"lfunzeros(L,lim,{divz=8}): lim being\neither an upper limit or a real interval, computes an ordered list of\nzeros of L(s) on the critical line up to the given upper limit or in the\ngiven interval. Use a naive algorithm which may miss some zeros.\nTo use a finer search mesh, set divz to some integral value\nlarger than the default (= 8)."
function lfunzeros(
    x1::LibPARI.Gen,
    x2::LibPARI.Gen;
    x3::Integer = 8,
    bitprec::Integer = 128,
)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:lfunzeros, LibPARI.PARI_jll.libpari)),
                4,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(x3),
                bitprec,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"lift(x,{v}):\nif v is omitted, lifts elements of Z/nZ to Z, of Qp to Q, and of K[x]/(P) to\nK[x]. Otherwise lift only polmods with main variable v."
function lift0(x1::LibPARI.Gen; x2::Integer = -1)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:lift0, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(x2),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"liftall(x): lifts every element of Z/nZ to Z, of Qp to Q, and of\nK[x]/(P) to K[x]."
function liftall(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:liftall, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"liftint(x): lifts every element of Z/nZ to Z and of Qp to Q."
function liftint(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:liftint, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"liftpol(x): lifts every polmod component of x to polynomials."
function liftpol(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:liftpol, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"limitnum(expr,{alpha=1}): numerical limit of sequence expr\nusing Lagrange-Zagier extrapolation; assume u(n) ~ sum a_i n^(-alpha*i)."
function limitnum0(x1::LibPARI.Gen; x2 = nothing, prec::Integer = 4)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:limitnum0, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}((x2 === nothing ? C_NULL : x2.ptr))),
                prec,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"lindep(v,{flag=0}): integral linear dependencies between components of v.\nflag is optional, and can be 0: default, guess a suitable\naccuracy, or positive: accuracy to use for the computation, in decimal\ndigits."
function lindep0(x1::LibPARI.Gen; x2::Integer = 0)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:lindep0, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(x2),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"listcreate({n}): this function is obsolete, use List()."
function listcreate_gp(; x1::Integer = 0)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:listcreate_gp, LibPARI.PARI_jll.libpari)),
                1,
                Int(x1),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"lngamma(x): logarithm of the gamma function of x."
function glngamma(x1::LibPARI.Gen; prec::Integer = 4)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:glngamma, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                prec,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"localbitprec(p): set the real precision to p bits in the dynamic scope."
function localbitprec(x1::LibPARI.Gen)
    LibPARI.protected_call() do
        LibPARI._trap_call(
            Cvoid,
            cglobal((:localbitprec, LibPARI.PARI_jll.libpari)),
            1,
            reinterpret(Int, Ptr{Int}(x1.ptr)),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
        )
    end
    return nothing
end

"localprec(p): set the real precision to p in the dynamic scope\nand return p."
function localprec(x1::LibPARI.Gen)
    LibPARI.protected_call() do
        LibPARI._trap_call(
            Cvoid,
            cglobal((:localprec, LibPARI.PARI_jll.libpari)),
            1,
            reinterpret(Int, Ptr{Int}(x1.ptr)),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
        )
    end
    return nothing
end

"log(x): natural logarithm of x."
function glog(x1::LibPARI.Gen; prec::Integer = 4)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:glog, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                prec,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"log1p(x): log(1+x)"
function glog1p(x1::LibPARI.Gen; prec::Integer = 4)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:glog1p, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                prec,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"logint(x,b,{&z}): return the largest non-negative integer e so that\nb^e <= x, where b > 1 is an integer and x >= 1 is a real number. If the\nparameter z is present, set it to b^e."
function logint0(x1::LibPARI.Gen, x2::LibPARI.Gen)
    return LibPARI.protected_call() do
        out1 = Ref{Ptr{Int}}(C_NULL)
        av = LibPARI._avma()
        r = LibPARI._trap_call(
            Int,
            cglobal((:logint0, LibPARI.PARI_jll.libpari)),
            3,
            reinterpret(Int, Ptr{Int}(x1.ptr)),
            reinterpret(Int, Ptr{Int}(x2.ptr)),
            reinterpret(Int, Base.unsafe_convert(Ptr{Ptr{Int}}, out1)),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
        )
        primary = Int(r)
        o1 = LibPARI.Gen(out1[])
        LibPARI._set_avma(av)
        return (primary, o1)
    end
end

"mapget(M,x): returns the image of x by the map M."
function mapget(x1::LibPARI.Gen, x2::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:mapget, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"mapisdefined(M,x,{&z}): true (1) if x has an image by the map M,\nfalse (0) otherwise.\nIf z is present, set it to the image of x, if it exists."
function mapisdefined(x1::LibPARI.Gen, x2::LibPARI.Gen)
    return LibPARI.protected_call() do
        out1 = Ref{Ptr{Int}}(C_NULL)
        av = LibPARI._avma()
        r = LibPARI._trap_call(
            Cint,
            cglobal((:mapisdefined, LibPARI.PARI_jll.libpari)),
            3,
            reinterpret(Int, Ptr{Int}(x1.ptr)),
            reinterpret(Int, Ptr{Int}(x2.ptr)),
            reinterpret(Int, Base.unsafe_convert(Ptr{Ptr{Int}}, out1)),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
        )
        primary = Int(r)
        o1 = LibPARI.Gen(out1[])
        LibPARI._set_avma(av)
        return (primary, o1)
    end
end

"matadjoint(M,{flag=0}): adjoint matrix of M using Leverrier-Faddeev's\nalgorithm. If flag is 1, computes the characteristic polynomial independently\nfirst."
function matadjoint0(x1::LibPARI.Gen; x2::Integer = 0)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:matadjoint0, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(x2),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"matalgtobasis(nf,x): nfalgtobasis applied to every element of the\nvector or matrix x."
function matalgtobasis(x1::LibPARI.Gen, x2::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:matalgtobasis, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"matbasistoalg(nf,x): nfbasistoalg applied to every element of the\nmatrix or vector x."
function matbasistoalg(x1::LibPARI.Gen, x2::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:matbasistoalg, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"matcompanion(x): companion matrix to polynomial x."
function matcompanion(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:matcompanion, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"matconcat(v): concatenate the entries of v and return the resulting\nmatrix."
function matconcat(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:matconcat, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"matdet(x,{flag=0}): determinant of the matrix x using an appropriate\nalgorithm depending on the coefficients. If (optional) flag is set to 1, use\nclassical Gaussian elimination (usually worse than the default)."
function det0(x1::LibPARI.Gen; x2::Integer = 0)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:det0, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(x2),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"matdetint(B): some multiple of the determinant of the lattice\ngenerated by the columns of B (0 if not of maximal rank). Useful with\nmathnfmod."
function detint(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:detint, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"matdetmod(x,d): determinant of the matrix x modulo d."
function matdetmod(x1::LibPARI.Gen, x2::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:matdetmod, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"matdiagonal(x): creates the diagonal matrix whose diagonal entries are\nthe entries of the vector x."
function diagonal(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:diagonal, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"mateigen(x,{flag=0}): complex eigenvectors of the matrix x given as\ncolumns of a matrix H. If flag=1, return [L,H], where L contains the\neigenvalues and H the corresponding eigenvectors."
function mateigen(x1::LibPARI.Gen; x2::Integer = 0, prec::Integer = 4)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:mateigen, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(x2),
                prec,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"matfrobenius(M,{flag},{v='x}): return the Frobenius form of the square\nmatrix M. If flag is 1, return only the elementary divisors as a vector of\npolynomials in the variable v. If flag is 2, return a two-components vector\n[F,B] where F is the Frobenius form and B is the basis change so that\nM=B^-1*F*B."
function matfrobenius(x1::LibPARI.Gen; x2::Integer = 0, x3::Integer = -1)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:matfrobenius, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(x2),
                Int(x3),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"mathess(x): Hessenberg form of x."
function hess(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:hess, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"mathilbert(n): Hilbert matrix of order n."
function mathilbert(x1::Integer)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:mathilbert, LibPARI.PARI_jll.libpari)),
                1,
                Int(x1),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"mathnf(M,{flag=0}): (upper triangular) Hermite normal form of M, basis\nfor the lattice formed by the columns of M. Basic values of flag are\n0 (default): only return the Hermite normal form H,\n1: return [H,U] such that H is the HNF of M, and U is an invertible matrix\nsuch that MU=H. These two use a naive algorithm; larger values of flag\ncorrespond to more involved algorithms and are restricted to integer\nmatrices; flag = 4: returns [H,U] using LLL reduction along the way;\nflag = 5: return [H,U,P] where P is a permutation of row indices such that\nP applied to M U is H."
function mathnf0(x1::LibPARI.Gen; x2::Integer = 0)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:mathnf0, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(x2),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"mathnfmod(x,d): (upper triangular) Hermite normal form of x, basis for\nthe lattice formed by the columns of x, where d is a multiple of the\nnonzero determinant of this lattice."
function hnfmod(x1::LibPARI.Gen, x2::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:hnfmod, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"mathnfmodid(x,d): (upper triangular) Hermite normal form of x\nconcatenated with matdiagonal(d)."
function hnfmodid(x1::LibPARI.Gen, x2::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:hnfmodid, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"mathouseholder(Q,v): applies a sequence Q of Householder transforms\nto the vector or matrix v."
function mathouseholder(x1::LibPARI.Gen, x2::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:mathouseholder, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"matid(n): identity matrix of order n."
function matid(x1::Integer)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:matid, LibPARI.PARI_jll.libpari)),
                1,
                Int(x1),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"matimage(x,{flag=0}): basis of the image of the matrix x. flag is\noptional and can be set to 0 or 1, corresponding to two different algorithms."
function matimage0(x1::LibPARI.Gen; x2::Integer = 0)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:matimage0, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(x2),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"matimagecompl(x): vector of column indices not corresponding to the\nindices given by the function matimage."
function imagecompl(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:imagecompl, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"matimagemod(x,d,&U): basis of the image of the matrix x modulo d."
function matimagemod(x1::LibPARI.Gen, x2::LibPARI.Gen)
    return LibPARI.protected_call() do
        out1 = Ref{Ptr{Int}}(C_NULL)
        av = LibPARI._avma()
        r = LibPARI._trap_call(
            Ptr{Int},
            cglobal((:matimagemod, LibPARI.PARI_jll.libpari)),
            3,
            reinterpret(Int, Ptr{Int}(x1.ptr)),
            reinterpret(Int, Ptr{Int}(x2.ptr)),
            reinterpret(Int, Base.unsafe_convert(Ptr{Ptr{Int}}, out1)),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
        )
        primary = LibPARI.Gen(r)
        o1 = LibPARI.Gen(out1[])
        LibPARI._set_avma(av)
        return (primary, o1)
    end
end

"matindexrank(M): gives two extraction vectors (rows and columns) for\nthe matrix M such that the extracted matrix is square of maximal rank."
function indexrank(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:indexrank, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"matintersect(x,y): intersection of the vector spaces whose bases are\nthe columns of x and y."
function intersect(x1::LibPARI.Gen, x2::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:intersect, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"matinverseimage(x,y): an element of the inverse image of the vector y\nby the matrix x if one exists, the empty vector otherwise."
function inverseimage(x1::LibPARI.Gen, x2::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:inverseimage, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"matinvmod(x,d): left inverse of the matrix x modulo d."
function matinvmod(x1::LibPARI.Gen, x2::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:matinvmod, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"matisdiagonal(x): true(1) if x is a diagonal matrix, false(0)\notherwise."
function isdiagonal(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        Int(
            LibPARI._trap_call(
                Cint,
                cglobal((:isdiagonal, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            ),
        )
    end
end

"matker(x,{flag=0}): basis of the kernel of the matrix x. flag is\noptional, and may be set to 0: default; nonzero: x is known to have\nintegral entries."
function matker0(x1::LibPARI.Gen; x2::Integer = 0)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:matker0, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(x2),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"matkerint(x,{flag=0}): LLL-reduced Z-basis of the kernel of the matrix\nx with integral entries; flag is deprecated, kept for backward compatibility."
function matkerint0(x1::LibPARI.Gen; x2::Integer = 0)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:matkerint0, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(x2),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"matkermod(x,d,&im): basis of the kernel of the matrix x modulo d."
function matkermod(x1::LibPARI.Gen, x2::LibPARI.Gen)
    return LibPARI.protected_call() do
        out1 = Ref{Ptr{Int}}(C_NULL)
        av = LibPARI._avma()
        r = LibPARI._trap_call(
            Ptr{Int},
            cglobal((:matkermod, LibPARI.PARI_jll.libpari)),
            3,
            reinterpret(Int, Ptr{Int}(x1.ptr)),
            reinterpret(Int, Ptr{Int}(x2.ptr)),
            reinterpret(Int, Base.unsafe_convert(Ptr{Ptr{Int}}, out1)),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
        )
        primary = LibPARI.Gen(r)
        o1 = LibPARI.Gen(out1[])
        LibPARI._set_avma(av)
        return (primary, o1)
    end
end

"matmuldiagonal(x,d): product of matrix x by diagonal matrix whose\ndiagonal coefficients are those of the vector d, equivalent but faster than\nx*matdiagonal(d)."
function matmuldiagonal(x1::LibPARI.Gen, x2::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:matmuldiagonal, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"matmultodiagonal(x,y): product of matrices x and y, knowing that the\nresult will be a diagonal matrix. Much faster than general multiplication in\nthat case."
function matmultodiagonal(x1::LibPARI.Gen, x2::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:matmultodiagonal, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"matpascal(n,{q}): Pascal triangle of order n if q is omitted. q-Pascal\ntriangle otherwise."
function matqpascal(x1::Integer; x2 = nothing)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:matqpascal, LibPARI.PARI_jll.libpari)),
                2,
                Int(x1),
                reinterpret(Int, Ptr{Int}((x2 === nothing ? C_NULL : x2.ptr))),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"matpermanent(x): permanent of the matrix x."
function matpermanent(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:matpermanent, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"matqr(M,{flag=0}): returns [Q,R], the QR-decomposition of the square\ninvertible matrix M. If flag=1, Q is given as a sequence of Householder\ntransforms (faster and stabler)."
function matqr(x1::LibPARI.Gen; x2::Integer = 0, prec::Integer = 4)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:matqr, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(x2),
                prec,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"matrank(x): rank of the matrix x."
function rank(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        Int(
            LibPARI._trap_call(
                Int,
                cglobal((:rank, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            ),
        )
    end
end

"matreduce(m): reduce the factorization matrix m to canonical form\n(sorted first row with unique elements)\nmatrix."
function matreduce(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:matreduce, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"matrixqz(A,{p=0}): if p>=0, transforms the rational or integral mxn (m>=n)\nmatrix A into an integral matrix with gcd of maximal determinants coprime to\np. If p=-1, finds a basis of the intersection with Z^n of the lattice spanned\nby the columns of A. If p=-2, finds a basis of the intersection with Z^n of\nthe Q-vector space spanned by the columns of A."
function matrixqz0(x1::LibPARI.Gen; x2 = nothing)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:matrixqz0, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}((x2 === nothing ? C_NULL : x2.ptr))),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"matsize(x): number of rows and columns of the vector/matrix x as a\n2-vector."
function matsize(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:matsize, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"matsnf(X,{flag=0}): Smith normal form (i.e. elementary divisors) of\nthe matrix X, expressed as a vector d; X must have integer or polynomial\nentries. Binary digits of flag mean 1: returns\n[u,v,d] where d=u*X*v, otherwise only the diagonal d is returned,\n4: removes all information corresponding to entries equal to 1 in d."
function matsnf0(x1::LibPARI.Gen; x2::Integer = 0)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:matsnf0, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(x2),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"matsolve(M,B): solution of MX=B (M matrix, B column vector or matrix)."
function gauss(x1::LibPARI.Gen, x2::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:gauss, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"matsolvemod(M,D,B,{flag=0}): one solution of system of congruences\nMX=B mod D (M matrix, B and D column vectors). If (optional) flag is\nnonzero return all solutions."
function matsolvemod(
    x1::LibPARI.Gen,
    x2::LibPARI.Gen,
    x3::LibPARI.Gen;
    x4::Integer = 0,
)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:matsolvemod, LibPARI.PARI_jll.libpari)),
                4,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                reinterpret(Int, Ptr{Int}(x3.ptr)),
                Int(x4),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"matsupplement(x): supplement the columns of the matrix x to an\ninvertible matrix."
function suppl(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:suppl, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"max(x,y): maximum of x and y."
function gmax(x1::LibPARI.Gen, x2::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:gmax, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"mfDelta(): mf corresponding to the Ramanujan Delta function."
function mfDelta()
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:mfDelta, LibPARI.PARI_jll.libpari)),
                0,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"mfEH(k): k>0 being in 1/2+Z, mf corresponding to the Cohen-Eisenstein\nseries H_k of weight k on G_0(4)."
function mfEH(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:mfEH, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"mfEk(k): mf corresponding to the standard Eisenstein series\nE_k for nonnegative even integer k."
function mfEk(x1::Integer)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:mfEk, LibPARI.PARI_jll.libpari)),
                1,
                Int(x1),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"mfTheta({psi=1}): the unary theta function corresponding to the primitive\nDirichlet character psi, hence of weight 1/2 if psi is even, of weight 3/2\nif psi is odd."
function mfTheta(; x1 = nothing)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:mfTheta, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}((x1 === nothing ? C_NULL : x1.ptr))),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"mfatkin(mfatk,f): Given an mfatk output by mfatk = mfatkininit(mf,Q)\nand a modular form f belonging to the space mf, returns the modular form\ng = C*f|W_Q where C = mfatk[3] is a normalizing constant so that g\nhas the same field of coefficients as f; mfatk[1] = mf2 (or 0 if mf2=mf)\nwhich is the space to which g belongs."
function mfatkin(x1::LibPARI.Gen, x2::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:mfatkin, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"mfatkineigenvalues(mf,Q): given a modular form space mf\nand a primitive divisor Q of the level of mf, outputs the corresponding\nAtkin-Lehner eigenvalues on the new space, grouped by orbit."
function mfatkineigenvalues(x1::LibPARI.Gen, x2::Integer; prec::Integer = 4)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:mfatkineigenvalues, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(x2),
                prec,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"mfatkininit(mf,Q): initializes data necessary for working\nwith Atkin--Lehner operators W_Q, for now only the function mfatkin.\nThe result is a 4-component vector [mfB, MC, C, mf] where mfB is either\n0 or the possibly different modular form space to which F|W_Q will belong\n(this does not depend on F in mf); MC is the matrix of W_Q on the basis of mf\nmultiplied by a normalizing constant C."
function mfatkininit(x1::LibPARI.Gen, x2::Integer; prec::Integer = 4)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:mfatkininit, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(x2),
                prec,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"mfbasis(NK,{space=4}): If NK=[N,k,CHI] as in mfinit, gives a basis of\nthe corresponding subspace of M_k(G_0(N),CHI). NK can also be the output of\nmfinit, in which case space is ignored. To obtain the eigenforms use\nmfeigenbasis."
function mfbasis(x1::LibPARI.Gen; x2::Integer = 4)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:mfbasis, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(x2),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"mfbd(F,d): F being a generalized modular form, return B(d)(F), where\nB(d) is the expanding operator tau -> d tau."
function mfbd(x1::LibPARI.Gen, x2::Integer)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:mfbd, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(x2),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"mfbracket(F,G,{m=0}): compute the\nm-th Rankin-Cohen bracket of the generalized modular forms F and G."
function mfbracket(x1::LibPARI.Gen, x2::LibPARI.Gen; x3::Integer = 0)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:mfbracket, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(x3),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"mfcoef(F,n): Compute the n-th Fourier coefficient a(n) of the\ngeneralized modular form F."
function mfcoef(x1::LibPARI.Gen, x2::Integer)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:mfcoef, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(x2),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"mfcoefs(F,n,{d=1}): Compute the vector of coefficients\n[a[0],a[d],...,a[nd]] of the modular form F."
function mfcoefs(x1::LibPARI.Gen, x2::Integer; x3::Integer = 1)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:mfcoefs, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(x2),
                Int(x3),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"mfconductor(mf,F): mf being output by mfinit and F a modular form,\ngives the smallest level at which F is defined."
function mfconductor(x1::LibPARI.Gen, x2::LibPARI.Gen)
    return LibPARI.protected_call() do
        Int(
            LibPARI._trap_call(
                Int,
                cglobal((:mfconductor, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            ),
        )
    end
end

"mfcosets(N): list of right cosets of G_0(N)\\G, i.e., matrices g_j in G\nsuch that G = U G_0(N) g_j. The g_j are chosen in the form [a,b; c,d] with\nc | N."
function mfcosets(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:mfcosets, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"mfcuspisregular(NK,cusp): In the space defined by NK = [N,k,CHI] or\nNK = mf, determine if cusp in canonical format (oo or denominator\ndividing N) is regular or not."
function mfcuspisregular(x1::LibPARI.Gen, x2::LibPARI.Gen)
    return LibPARI.protected_call() do
        Int(
            LibPARI._trap_call(
                Int,
                cglobal((:mfcuspisregular, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            ),
        )
    end
end

"mfcusps(N): list of cusps of G_0(N) in the form a/b with b dividing N."
function mfcusps(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:mfcusps, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"mfcuspval(mf,F,cusp): valuation of modular form F in the space mf at\ncusp, which can be either oo or any rational number. The result is\neither a rational number or oo if F is zero. Let chi be the Nebentypus of\nthe space mf; if Q(F) != Q(chi), return the vector of valuations attached to\nthe [Q(F):Q(chi)] complex embeddings of F."
function mfcuspval(
    x1::LibPARI.Gen,
    x2::LibPARI.Gen,
    x3::LibPARI.Gen;
    bitprec::Integer = 128,
)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:mfcuspval, LibPARI.PARI_jll.libpari)),
                4,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                reinterpret(Int, Ptr{Int}(x3.ptr)),
                bitprec,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"mfcuspwidth(N,cusp): width of cusp in Gamma_0(N)."
function mfcuspwidth(x1::LibPARI.Gen, x2::LibPARI.Gen)
    return LibPARI.protected_call() do
        Int(
            LibPARI._trap_call(
                Int,
                cglobal((:mfcuspwidth, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            ),
        )
    end
end

"mfderiv(F,{m=1}): m-th formal derivative of the power series\ncorresponding to the generalized modular form F, with respect to the\ndifferential operator q.d/dq (default m=1)."
function mfderiv(x1::LibPARI.Gen; x2::Integer = 1)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:mfderiv, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(x2),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"mfderivE2(F,{m=1}): compute the Serre derivative (q.d/dq)F - kE_2F/12\nof the generalized modular form F of weight k; and if m > 1, the m-th iterate."
function mfderivE2(x1::LibPARI.Gen; x2::Integer = 1)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:mfderivE2, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(x2),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"mfdescribe(F,{&G}): gives a human-readable description of F, which is\neither a modular form space or a modular form. If the address of G is given,\nputs into G the vector of parameters of the outmost operator defining F."
function mfdescribe(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        out1 = Ref{Ptr{Int}}(C_NULL)
        av = LibPARI._avma()
        r = LibPARI._trap_call(
            Ptr{Int},
            cglobal((:mfdescribe, LibPARI.PARI_jll.libpari)),
            2,
            reinterpret(Int, Ptr{Int}(x1.ptr)),
            reinterpret(Int, Base.unsafe_convert(Ptr{Ptr{Int}}, out1)),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
        )
        primary = LibPARI.Gen(r)
        o1 = LibPARI.Gen(out1[])
        LibPARI._set_avma(av)
        return (primary, o1)
    end
end

"mfdim(NK,{space=4}): If NK=[N,k,CHI] as in\nmfinit, gives the dimension of the corresponding subspace of\nM_k(G_0(N),chi). The subspace is described by a small integer 'space': 0 for\nthe newspace, 1 for the cuspidal space, 2 for the oldspace, 3 for the space\nof Eisenstein series and 4 (default) for the full space M_k.\nNK can also be the output of mfinit, in which case space must be omitted."
function mfdim(x1::LibPARI.Gen; x2::Integer = 4)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:mfdim, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(x2),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"mfdiv(F,G): compute F/G for two modular forms F and G assuming\nthat the quotient will not have poles at infinity. If this is the\ncase, use mfshift before doing the division."
function mfdiv(x1::LibPARI.Gen, x2::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:mfdiv, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"mfeigenbasis(mf): vector of the eigenforms for the space mf."
function mfeigenbasis(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:mfeigenbasis, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"mfeigensearch(NK,{AP}): search for normalized rational eigen cuspforms\nwith quadratic characters given a few initial coefficients. The meaning of\nthe parameters is as follows:\n\nNK is of the form [N,k]: search given level N, weight k and quadratic\ncharacter; note that the character is uniquely determined by (N,k).\nThe level N can be replaced by a vector of allowed levels.\n\nAP is the search criterion, which can be omitted: a list of pairs\n[...,[p,a_p],...], where a_p is either a t_INT (exact match) or a t_INTMOD\n(match modulo the given integer).\n\nThe result is a vector of newforms matching the search criteria, sorted by\nincreasing level."
function mfeigensearch(x1::LibPARI.Gen; x2 = nothing)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:mfeigensearch, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}((x2 === nothing ? C_NULL : x2.ptr))),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"mfeisenstein(k,{CHI1},{CHI2}): create the Eisenstein\nE_k(CHI1,CHI2), where an omitted character is considered as trivial."
function mfeisenstein(x1::Integer; x2 = nothing, x3 = nothing)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:mfeisenstein, LibPARI.PARI_jll.libpari)),
                3,
                Int(x1),
                reinterpret(Int, Ptr{Int}((x2 === nothing ? C_NULL : x2.ptr))),
                reinterpret(Int, Ptr{Int}((x3 === nothing ? C_NULL : x3.ptr))),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"mfembed(f,{v}):\nif v is omitted, f must be a modular form or a modular form\nspace with parameters [N,k,chi] and we return a vector of complex\nembeddings of Q(f) or Q(chi), respectively.\n\nIf v is given, it must be a scalar in Q(f), or a vector/matrix of such,\nwe apply the embeddings coefficientwise and return a vector of results.\nFinally f can be replaced by a single embedding produced by mfembed(f)\nand we apply that particular embedding to v. Note that, in our context,\nQ(chi) has a single canonical embeding given by s: Mod(t, polcyclo(n,t))\n-> exp(2*I*Pi/n) and Q(f) has [Q(f):Q(chi)] induced embeddings attached\nto the complex roots of s(P) where P = mfparams(f)[4], as ordered by\npolroots. In the latter case, we only support an f with Q(f) = Q(chi) or\nan eigenform produced by mfeigenbasis."
function mfembed0(x1::LibPARI.Gen; x2 = nothing, prec::Integer = 4)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:mfembed0, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}((x2 === nothing ? C_NULL : x2.ptr))),
                prec,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"mfeval(mf,F,vtau): computes the numerical value of the modular form F\nat the point vtau or the vector vtau of points in the completed\nupper-half plane."
function mfeval(
    x1::LibPARI.Gen,
    x2::LibPARI.Gen,
    x3::LibPARI.Gen;
    bitprec::Integer = 128,
)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:mfeval, LibPARI.PARI_jll.libpari)),
                4,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                reinterpret(Int, Ptr{Int}(x3.ptr)),
                bitprec,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"mffields(mf): If mf is output by mfinit, gives the\nvector of polynomials defining each Galois orbit of the new space."
function mffields(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:mffields, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"mffromell(E): E being an elliptic curve defined over Q given by an\nintegral model in ellinit format, computes a 3-component vector [mf,F,v],\nwhere F is the newform corresponding to E by modularity, mf is the\nnewspace to which F belongs, and v gives the coefficients of F on\nmfbasis(mf)."
function mffromell(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:mffromell, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"mffrometaquo(eta,{flag=0}): modular form corresponding to the eta\nquotient matrix eta. If the valuation v at infinity is fractional, returns 0.\nIf the eta quotient is not holomorphic but simply meromorphic, returns 0 if\nflag=0; returns the eta quotient (divided by q to the power -v if v < 0, i.e.,\nwith valuation 0) if flag is set."
function mffrometaquo(x1::LibPARI.Gen; x2::Integer = 0)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:mffrometaquo, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(x2),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"mffromlfun(L): L being an L-function representing a self-dual modular\nform, return [NK,space,v] where mf=mfinit(NK,space) contains the form\nand mftobasis(mf, v)\ncontaining it and v is mftobasis(mf,f)."
function mffromlfun(x1::LibPARI.Gen; prec::Integer = 4)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:mffromlfun, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                prec,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"mffromqf(Q,{P}): Q being an even positive definite quadratic form\nand P a homogeneous spherical polynomial for Q, computes a 3-component vector\n[mf,F,coeffs], where F is the theta function corresponding to (Q, P), mf is\nthe corresponding space of modular forms from mfinit, and coeffs are the\ncoefficients of F on mfbasis(mf)."
function mffromqf(x1::LibPARI.Gen; x2 = nothing)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:mffromqf, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}((x2 === nothing ? C_NULL : x2.ptr))),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"mfgaloisprojrep(mf,F): mf being an mf output by mfinit in weight 1,\nand F an eigenform, returns a polynomial defining the field fixed by the\nkernel of the projective representation associated to F."
function mfgaloisprojrep(x1::LibPARI.Gen, x2::LibPARI.Gen; prec::Integer = 4)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:mfgaloisprojrep, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                prec,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"mfgaloistype(NK,{F}): NK being either [N,1,CHI] or an mf\noutput by mfinit in weight 1 , gives the vector of\ntypes of Galois representations attached to each cuspidal eigenform,\nunless the eigenform F is specified, in which case only for F.\nTypes A_4, S_4, A_5 are represented by minus their cardinality -12, -24,\nor -60, and type D_n is represented by its cardinality, the integer 2*n."
function mfgaloistype(x1::LibPARI.Gen; x2 = nothing)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:mfgaloistype, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}((x2 === nothing ? C_NULL : x2.ptr))),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"mfhecke(mf,F,n): F being a modular form in space mf, returns T(n)F,\nwhere T(n) is the n-th Hecke operator. Warning: if F is of level M<N,\nT(n)F is in general not the same in M_k(G_0(M),CHI) and in M_k(G_0(N),CHI).\nWe take T(n) at the same level as the one used in mf."
function mfhecke(x1::LibPARI.Gen, x2::LibPARI.Gen, x3::Integer)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:mfhecke, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(x3),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"mfheckemat(mf,vecn): if vecn is an integer, matrix of the Hecke operator\nT(n) on the basis formed by mfbasis(mf), if it is a vector, vector of such\nmatrices."
function mfheckemat(x1::LibPARI.Gen, x2::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:mfheckemat, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"mfinit(NK,{space=4}): Create the space of modular forms corresponding\nto the data contained in NK and space. NK is a vector which can be\neither [N,k] (N level, k weight) corresponding to a subspace of M_k(G_0(N)),\nor [N,k,CHI] (CHI a character) corresponding to a subspace of M_k(G_0(N),chi).\nThe subspace is described by a small integer 'space': 0 for the newspace,\n1 for the cuspidal space, 2 for the oldspace, 3 for the space of Eisenstein\nseries and 4 (default) for the full space M_k"
function mfinit(x1::LibPARI.Gen; x2::Integer = 4)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:mfinit, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(x2),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"mfisCM(F): Tests whether the eigenform F is a CM form. The answer\nis 0 if it is not, and if it is, either the unique negative discriminant\nof the CM field, or the pair of two negative discriminants of CM fields,\nthis latter case occurring only in weight 1 when the projective image is\nD2=C2xC2, i.e., coded 4 by mfgaloistype."
function mfisCM(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:mfisCM, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"mfisequal(F,G,{lim=0}): Checks whether the modular forms F and G\nare equal. If lim is nonzero, only check equality of the first lim+1 Fourier\ncoefficients."
function mfisequal(x1::LibPARI.Gen, x2::LibPARI.Gen; x3::Integer = 0)
    return LibPARI.protected_call() do
        Int(
            LibPARI._trap_call(
                Int,
                cglobal((:mfisequal, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(x3),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            ),
        )
    end
end

"mfisetaquo(f,{flag=0}): if the generalized modular form f\nis a holomorphic eta quotient, return the eta quotient matrix, else return 0.\nIf flag is set, also accept meromorphic eta quotients."
function mfisetaquo(x1::LibPARI.Gen; x2::Integer = 0)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:mfisetaquo, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(x2),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"mfkohnenbasis(mf): mf being a cuspidal space of half-integral weight\nk >= 3/2, gives a basis B of the Kohnen + space of mf as a matrix\nwhose columns are the coefficients of B on the basis of mf."
function mfkohnenbasis(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:mfkohnenbasis, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"mfkohnenbijection(mf): mf being a cuspidal space of half-integral weight\nreturns [mf2,M,K,shi], where M is a matrix giving a Hecke-module\nisomorphism from S_{2k-1}(N,CHI^2) given by mf2 to the Kohnen + space\nS_k+(4N,CHI), K is a basis of the Kohnen + space, and shi gives\nthe linear combination of Shimura lifts giving M^(-1)."
function mfkohnenbijection(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:mfkohnenbijection, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"mfkohneneigenbasis(mf,bij): mf being a cuspidal space of half-integral\nweight k >= 3/2 and bij being the output of mfkohnenbijection(mf), outputs\na 3-component vector [mf0,BNEW,BEIGEN], where BNEW and BEIGEN are two\nmatrices whose columns are the coefficients of a basis of the Kohnen new\nspace and of the eigenforms on the basis of mf respectively, and mf0 is\nthe corresponding new space of integral weight 2k - 1."
function mfkohneneigenbasis(x1::LibPARI.Gen, x2::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:mfkohneneigenbasis, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"mflinear(vF,v): vF being a vector of modular forms and v\na vector of coefficients of same length, compute the linear\ncombination of the entries of vF with coefficients v."
function mflinear(x1::LibPARI.Gen, x2::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:mflinear, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"mfmanin(FS): Given the modular symbol FS associated to an eigenform F\nby mfsymbol(mf,F), computes the odd and even special polynomials as well as\nthe odd and even periods om- and om+ as a vector [[P-,P+],[om-,om+,r]],\nwhere r = imag(om+*conj(om-))/<F,F>.\nIf F has several embeddings into C, give the vector of results corresponding\nto each embedding."
function mfmanin(x1::LibPARI.Gen; bitprec::Integer = 128)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:mfmanin, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                bitprec,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"mfmul(F,G): Multiply the two forms F and G."
function mfmul(x1::LibPARI.Gen, x2::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:mfmul, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"mfnumcusps(N): number of cusps of Gamma_0(N)"
function mfnumcusps(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:mfnumcusps, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"mfparams(F): If F is a modular form space, returns [N,k,CHI,space,Phi]:\nlevel, weight, character, and space code; where Phi is the cyclotomic\npolynomial defining the field of values of CHI. If F is a modular form,\nreturns [N,k,CHI,P,Phi], where P is the (polynomial giving the) field of\ndefinition of F: in that case the level N may be a multiple of the level of F\nand the polynomial P may define a larger field than Q(F)."
function mfparams(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:mfparams, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"mfperiodpol(mf,f,{flag=0}): period polynomial of the cuspidal part of\nthe form f, in other words integral from 0 to ioo of (X-tau)^(k-2)f(tau).\nIf flag=0, ordinary period polynomial, if flag=1 or -1, even or odd\npart of that polynomial. f can also be the modular symbol output by\nmfsymbol(mf,f)."
function mfperiodpol(
    x1::LibPARI.Gen,
    x2::LibPARI.Gen;
    x3::Integer = 0,
    bitprec::Integer = 128,
)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:mfperiodpol, LibPARI.PARI_jll.libpari)),
                4,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(x3),
                bitprec,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"mfperiodpolbasis(k,{flag=0}): basis of period polynomials for weight k.\nIf flag=1 or -1, basis of odd or even period polynomials."
function mfperiodpolbasis(x1::Integer; x2::Integer = 0)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:mfperiodpolbasis, LibPARI.PARI_jll.libpari)),
                2,
                Int(x1),
                Int(x2),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"mfpetersson(fs,{gs}): Petersson scalar product of the modular\nforms f and g belonging to the same modular form space mf, given by\nthe corresponding \"modular symbols\" fs and gs output by mfsymbol\n(also in weight 1 and half-integral weight). If gs is omitted\nit is understood to be equal to fs. The scalar product is normalized by the\nfactor 1/[G:G_0(N)]."
function mfpetersson(x1::LibPARI.Gen; x2 = nothing)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:mfpetersson, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}((x2 === nothing ? C_NULL : x2.ptr))),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"mfpow(F,n): compute F^n"
function mfpow(x1::LibPARI.Gen, x2::Integer)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:mfpow, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(x2),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"mfsearch(NK,V,{space}): NK being of the form [N,k] with k possibly\nhalf-integral, search for a modular form with rational coefficients, of weight\nk and level N, whose initial coefficients a(0),... are equal to V; space\nspecifies the modular form spaces in which to search. The output is a list\nof matching forms with that given level and weight. Note that the character\nis of the form (D/.), where D is a (positive or negative) fundamental\ndiscriminant dividing N.\n\nN can be replaced by a vector of allowed levels, in which case the list of\nforms is sorted by increasing level, then increasing |D|. If a form is found\nat level N, any multiple of N with the same D is not considered\n\nNote that this is very different from mfeigensearch, which only searches for\nrational eigenforms."
function mfsearch(x1::LibPARI.Gen, x2::LibPARI.Gen; x3::Integer = 4)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:mfsearch, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(x3),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"mfshift(F,s): Divide the form F by q^s omitting the remainder if there\nis one; s can be negative."
function mfshift(x1::LibPARI.Gen, x2::Integer)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:mfshift, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(x2),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"mfshimura(mf,F,{D=1}): F being a modular form of\nhalf-integral weight k >= 3/2 and D a positive squarefree integer,\ncomputes the Shimura lift G of weight 2k-1 corresponding to D. This function\nreturns [mf2,G,v], where mf2 is a modular form space containing G, and v the\nvector of coefficients of G on mf."
function mfshimura(x1::LibPARI.Gen, x2::LibPARI.Gen; x3::Integer = 1)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:mfshimura, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(x3),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"mfslashexpansion(mf,f,g,n,flrat,{&params}): g being in M_2^+(Q),\ncomputes the Fourier expansion of f|_k g to n terms. f must belong to\nthe space mf. If params is given, it is set to the parameters [alpha,w,A].\nIf flrat is 1, the program tries to rationalize the expression; if flag\nis 0, it does not."
function mfslashexpansion(
    x1::LibPARI.Gen,
    x2::LibPARI.Gen,
    x3::LibPARI.Gen,
    x4::Integer,
    x5::Integer;
    prec::Integer = 4,
)
    return LibPARI.protected_call() do
        out1 = Ref{Ptr{Int}}(C_NULL)
        av = LibPARI._avma()
        r = LibPARI._trap_call(
            Ptr{Int},
            cglobal((:mfslashexpansion, LibPARI.PARI_jll.libpari)),
            7,
            reinterpret(Int, Ptr{Int}(x1.ptr)),
            reinterpret(Int, Ptr{Int}(x2.ptr)),
            reinterpret(Int, Ptr{Int}(x3.ptr)),
            Int(x4),
            Int(x5),
            reinterpret(Int, Base.unsafe_convert(Ptr{Ptr{Int}}, out1)),
            prec,
            Int(0),
        )
        primary = LibPARI.Gen(r)
        o1 = LibPARI.Gen(out1[])
        LibPARI._set_avma(av)
        return (primary, o1)
    end
end

"mfspace(mf,{f}): identify the modular space mf, resp. the modular form f\nin mf. Returns 0 (newspace), 1 (cuspidal space), 2 (old space),\n3 (Eisenstein space) or 4 (full space). Return -1 when the form does not\nbelong to the space."
function mfspace(x1::LibPARI.Gen; x2 = nothing)
    return LibPARI.protected_call() do
        Int(
            LibPARI._trap_call(
                Int,
                cglobal((:mfspace, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}((x2 === nothing ? C_NULL : x2.ptr))),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            ),
        )
    end
end

"mfsplit(mf,{dimlim=0},{flag=0}): mf containing the new space\nsplit the new space into Galois\norbits of eigenforms of the newspace and return [vF,vK], where vF gives\nthe (Galois orbit of) eigenforms in terms of mfbasis(mf) and vK is a list of\npolynomials defining each Galois orbit. If dimlim is set only the Galois\norbits of dimension <= dimlim are computed (i.e. the rational eigenforms if\ndimlim = 1 and the character is real). Flag speeds up computations when the\ndimension is large: if flag = d > 0, when the dimension of the eigenspace\nis > d, only the Galois polynomial is computed."
function mfsplit(x1::LibPARI.Gen; x2::Integer = 0, x3::Integer = 0)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:mfsplit, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(x2),
                Int(x3),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"mfsturm(NK): Sturm bound for modular forms on G_0(N) and\nweight k, i.e., an upper bound for the order of the zero at infinity of\na nonzero form. NK is either [N,k] or an mfinit (exact bound in the\nlatter case)."
function mfsturm(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        Int(
            LibPARI._trap_call(
                Int,
                cglobal((:mfsturm, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            ),
        )
    end
end

"mfsymbol(mf,f): Initialize data for working with all period\npolynomials of the modular form f: this is essential for efficiency\nfor functions such as mfsymboleval, mfmanin, and mfpetersson. By abuse\nof language, initialize data for working with mfpetersson in weight 1\nor half-integral weight (where no symbol exist)."
function mfsymbol(x1::LibPARI.Gen; x2 = nothing, bitprec::Integer = 128)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:mfsymbol, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}((x2 === nothing ? C_NULL : x2.ptr))),
                bitprec,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"mfsymboleval(fs,path,{ga=id}): evaluation of the modular\nsymbol fs output by mfsymbol on the given path, where path is either a vector\n[s1,s2] or an integral matrix [a,b;c,d] representing the path [a/c,b/d].\nIn both cases, s1 or s2 (or a/c or b/d) can also be elements of the upper\nhalf-plane. The result is the polynomial equal to the integral between s1 and\ns2 of (X-tau)^{k-2}F(tau). If ga in GL_2+(Q) is given, replace F by F|_k ga.\nIf the integral diverges, the result will be a rational function."
function mfsymboleval(
    x1::LibPARI.Gen,
    x2::LibPARI.Gen;
    x3 = nothing,
    bitprec::Integer = 128,
)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:mfsymboleval, LibPARI.PARI_jll.libpari)),
                4,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                reinterpret(Int, Ptr{Int}((x3 === nothing ? C_NULL : x3.ptr))),
                bitprec,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"mftaylor(F,n,{flreal=0}): F being a modular form in M_k(SL_2(Z)),\ncomputes the first n+1 canonical Taylor expansion of F around tau=I. If\nflreal=0, computes only an algebraic equivalence class. If flreal is set,\ncompute p_n such that for tau close enough to I we have\nf(tau)=(2I/(tau+I))^ksum_{n>=0}p_n((tau-I)/(tau+I))^n."
function mftaylor(
    x1::LibPARI.Gen,
    x2::Integer;
    x3::Integer = 0,
    prec::Integer = 4,
)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:mftaylor, LibPARI.PARI_jll.libpari)),
                4,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(x2),
                Int(x3),
                prec,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"mftobasis(mf,F,{flag=0}): coefficients of the form F on the\nbasis given by the mfbasis(mf). A q-expansion or vector of\ncoefficients can also be given instead of F, but in this case an error\nmessage may occur if the expansion is too short. An error message is also\ngiven if F does not belong to the modular form space. If flag is set, instead\nof error messages return an output as an affine space of solutions if\na q-expansion or vector of coefficients is given, or the empty column\notherwise."
function mftobasis(x1::LibPARI.Gen, x2::LibPARI.Gen; x3::Integer = 0)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:mftobasis, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(x3),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"mftocoset(N,M,Lcosets): M being a matrix in SL_2(Z) and Lcosets being\nmfcosets(N), find the right coset of G_0(N) to which M belongs. The output\nis a pair [ga,i] such that M = ga * Lcosets[i], with ga in G_0(N)."
function mftocoset(x1::Integer, x2::LibPARI.Gen, x3::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:mftocoset, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, UInt(x1)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                reinterpret(Int, Ptr{Int}(x3.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"mftonew(mf,F): mf being a full or cuspidal space with parameters [N,k,chi]\nand F a cusp form in that space, returns a vector of 3-component vectors\n[M,d,G], where f(chi) divides M divides N, d divides N/M, and G is a\nform in S_k^new(G_0(M),chi) such that F is equal to the sum of the\nB(d)(G) over all these 3-component vectors."
function mftonew(x1::LibPARI.Gen, x2::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:mftonew, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"mftraceform(NK,{space=0}): If NK=[N,k,CHI,.] as in\nmfinit with k integral, gives the trace form in the corresponding subspace\nof S_k(G_0(N),chi). The supported values for space are 0: the newspace\n(default), 1: the full cuspidal space."
function mftraceform(x1::LibPARI.Gen; x2::Integer = 0)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:mftraceform, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(x2),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"mftwist(F,D): returns the twist of the form F by the\ninteger D, i.e., the form G such that mfcoef(G,n)=(D/n)mfcoef(F,n),\nwhere (D/n) is the Kronecker symbol."
function mftwist(x1::LibPARI.Gen, x2::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:mftwist, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"min(x,y): minimum of x and y."
function gmin(x1::LibPARI.Gen, x2::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:gmin, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"minpoly(A,{v='x}): minimal polynomial of the matrix or polmod A."
function minpoly(x1::LibPARI.Gen; x2::Integer = -1)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:minpoly, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(x2),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"modreverse(z): reverse polmod of the polmod z, if it exists."
function modreverse(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:modreverse, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"moebius(x): Moebius function of x."
function moebius(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        Int(
            LibPARI._trap_call(
                Int,
                cglobal((:moebius, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            ),
        )
    end
end

"msatkinlehner(M,Q,{H}): M being a full modular symbol space of level N,\nas given by msinit, let Q | N, (Q,N/Q) = 1, and let H be a subspace stable\nunder the Atkin-Lehner involution w_Q. Return the matrix of w_Q\nacting on H (M if omitted)."
function msatkinlehner(x1::LibPARI.Gen, x2::Integer; x3 = nothing)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:msatkinlehner, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(x2),
                reinterpret(Int, Ptr{Int}((x3 === nothing ? C_NULL : x3.ptr))),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"mscosets(gen,inH): gen being a system of generators for a group G and H\nbeing a subgroup of finite index of G, return a list of right cosets of H \\ G\nand the right action of G on H \\ G. The subgroup H is given by a criterion inH\n(closure) deciding whether an element of G belongs to H."
function mscosets0(x1::LibPARI.Gen, x2::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:mscosets0, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"mscuspidal(M,{flag=0}): M being a full modular symbol space, as given\nby msinit, return its cuspidal part S. If flag = 1, return [S,E] its\ndecomposition into Eisenstein and cuspidal parts."
function mscuspidal(x1::LibPARI.Gen; x2::Integer = 0)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:mscuspidal, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(x2),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"msdim(M): M being a modular symbol space or subspace,\nreturn its dimension as a Q-vector space."
function msdim(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        Int(
            LibPARI._trap_call(
                Int,
                cglobal((:msdim, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            ),
        )
    end
end

"mseisenstein(M): M being a full modular symbol space, as given by msinit,\nreturn its Eisenstein subspace."
function mseisenstein(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:mseisenstein, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"mseval(M,s,{p}): M being a full modular symbol space, as given by\nmsinit, s being a modular symbol from M and p being a path between two\nelements in P^1(Q), return s(p)."
function mseval(x1::LibPARI.Gen, x2::LibPARI.Gen; x3 = nothing)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:mseval, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                reinterpret(Int, Ptr{Int}((x3 === nothing ? C_NULL : x3.ptr))),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"msfarey(F,inH,{&CM}): F being a Farey symbol attached to a group G\ncontained in SL2(Z) and H a subgroup of G, return a Farey symbol attached\nto H; H is given by a criterion inH (closure) deciding whether an element\nof G belongs to H."
function msfarey0(x1::LibPARI.Gen, x2::LibPARI.Gen)
    return LibPARI.protected_call() do
        out1 = Ref{Ptr{Int}}(C_NULL)
        av = LibPARI._avma()
        r = LibPARI._trap_call(
            Ptr{Int},
            cglobal((:msfarey0, LibPARI.PARI_jll.libpari)),
            3,
            reinterpret(Int, Ptr{Int}(x1.ptr)),
            reinterpret(Int, Ptr{Int}(x2.ptr)),
            reinterpret(Int, Base.unsafe_convert(Ptr{Ptr{Int}}, out1)),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
        )
        primary = LibPARI.Gen(r)
        o1 = LibPARI.Gen(out1[])
        LibPARI._set_avma(av)
        return (primary, o1)
    end
end

"msfromcusp(M,c): returns the modular symbol attached to the cusp\nc, where M is a modular symbol space of level N."
function msfromcusp(x1::LibPARI.Gen, x2::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:msfromcusp, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"msfromell(E,{sign=0}): return the [M, x], where M is msinit(N,2)\nand x is the modular symbol in M attached to the elliptic curve E/Q."
function msfromell(x1::LibPARI.Gen; x2::Integer = 0)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:msfromell, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(x2),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"msfromhecke(M,v,{H}): given a msinit M and a vector v\nof pairs [p, P] (where p is prime and P is a polynomial with integer\ncoefficients), return a basis of all modular symbols such that\nP(Tp) * s = 0. If H is present, it must be a Hecke-stable subspace\nand we restrict to s in H."
function msfromhecke(x1::LibPARI.Gen, x2::LibPARI.Gen; x3 = nothing)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:msfromhecke, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                reinterpret(Int, Ptr{Int}((x3 === nothing ? C_NULL : x3.ptr))),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"msgetlevel(M): M being a full modular symbol space, as given by msinit, return its level N."
function msgetlevel(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        Int(
            LibPARI._trap_call(
                Int,
                cglobal((:msgetlevel, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            ),
        )
    end
end

"msgetsign(M): M being a full modular symbol space, as given by msinit, return its sign."
function msgetsign(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        Int(
            LibPARI._trap_call(
                Int,
                cglobal((:msgetsign, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            ),
        )
    end
end

"msgetweight(M): M being a full modular symbol space, as given by msinit, return its weight k."
function msgetweight(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        Int(
            LibPARI._trap_call(
                Int,
                cglobal((:msgetweight, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            ),
        )
    end
end

"mshecke(M,p,{H}): M being a full modular symbol space, as given by msinit,\np being a prime number, and H being a Hecke-stable subspace (M if omitted),\nreturn the matrix of T_p acting on H (U_p if p divides the level)."
function mshecke(x1::LibPARI.Gen, x2::Integer; x3 = nothing)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:mshecke, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(x2),
                reinterpret(Int, Ptr{Int}((x3 === nothing ? C_NULL : x3.ptr))),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"msinit(G,V,{sign=0}): given G a finite index subgroup of SL(2,Z)\nand a finite dimensional representation V of GL(2,Q), creates a space of\nmodular symbols, the G-module Hom_G(Div^0(P^1 Q), V). This is canonically\nisomorphic to H^1_c(X(G), V), and allows to compute modular forms for G.\nIf sign is present and nonzero, it must be +1 or -1 and we consider\nthe subspace defined by Ker (Sigma - sign), where Sigma is induced by\n[-1,0;0,1]. Currently the only supported groups are the Gamma_0(N), coded by\nthe integer N. The only supported representation is V_k = Q[X,Y]_{k-2}, coded\nby the integer k >= 2."
function msinit(x1::LibPARI.Gen, x2::LibPARI.Gen; x3::Integer = 0)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:msinit, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(x3),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"msissymbol(M,s): M being a full modular symbol space, as given by msinit,\ncheck whether s is a modular symbol attached to M."
function msissymbol(x1::LibPARI.Gen, x2::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:msissymbol, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"mslattice(M,{H}): M being a full modular symbol space,\nas given by msinit, H a Q-subspace or a matrix of modular symbols.\nReturn the canonical integral structure of H."
function mslattice(x1::LibPARI.Gen; x2 = nothing)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:mslattice, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}((x2 === nothing ? C_NULL : x2.ptr))),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"msnew(M): M being a full modular symbol space, as given by msinit,\nreturn its new cuspidal subspace."
function msnew(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:msnew, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"msomseval(Mp,PHI,path):\nreturn the vectors of moments of the p-adic distribution attached\nto the path 'path' via the overconvergent modular symbol 'PHI'."
function msomseval(x1::LibPARI.Gen, x2::LibPARI.Gen, x3::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:msomseval, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                reinterpret(Int, Ptr{Int}(x3.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"mspadicinit(M,p,n,{flag}): M being a full modular symbol space,\nas given by msinit and a prime p, initialize\ntechnical data needed to compute with overconvergent modular symbols\n(modulo p^n). If flag is unset, allow all symbols; if flag = 0, restrict\nto ordinary symbols; else initialize for symbols phi such that\nTp(phi) = a_p * phi, with v_p(a_p) >= flag."
function mspadicinit(
    x1::LibPARI.Gen,
    x2::Integer,
    x3::Integer;
    x4::Integer = -1,
)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:mspadicinit, LibPARI.PARI_jll.libpari)),
                4,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(x2),
                Int(x3),
                Int(x4),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"mspadicmoments(Mp,PHI,{D=1}): given Mp from mspadicinit, an\noverconvergent eigensymbol PHI, and optionally a fundamental discriminant\nD coprime to p, return the moments of the p-1 distributions\nPHI^D([0]-[oo]) | (a + pZp), 0 < a < p. To be used by mspadicL and\nmspadicseries."
function mspadicmoments(x1::LibPARI.Gen, x2::LibPARI.Gen; x3::Integer = 1)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:mspadicmoments, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(x3),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"mspadicseries(mu,{i=0}): given mu from mspadicmoments,\nreturns the attached p-adic series with maximal p-adic precision, depending\non the precision of M (i-th Teichmueller component, if present)."
function mspadicseries(x1::LibPARI.Gen; x2::Integer = 0)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:mspadicseries, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(x2),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"mspathgens(M): M being a full modular symbol space, as given by\nmsinit, return a set of Z[G]-generators for Div^0(P^1 Q). The output\nis [g,R], where g is a minimal system of generators and R the vector of\nZ[G]-relations between the given generators."
function mspathgens(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:mspathgens, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"mspathlog(M,p): M being a full modular symbol space, as given by\nmsinit and p being a path between two elements in P^1(Q), return (p_i)\nin Z[G] such that p = \\sum p_i g_i, and the g_i are fixed Z[G]-generators\nfor Div^0(P^1 Q), see mspathgens."
function mspathlog(x1::LibPARI.Gen, x2::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:mspathlog, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"mspetersson(M,{F},{G=F}): M being a full modular symbol space,\nas given by msinit, calculate the intersection product {F,G} of modular\nsymbols F and G on M."
function mspetersson(x1::LibPARI.Gen; x2 = nothing, x3 = nothing)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:mspetersson, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}((x2 === nothing ? C_NULL : x2.ptr))),
                reinterpret(Int, Ptr{Int}((x3 === nothing ? C_NULL : x3.ptr))),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"mspolygon(M,{flag=0}): M describes a subgroup G of finite index in\nthe modular group PSL2(Z), as given by msinit or a positive integer N\n(encoding the group G = Gamma0(N)), or by msfarey (arbitrary subgroups).\nReturn an hyperbolic polygon (Farey symbol) attached to G.\nBinary digits of flag mean: 1=normalized polygon, 2=also add graphical\nrepresentations."
function mspolygon(x1::LibPARI.Gen; x2::Integer = 0)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:mspolygon, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(x2),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"msqexpansion(M,projH,{B = seriesprecision}): M being a full modular\nsymbol space, as given by msinit, and projH being a projector on a\nHecke-simple subspace, return the Fourier coefficients [a_n, n <= B]\nof the corresponding normalized newform. If B omitted, use seriesprecision."
function msqexpansion(
    x1::LibPARI.Gen,
    x2::LibPARI.Gen;
    seriesprec::Integer = 16,
)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:msqexpansion, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                seriesprec,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"msstar(M,{H}): M being a full modular symbol space,\nas given by msinit, return the matrix of the * involution, induced by\ncomplex conjugation, acting on the (stable) subspace H (M if omitted)."
function msstar(x1::LibPARI.Gen; x2 = nothing)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:msstar, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}((x2 === nothing ? C_NULL : x2.ptr))),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"mstooms(Mp,phi): given Mp from mspadicinit, lift the\n(classical) eigen symbol phi to a distribution-valued overconvergent symbol\nin the sense of Pollack and Stevens.\nThe resulting overconvergent eigensymbol can then be used in\nmspadicmoments, then mspadicL or mspadicseries."
function mstooms(x1::LibPARI.Gen, x2::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:mstooms, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"newtonpoly(x,p): Newton polygon of polynomial x with respect to the\nprime p."
function newtonpoly(x1::LibPARI.Gen, x2::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:newtonpoly, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"next({n=1}): interrupt execution of current instruction sequence, and\nstart another iteration from the n-th innermost enclosing loops."
function next0(; x1::Integer = 1)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:next0, LibPARI.PARI_jll.libpari)),
                1,
                Int(x1),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"nextprime(x): smallest pseudoprime >= x."
function nextprime(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:nextprime, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"nfalgtobasis(nf,x): transforms the algebraic number x into a column\nvector on the integral basis nf.zk."
function algtobasis(x1::LibPARI.Gen, x2::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:algtobasis, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"nfbasis(T,{&dK}): integral basis of the field Q[a], where a is\na root of the polynomial T, using the round 4 algorithm. An argument\n[T,listP] is possible, where listP is a list of primes or a prime bound,\nto get an order which is maximal at certain primes only. If present, dK is\nset to the discriminant of the returned order."
function nfbasis(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        out1 = Ref{Ptr{Int}}(C_NULL)
        av = LibPARI._avma()
        r = LibPARI._trap_call(
            Ptr{Int},
            cglobal((:nfbasis, LibPARI.PARI_jll.libpari)),
            2,
            reinterpret(Int, Ptr{Int}(x1.ptr)),
            reinterpret(Int, Base.unsafe_convert(Ptr{Ptr{Int}}, out1)),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
        )
        primary = LibPARI.Gen(r)
        o1 = LibPARI.Gen(out1[])
        LibPARI._set_avma(av)
        return (primary, o1)
    end
end

"nfbasistoalg(nf,x): transforms the column vector x on the integral\nbasis into an algebraic number."
function basistoalg(x1::LibPARI.Gen, x2::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:basistoalg, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"nfcertify(nf): returns a vector of composite integers used to certify\nnf.zk and nf.disc unconditionally (both are correct when the output\nis the empty vector)."
function nfcertify(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:nfcertify, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"nfcompositum(nf,P,Q,{flag=0}): vector of all possible compositums\nof the number fields defined by the polynomials P and Q; flag is\noptional, whose binary digits mean 1: output for each compositum, not only\nthe compositum polynomial pol, but a vector [R,a,b,k] where a (resp. b) is a\nroot of P (resp. Q) expressed as a polynomial modulo R, and a small integer k\nsuch that al2+k*al1 is the chosen root of R; 2: assume that the number\nfields defined by P and Q are linearly disjoint."
function nfcompositum(
    x1::LibPARI.Gen,
    x2::LibPARI.Gen,
    x3::LibPARI.Gen;
    x4::Integer = 0,
)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:nfcompositum, LibPARI.PARI_jll.libpari)),
                4,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                reinterpret(Int, Ptr{Int}(x3.ptr)),
                Int(x4),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"nfdetint(nf,x): multiple of the ideal determinant of the pseudo\ngenerating set x."
function nfdetint(x1::LibPARI.Gen, x2::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:nfdetint, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"nfdisc(T): discriminant of the number field defined by\nthe polynomial T. An argument [T,listP] is possible, where listP is a list\nof primes or a prime bound."
function nfdisc(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:nfdisc, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"nfdiscfactors(T): [D, faD], where D = nfdisc(T), and faD is the\nfactorization of |D|."
function nfdiscfactors(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:nfdiscfactors, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"nfeltadd(nf,x,y): element x+y in nf."
function nfadd(x1::LibPARI.Gen, x2::LibPARI.Gen, x3::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:nfadd, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                reinterpret(Int, Ptr{Int}(x3.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"nfeltdiv(nf,x,y): element x/y in nf."
function nfdiv(x1::LibPARI.Gen, x2::LibPARI.Gen, x3::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:nfdiv, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                reinterpret(Int, Ptr{Int}(x3.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"nfeltdiveuc(nf,x,y): gives algebraic integer q such that x-qy is small."
function nfdiveuc(x1::LibPARI.Gen, x2::LibPARI.Gen, x3::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:nfdiveuc, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                reinterpret(Int, Ptr{Int}(x3.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"nfeltdivmodpr(nf,x,y,pr): this function is obsolete, use nfmodpr."
function nfdivmodpr(
    x1::LibPARI.Gen,
    x2::LibPARI.Gen,
    x3::LibPARI.Gen,
    x4::LibPARI.Gen,
)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:nfdivmodpr, LibPARI.PARI_jll.libpari)),
                4,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                reinterpret(Int, Ptr{Int}(x3.ptr)),
                reinterpret(Int, Ptr{Int}(x4.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"nfeltdivrem(nf,x,y): gives [q,r] such that r=x-qy is small."
function nfdivrem(x1::LibPARI.Gen, x2::LibPARI.Gen, x3::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:nfdivrem, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                reinterpret(Int, Ptr{Int}(x3.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"nfeltembed(nf,x,{pl}): complex embeddings of x at places given\nby vector pl."
function nfeltembed(
    x1::LibPARI.Gen,
    x2::LibPARI.Gen;
    x3 = nothing,
    prec::Integer = 4,
)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:nfeltembed, LibPARI.PARI_jll.libpari)),
                4,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                reinterpret(Int, Ptr{Int}((x3 === nothing ? C_NULL : x3.ptr))),
                prec,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"nfeltispower(nf,x,n,{&y}): returns 1 if x is an n-th power in nf (and set y to\nan n-th root if present), else returns 0."
function nfispower(x1::LibPARI.Gen, x2::LibPARI.Gen, x3::Integer)
    return LibPARI.protected_call() do
        out1 = Ref{Ptr{Int}}(C_NULL)
        av = LibPARI._avma()
        r = LibPARI._trap_call(
            Int,
            cglobal((:nfispower, LibPARI.PARI_jll.libpari)),
            4,
            reinterpret(Int, Ptr{Int}(x1.ptr)),
            reinterpret(Int, Ptr{Int}(x2.ptr)),
            Int(x3),
            reinterpret(Int, Base.unsafe_convert(Ptr{Ptr{Int}}, out1)),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
        )
        primary = Int(r)
        o1 = LibPARI.Gen(out1[])
        LibPARI._set_avma(av)
        return (primary, o1)
    end
end

"nfeltissquare(nf,x,{&y}): returns 1 if x is a square in nf (and sets y to a\nsquare root if present), else returns 0."
function nfissquare(x1::LibPARI.Gen, x2::LibPARI.Gen)
    return LibPARI.protected_call() do
        out1 = Ref{Ptr{Int}}(C_NULL)
        av = LibPARI._avma()
        r = LibPARI._trap_call(
            Int,
            cglobal((:nfissquare, LibPARI.PARI_jll.libpari)),
            3,
            reinterpret(Int, Ptr{Int}(x1.ptr)),
            reinterpret(Int, Ptr{Int}(x2.ptr)),
            reinterpret(Int, Base.unsafe_convert(Ptr{Ptr{Int}}, out1)),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
        )
        primary = Int(r)
        o1 = LibPARI.Gen(out1[])
        LibPARI._set_avma(av)
        return (primary, o1)
    end
end

"nfeltmod(nf,x,y): gives r such that r=x-qy is small with q algebraic\ninteger."
function nfmod(x1::LibPARI.Gen, x2::LibPARI.Gen, x3::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:nfmod, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                reinterpret(Int, Ptr{Int}(x3.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"nfeltmul(nf,x,y): element x.y in nf."
function nfmul(x1::LibPARI.Gen, x2::LibPARI.Gen, x3::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:nfmul, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                reinterpret(Int, Ptr{Int}(x3.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"nfeltmulmodpr(nf,x,y,pr): this function is obsolete, use nfmodpr."
function nfmulmodpr(
    x1::LibPARI.Gen,
    x2::LibPARI.Gen,
    x3::LibPARI.Gen,
    x4::LibPARI.Gen,
)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:nfmulmodpr, LibPARI.PARI_jll.libpari)),
                4,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                reinterpret(Int, Ptr{Int}(x3.ptr)),
                reinterpret(Int, Ptr{Int}(x4.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"nfeltnorm(nf,x): norm of x."
function nfnorm(x1::LibPARI.Gen, x2::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:nfnorm, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"nfeltpow(nf,x,k): element x^k in nf."
function nfpow(x1::LibPARI.Gen, x2::LibPARI.Gen, x3::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:nfpow, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                reinterpret(Int, Ptr{Int}(x3.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"nfeltpowmodpr(nf,x,k,pr): this function is obsolete, use nfmodpr."
function nfpowmodpr(
    x1::LibPARI.Gen,
    x2::LibPARI.Gen,
    x3::LibPARI.Gen,
    x4::LibPARI.Gen,
)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:nfpowmodpr, LibPARI.PARI_jll.libpari)),
                4,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                reinterpret(Int, Ptr{Int}(x3.ptr)),
                reinterpret(Int, Ptr{Int}(x4.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"nfeltreduce(nf,a,id): gives r such that a-r is in the ideal id and r\nis small."
function nfreduce(x1::LibPARI.Gen, x2::LibPARI.Gen, x3::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:nfreduce, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                reinterpret(Int, Ptr{Int}(x3.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"nfeltreducemodpr(nf,x,pr): this function is obsolete, use nfmodpr."
function nfreducemodpr(x1::LibPARI.Gen, x2::LibPARI.Gen, x3::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:nfreducemodpr, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                reinterpret(Int, Ptr{Int}(x3.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"nfeltsign(nf,x,{pl}): signs of real embeddings of x at places given\nby vector pl."
function nfeltsign(x1::LibPARI.Gen, x2::LibPARI.Gen; x3 = nothing)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:nfeltsign, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                reinterpret(Int, Ptr{Int}((x3 === nothing ? C_NULL : x3.ptr))),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"nfelttrace(nf,x): trace of x."
function nftrace(x1::LibPARI.Gen, x2::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:nftrace, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"nfeltval(nf,x,pr,{&y}): valuation of element x at the prime pr as output\nby idealprimedec."
function gpnfvalrem(x1::LibPARI.Gen, x2::LibPARI.Gen, x3::LibPARI.Gen)
    return LibPARI.protected_call() do
        out1 = Ref{Ptr{Int}}(C_NULL)
        av = LibPARI._avma()
        r = LibPARI._trap_call(
            Ptr{Int},
            cglobal((:gpnfvalrem, LibPARI.PARI_jll.libpari)),
            4,
            reinterpret(Int, Ptr{Int}(x1.ptr)),
            reinterpret(Int, Ptr{Int}(x2.ptr)),
            reinterpret(Int, Ptr{Int}(x3.ptr)),
            reinterpret(Int, Base.unsafe_convert(Ptr{Ptr{Int}}, out1)),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
        )
        primary = LibPARI.Gen(r)
        o1 = LibPARI.Gen(out1[])
        LibPARI._set_avma(av)
        return (primary, o1)
    end
end

"nffactor(nf,T): factor polynomial T in number field nf."
function nffactor(x1::LibPARI.Gen, x2::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:nffactor, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"nffactorback(nf,f,{e}): given a factorization f, returns\nthe factored object back as an nf element."
function nffactorback(x1::LibPARI.Gen, x2::LibPARI.Gen; x3 = nothing)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:nffactorback, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                reinterpret(Int, Ptr{Int}((x3 === nothing ? C_NULL : x3.ptr))),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"nffactormod(nf,Q,pr): this routine is obsolete, use nfmodpr and\nfactormod. Factor polynomial Q modulo prime ideal pr\nin number field nf."
function nffactormod(x1::LibPARI.Gen, x2::LibPARI.Gen, x3::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:nffactormod, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                reinterpret(Int, Ptr{Int}(x3.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"nfgaloisapply(nf,aut,x): apply the Galois automorphism aut to the object\nx (element or ideal) in the number field nf."
function galoisapply(x1::LibPARI.Gen, x2::LibPARI.Gen, x3::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:galoisapply, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                reinterpret(Int, Ptr{Int}(x3.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"nfgaloisconj(nf,{flag=0},{d}): list of conjugates of a root of the\npolynomial x=nf.pol in the same number field. flag is optional (set to 0 by\ndefault), meaning 0: use combination of flag 4 and 1, always complete; 1:\nuse nfroots; 4: use Allombert's algorithm, complete if the field is Galois of\ndegree <= 35 (see manual for details). nf can be simply a polynomial."
function galoisconj0(
    x1::LibPARI.Gen;
    x2::Integer = 0,
    x3 = nothing,
    prec::Integer = 4,
)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:galoisconj0, LibPARI.PARI_jll.libpari)),
                4,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(x2),
                reinterpret(Int, Ptr{Int}((x3 === nothing ? C_NULL : x3.ptr))),
                prec,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"nfgrunwaldwang(nf,Lpr,Ld,pl,{v='x}): a polynomial in the variable v\ndefining a cyclic extension of nf (given in nf or bnf form) with local\nbehavior prescribed by Lpr, Ld and pl: the extension has local degree a\nmultiple of Ld[i] at the prime Lpr[i], and the extension is complex at the\ni-th real place of nf if pl[i]=-1 (no condition if pl[i]=0). The extension\nhas degree the LCM of the local degrees."
function nfgrunwaldwang(
    x1::LibPARI.Gen,
    x2::LibPARI.Gen,
    x3::LibPARI.Gen,
    x4::LibPARI.Gen;
    x5::Integer = -1,
)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:nfgrunwaldwang, LibPARI.PARI_jll.libpari)),
                5,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                reinterpret(Int, Ptr{Int}(x3.ptr)),
                reinterpret(Int, Ptr{Int}(x4.ptr)),
                Int(x5),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"nfhilbert(nf,a,b,{pr}): if pr is omitted, global Hilbert symbol (a,b) in\nnf, that is 1 if X^2-aY^2-bZ^2 has a nontrivial solution (X,Y,Z) in nf, -1\notherwise. Otherwise compute the local symbol modulo the prime ideal pr."
function nfhilbert0(
    x1::LibPARI.Gen,
    x2::LibPARI.Gen,
    x3::LibPARI.Gen;
    x4 = nothing,
)
    return LibPARI.protected_call() do
        Int(
            LibPARI._trap_call(
                Int,
                cglobal((:nfhilbert0, LibPARI.PARI_jll.libpari)),
                4,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                reinterpret(Int, Ptr{Int}(x3.ptr)),
                reinterpret(Int, Ptr{Int}((x4 === nothing ? C_NULL : x4.ptr))),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            ),
        )
    end
end

"nfhnf(nf,x,{flag=0}): if x=[A,I], gives a pseudo-basis [B,J] of the module\nsum A_jI_j. If flag is nonzero, return [[B,J], U], where U is the\ntransformation matrix such that AU = [0|B]."
function nfhnf0(x1::LibPARI.Gen, x2::LibPARI.Gen; x3::Integer = 0)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:nfhnf0, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(x3),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"nfhnfmod(nf,x,detx): if x=[A,I], and detx is a multiple of the ideal\ndeterminant of x, gives a pseudo-basis of the module sum A_jI_j."
function nfhnfmod(x1::LibPARI.Gen, x2::LibPARI.Gen, x3::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:nfhnfmod, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                reinterpret(Int, Ptr{Int}(x3.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"nfinit(pol,{flag=0}): pol being a nonconstant irreducible polynomial in\nQ[X], returns an nf structure attached to the number field Q[X] / (pol).\nBinary digits of flag mean\n1: two-element vector [nf,Mod(a,P)], where Mod(a,P) is a polmod equal to\nMod(x,pol) and P=nf.pol; 2: first use polredbest to find a simpler\npolynomial P; 4: do not LLL-reduce the maximal order basis nf.zk."
function nfinit0(x1::LibPARI.Gen; x2::Integer = 0, prec::Integer = 4)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:nfinit0, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(x2),
                prec,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"nfisideal(nf,x): true(1) if x is an ideal in the number field nf,\nfalse(0) if not."
function isideal(x1::LibPARI.Gen, x2::LibPARI.Gen)
    return LibPARI.protected_call() do
        Int(
            LibPARI._trap_call(
                Int,
                cglobal((:isideal, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            ),
        )
    end
end

"nfisincl(f,g,{flag=0}): let f and g define number fields, either\nirreducible rational polynomials or number fields as output by nfinit; tests\nwhether the number field f is isomorphic to a subfield of g. Return 0 if not,\nand otherwise all the embeddings (flag=0, default), only one (flag=1), or\nall embeddings as rational functions (flag=2)."
function nfisincl0(x1::LibPARI.Gen, x2::LibPARI.Gen; x3::Integer = 0)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:nfisincl0, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(x3),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"nfisisom(f,g): as nfisincl but tests whether f is isomorphic to g."
function nfisisom(x1::LibPARI.Gen, x2::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:nfisisom, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"nfislocalpower(nf,pr,a,n): true(1) if a is an n-th power in\nthe local field K_v, false(0) if not."
function nfislocalpower(
    x1::LibPARI.Gen,
    x2::LibPARI.Gen,
    x3::LibPARI.Gen,
    x4::LibPARI.Gen,
)
    return LibPARI.protected_call() do
        Int(
            LibPARI._trap_call(
                Int,
                cglobal((:nfislocalpower, LibPARI.PARI_jll.libpari)),
                4,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                reinterpret(Int, Ptr{Int}(x3.ptr)),
                reinterpret(Int, Ptr{Int}(x4.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            ),
        )
    end
end

"nfkermodpr(nf,x,pr): this function is obsolete, use nfmodpr."
function nfkermodpr(x1::LibPARI.Gen, x2::LibPARI.Gen, x3::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:nfkermodpr, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                reinterpret(Int, Ptr{Int}(x3.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"nfmodpr(nf,x,pr): map x to the residue field mod pr."
function nfmodpr(x1::LibPARI.Gen, x2::LibPARI.Gen, x3::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:nfmodpr, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                reinterpret(Int, Ptr{Int}(x3.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"nfmodprinit(nf,pr,{v=variable(nf.pol)}): transform the prime ideal pr\ninto modpr format necessary for all operations mod pr in the number field nf.\nVariable v is used to display finite field elements (see ffgen)."
function nfmodprinit0(x1::LibPARI.Gen, x2::LibPARI.Gen; x3::Integer = -1)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:nfmodprinit0, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(x3),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"nfmodprlift(nf,x,pr): lift x from residue field mod pr to nf."
function nfmodprlift(x1::LibPARI.Gen, x2::LibPARI.Gen, x3::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:nfmodprlift, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                reinterpret(Int, Ptr{Int}(x3.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"nfnewprec(nf): transform the number field data nf into new data using\nthe current (usually larger) precision."
function nfnewprec(x1::LibPARI.Gen; prec::Integer = 4)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:nfnewprec, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                prec,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"nfpolsturm(nf,T,{pl}): number of distinct real roots of the polynomial\ns(T) where s runs through the real embeddings given by vector pl."
function nfpolsturm(x1::LibPARI.Gen, x2::LibPARI.Gen; x3 = nothing)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:nfpolsturm, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                reinterpret(Int, Ptr{Int}((x3 === nothing ? C_NULL : x3.ptr))),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"nfresolvent(pol,{flag=0}): In the case where the Galois closure of the\nnumber field defined by pol is S3, Dl, A4, S4, F5, A5, M21, or M42, gives the\ncorresponding resolvent field. Otherwise, give a \"canonical\" subfield,\nor if flag >= 2 all \"canonical\" subfields. If flag is odd, give also the\n\"conductor\" f, whose definition is specific to each group."
function nfresolvent(x1::LibPARI.Gen; x2::Integer = 0)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:nfresolvent, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(x2),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"nfroots({nf},x): roots of polynomial x belonging to nf (Q if\nomitted) without multiplicity."
function nfroots(x2::LibPARI.Gen; x1 = nothing)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:nfroots, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}((x1 === nothing ? C_NULL : x1.ptr))),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"nfrootsof1(nf): number of roots of unity and primitive root of unity\nin the number field nf."
function nfrootsof1(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:nfrootsof1, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"nfsnf(nf,x,{flag=0}): if x=[A,I,J], outputs D=[d_1,...d_n] Smith normal\nform of x. If flag is nonzero return [D,U,V], where UAV = Id."
function nfsnf0(x1::LibPARI.Gen, x2::LibPARI.Gen; x3::Integer = 0)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:nfsnf0, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(x3),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"nfsolvemodpr(nf,a,b,P): this function is obsolete, use nfmodpr."
function nfsolvemodpr(
    x1::LibPARI.Gen,
    x2::LibPARI.Gen,
    x3::LibPARI.Gen,
    x4::LibPARI.Gen,
)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:nfsolvemodpr, LibPARI.PARI_jll.libpari)),
                4,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                reinterpret(Int, Ptr{Int}(x3.ptr)),
                reinterpret(Int, Ptr{Int}(x4.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"nfsubfields(pol,{d=0},{flag=0}): finds all subfields of degree d of number\nfield defined by pol (all subfields if d is null or omitted). The result is a\nvector of subfields, each being given by [g,h] (default) or simply g (flag=1),\nwhere g is an absolute equation and h expresses one of the roots of g in terms\nof the root x of the polynomial defining nf."
function nfsubfields0(x1::LibPARI.Gen; x2::Integer = 0, x3::Integer = 0)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:nfsubfields0, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(x2),
                Int(x3),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"nfsubfieldscm(nf,{flag=0}): computes the maximal CM subfield of nf.\nReturns 0 if nf does not have a CM subfield, otherwise returns [g,h] (default)\nor g (flag=1) where g is an absolute equation and h expresses a root of g in\nterms of the generator of nf."
function nfsubfieldscm(x1::LibPARI.Gen; x2::Integer = 0)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:nfsubfieldscm, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(x2),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"nfsubfieldsmax(nf,{flag=0}): computes the list of maximal subfields of\nnf. The result is as in nfsubfields."
function nfsubfieldsmax(x1::LibPARI.Gen; x2::Integer = 0)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:nfsubfieldsmax, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(x2),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"nfweilheight(nf, v): return the absolute Weil height of the vector v seen\nas an element of the projective space over the number field nf given by nfinit."
function nfweilheight(x1::LibPARI.Gen, x2::LibPARI.Gen; prec::Integer = 4)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:nfweilheight, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                prec,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"norm(x): norm of x."
function gnorm(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:gnorm, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"norml2(x): square of the L2-norm of x."
function gnorml2(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:gnorml2, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"normlp(x,{p=oo}): Lp-norm of x; sup norm if p is omitted."
function gnormlp(x1::LibPARI.Gen; x2 = nothing, prec::Integer = 4)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:gnormlp, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}((x2 === nothing ? C_NULL : x2.ptr))),
                prec,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"numbpart(n): number of partitions of n."
function numbpart(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:numbpart, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"numdiv(x): number of divisors of x."
function numdiv(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:numdiv, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"numerator(f,{D}): numerator of f."
function numerator(x1::LibPARI.Gen; x2 = nothing)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:numerator, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}((x2 === nothing ? C_NULL : x2.ptr))),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"numtoperm(n,k): permutation number k (mod n!) of n letters (n\nC-integer)."
function numtoperm(x1::Integer, x2::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:numtoperm, LibPARI.PARI_jll.libpari)),
                2,
                Int(x1),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"omega(x): number of distinct prime divisors of x."
function omega(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        Int(
            LibPARI._trap_call(
                Int,
                cglobal((:omega, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            ),
        )
    end
end

"oo=oo(): infinity."
function mkoo()
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:mkoo, LibPARI.PARI_jll.libpari)),
                0,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"padicappr(pol,a): p-adic roots of the polynomial pol congruent to a mod p."
function padicappr(x1::LibPARI.Gen, x2::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:padicappr, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"padicfields(p,N,{flag=0}): returns polynomials generating all\nthe extensions of degree N of the field of p-adic rational numbers; N is\nallowed to be a 2-component vector [n,d], in which case, returns the\nextensions of degree n and discriminant p^d. flag is optional,\nand can be 0: default, 1: return also the ramification index, the residual\ndegree, the valuation of the discriminant and the number of conjugate fields,\nor 2: return only the number of extensions in a fixed algebraic closure."
function padicfields0(x1::LibPARI.Gen, x2::LibPARI.Gen; x3::Integer = 0)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:padicfields0, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(x3),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"padicprec(x,p):\nreturn the absolute p-adic precision of object x."
function gppadicprec(x1::LibPARI.Gen, x2::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:gppadicprec, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"parapply(f,x): parallel evaluation of f on the elements of x."
function parapply(x1::LibPARI.Gen, x2::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:parapply, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"pareval(x): parallel evaluation of the elements of the vector of\nclosures x."
function pareval(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:pareval, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"parselect(f,A,{flag=0}): (parallel select) selects elements of A\naccording to the selection function f which is tested in parallel. If flag\nis 1, return the indices of those elements (indirect selection)."
function parselect(x1::LibPARI.Gen, x2::LibPARI.Gen; x3::Integer = 0)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:parselect, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(x3),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"partitions(k,{a=k},{n=k}): vector of partitions of the integer k.\nYou can restrict the length of the partitions with parameter n (n=nmax or\nn=[nmin,nmax]), or the range of the parts with parameter a (a=amax\nor a=[amin,amax]). By default remove zeros, but one can set amin=0 to get X of\nfixed length nmax (=k by default)."
function partitions(x1::Integer; x2 = nothing, x3 = nothing)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:partitions, LibPARI.PARI_jll.libpari)),
                3,
                Int(x1),
                reinterpret(Int, Ptr{Int}((x2 === nothing ? C_NULL : x2.ptr))),
                reinterpret(Int, Ptr{Int}((x3 === nothing ? C_NULL : x3.ptr))),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"permcycles(x): cycles of the permutation x."
function permcycles(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:permcycles, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"permorder(x): order of the permutation x."
function permorder(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:permorder, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"permsign(x): signature of the permutation x."
function permsign(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        Int(
            LibPARI._trap_call(
                Int,
                cglobal((:permsign, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            ),
        )
    end
end

"permtonum(x): ordinal (between 0 and n!-1) of permutation x."
function permtonum(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:permtonum, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"plotarc(w,x2,y2,{filled=0}): if the cursor is at position (x1,y1), draws the\nellipse that fits inside the box with diagonal (x1,y1) and (x2,y2) in rectwindow w\n(cursor does not move).\nIf filled=1, fill the ellipse"
function plotarc(x1::Integer, x2::LibPARI.Gen, x3::LibPARI.Gen; x4::Integer = 0)
    LibPARI.protected_call() do
        LibPARI._trap_call(
            Cvoid,
            cglobal((:plotarc, LibPARI.PARI_jll.libpari)),
            4,
            Int(x1),
            reinterpret(Int, Ptr{Int}(x2.ptr)),
            reinterpret(Int, Ptr{Int}(x3.ptr)),
            Int(x4),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
        )
    end
    return nothing
end

"plotbox(w,x2,y2,{filled=0}): if the cursor is at position (x1,y1), draw a box\nwith diagonal (x1,y1) and (x2,y2) in rectwindow w (cursor does not move).\nIf filled=1, fill the box."
function plotbox(x1::Integer, x2::LibPARI.Gen, x3::LibPARI.Gen; x4::Integer = 0)
    LibPARI.protected_call() do
        LibPARI._trap_call(
            Cvoid,
            cglobal((:plotbox, LibPARI.PARI_jll.libpari)),
            4,
            Int(x1),
            reinterpret(Int, Ptr{Int}(x2.ptr)),
            reinterpret(Int, Ptr{Int}(x3.ptr)),
            Int(x4),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
        )
    end
    return nothing
end

"plotclip(w): clip the contents of the rectwindow to the bounding box\n(except strings)."
function plotclip(x1::Integer)
    LibPARI.protected_call() do
        LibPARI._trap_call(
            Cvoid,
            cglobal((:plotclip, LibPARI.PARI_jll.libpari)),
            1,
            Int(x1),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
        )
    end
    return nothing
end

"plotcolor(w,c): in rectwindow w, set default color to c. Possible\nvalues for c are [R,G,B] values, a color name or an index in the\ngraphcolormap default: factory settings\nare 0=white, 1=black, 2=blue, 3=sienna, 4=red, 5=green, 6=grey, 7=gainsborough.\nReturn [R,G,B] value attached to color."
function plotcolor(x1::Integer, x2::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:plotcolor, LibPARI.PARI_jll.libpari)),
                2,
                Int(x1),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"plotcopy(sourcew,destw,dx,dy,{flag=0}): copy the contents of\nrectwindow sourcew to rectwindow destw with offset (dx,dy). If flag's bit 1\nis set, dx and dy express fractions of the size of the current output\ndevice, otherwise dx and dy are in pixels. dx and dy are relative positions\nof northwest corners if other bits of flag vanish, otherwise of: 2:\nsouthwest, 4: southeast, 6: northeast corners."
function plotcopy(
    x1::Integer,
    x2::Integer,
    x3::LibPARI.Gen,
    x4::LibPARI.Gen;
    x5::Integer = 0,
)
    LibPARI.protected_call() do
        LibPARI._trap_call(
            Cvoid,
            cglobal((:plotcopy, LibPARI.PARI_jll.libpari)),
            5,
            Int(x1),
            Int(x2),
            reinterpret(Int, Ptr{Int}(x3.ptr)),
            reinterpret(Int, Ptr{Int}(x4.ptr)),
            Int(x5),
            Int(0),
            Int(0),
            Int(0),
        )
    end
    return nothing
end

"plotcursor(w): current position of cursor in rectwindow w."
function plotcursor(x1::Integer)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:plotcursor, LibPARI.PARI_jll.libpari)),
                1,
                Int(x1),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"plotdraw(w,{flag=0}): draw rectwindow w. More generally,\nw can be of the form [w1,x1,y1, w2,x2,y2,etc.]: draw rectwindows wi\nat given xi,yi positions. If flag!=0, the xi,yi express fractions of the size\nof the current output device."
function plotdraw(x1::LibPARI.Gen; x2::Integer = 0)
    LibPARI.protected_call() do
        LibPARI._trap_call(
            Cvoid,
            cglobal((:plotdraw, LibPARI.PARI_jll.libpari)),
            2,
            reinterpret(Int, Ptr{Int}(x1.ptr)),
            Int(x2),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
        )
    end
    return nothing
end

"plotexport(fmt,list,{flag=0}): draw vector of rectwindows list as\nin plotdraw, returning the resulting picture as a character string;\nfmt is either \"ps\" or \"svg\"."
function plotexport(x1::LibPARI.Gen, x2::LibPARI.Gen; x3::Integer = 0)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:plotexport, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(x3),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"plothraw(X,Y,{flag=0}): plot in high resolution points whose x\n(resp. y) coordinates are in X (resp. Y). If flag is 1, join points,\nother nonzero flags should be combinations of bits 8,16,32,64,128,256 meaning\nthe same as for ploth()."
function plothraw(x1::LibPARI.Gen, x2::LibPARI.Gen; x3::Integer = 0)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:plothraw, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(x3),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"plothrawexport(fmt,X,Y,{flag=0}): plot in high resolution\npoints whose x (resp. y) coordinates are in X (resp. Y), returning\nthe resulting picture as a character string. If flag is 1, join points,\nother nonzero flags should be combinations of bits 8,16,32,64,128,256 meaning\nthe same as for ploth()."
function plothrawexport(
    x1::LibPARI.Gen,
    x2::LibPARI.Gen,
    x3::LibPARI.Gen;
    x4::Integer = 0,
)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:plothrawexport, LibPARI.PARI_jll.libpari)),
                4,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                reinterpret(Int, Ptr{Int}(x3.ptr)),
                Int(x4),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"plothsizes({flag=0}): returns array of 8 elements: terminal width and\nheight, sizes for ticks in horizontal and vertical directions, width and\nheight of characters, width and height of display (if applicable). If flag=0,\nsizes of ticks and characters are in pixels, otherwise are fractions of the\nterminal size."
function plothsizes(; x1::Integer = 0)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:plothsizes, LibPARI.PARI_jll.libpari)),
                1,
                Int(x1),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"plotkill(w): erase the rectwindow w."
function plotkill(x1::Integer)
    LibPARI.protected_call() do
        LibPARI._trap_call(
            Cvoid,
            cglobal((:plotkill, LibPARI.PARI_jll.libpari)),
            1,
            Int(x1),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
        )
    end
    return nothing
end

"plotlines(w,X,Y,{flag=0}): draws an open polygon in rectwindow\nw where X and Y contain the x (resp. y) coordinates of the vertices.\nIf X and Y are both single values (i.e not vectors), draw the\ncorresponding line (and move cursor). If (optional) flag is nonzero, close\nthe polygon."
function plotlines(
    x1::Integer,
    x2::LibPARI.Gen,
    x3::LibPARI.Gen;
    x4::Integer = 0,
)
    LibPARI.protected_call() do
        LibPARI._trap_call(
            Cvoid,
            cglobal((:plotlines, LibPARI.PARI_jll.libpari)),
            4,
            Int(x1),
            reinterpret(Int, Ptr{Int}(x2.ptr)),
            reinterpret(Int, Ptr{Int}(x3.ptr)),
            Int(x4),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
        )
    end
    return nothing
end

"plotlinetype(w,type): this function is obsolete; no graphing engine\nimplement this functionality."
function plotlinetype(x1::Integer, x2::Integer)
    LibPARI.protected_call() do
        LibPARI._trap_call(
            Cvoid,
            cglobal((:plotlinetype, LibPARI.PARI_jll.libpari)),
            2,
            Int(x1),
            Int(x2),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
        )
    end
    return nothing
end

"plotmove(w,x,y): move cursor to position x,y in rectwindow w."
function plotmove(x1::Integer, x2::LibPARI.Gen, x3::LibPARI.Gen)
    LibPARI.protected_call() do
        LibPARI._trap_call(
            Cvoid,
            cglobal((:plotmove, LibPARI.PARI_jll.libpari)),
            3,
            Int(x1),
            reinterpret(Int, Ptr{Int}(x2.ptr)),
            reinterpret(Int, Ptr{Int}(x3.ptr)),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
        )
    end
    return nothing
end

"plotpoints(w,X,Y): draws in rectwindow w the points whose x\n(resp y) coordinates are in X (resp Y). If X and Y are both\nsingle values (i.e not vectors), draw the corresponding point (and move\ncursor)."
function plotpoints(x1::Integer, x2::LibPARI.Gen, x3::LibPARI.Gen)
    LibPARI.protected_call() do
        LibPARI._trap_call(
            Cvoid,
            cglobal((:plotpoints, LibPARI.PARI_jll.libpari)),
            3,
            Int(x1),
            reinterpret(Int, Ptr{Int}(x2.ptr)),
            reinterpret(Int, Ptr{Int}(x3.ptr)),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
        )
    end
    return nothing
end

"plotpointsize(w,size): change the \"size\" of following points in\nrectwindow w. w=-1 changes global value."
function plotpointsize(x1::Integer, x2::LibPARI.Gen)
    LibPARI.protected_call() do
        LibPARI._trap_call(
            Cvoid,
            cglobal((:plotpointsize, LibPARI.PARI_jll.libpari)),
            2,
            Int(x1),
            reinterpret(Int, Ptr{Int}(x2.ptr)),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
        )
    end
    return nothing
end

"plotpointtype(w,type): this function is obsolete; no graphing engine\nimplement this functionality."
function plotpointtype(x1::Integer, x2::Integer)
    LibPARI.protected_call() do
        LibPARI._trap_call(
            Cvoid,
            cglobal((:plotpointtype, LibPARI.PARI_jll.libpari)),
            2,
            Int(x1),
            Int(x2),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
        )
    end
    return nothing
end

"plotrbox(w,dx,dy,{filled}): if the cursor is at (x1,y1), draw a box with\ndiagonal (x1,y1)-(x1+dx,y1+dy) in rectwindow w (cursor does not move).\nIf filled=1, fill the box."
function plotrbox(
    x1::Integer,
    x2::LibPARI.Gen,
    x3::LibPARI.Gen;
    x4::Integer = 0,
)
    LibPARI.protected_call() do
        LibPARI._trap_call(
            Cvoid,
            cglobal((:plotrbox, LibPARI.PARI_jll.libpari)),
            4,
            Int(x1),
            reinterpret(Int, Ptr{Int}(x2.ptr)),
            reinterpret(Int, Ptr{Int}(x3.ptr)),
            Int(x4),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
        )
    end
    return nothing
end

"plotrecthraw(w,data,{flags=0}): plot graph(s) for data in rectwindow\nw, where data is a vector of vectors. If plot is parametric, length of data\nshould be even, and pairs of entries give curves to plot. If not, first\nentry gives x-coordinate, and the other ones y-coordinates. Admits the same\noptional flags as plotrecth, save that recursive plot is meaningless."
function plotrecthraw(x1::Integer, x2::LibPARI.Gen; x3::Integer = 0)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:plotrecthraw, LibPARI.PARI_jll.libpari)),
                3,
                Int(x1),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(x3),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"plotrline(w,dx,dy): if the cursor is at (x1,y1), draw a line from\n(x1,y1) to (x1+dx,y1+dy) (and move the cursor) in the rectwindow w."
function plotrline(x1::Integer, x2::LibPARI.Gen, x3::LibPARI.Gen)
    LibPARI.protected_call() do
        LibPARI._trap_call(
            Cvoid,
            cglobal((:plotrline, LibPARI.PARI_jll.libpari)),
            3,
            Int(x1),
            reinterpret(Int, Ptr{Int}(x2.ptr)),
            reinterpret(Int, Ptr{Int}(x3.ptr)),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
        )
    end
    return nothing
end

"plotrmove(w,dx,dy): move cursor to position (dx,dy) relative to the\npresent position in the rectwindow w."
function plotrmove(x1::Integer, x2::LibPARI.Gen, x3::LibPARI.Gen)
    LibPARI.protected_call() do
        LibPARI._trap_call(
            Cvoid,
            cglobal((:plotrmove, LibPARI.PARI_jll.libpari)),
            3,
            Int(x1),
            reinterpret(Int, Ptr{Int}(x2.ptr)),
            reinterpret(Int, Ptr{Int}(x3.ptr)),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
        )
    end
    return nothing
end

"plotrpoint(w,dx,dy): draw a point (and move cursor) at position dx,dy\nrelative to present position of the cursor in rectwindow w."
function plotrpoint(x1::Integer, x2::LibPARI.Gen, x3::LibPARI.Gen)
    LibPARI.protected_call() do
        LibPARI._trap_call(
            Cvoid,
            cglobal((:plotrpoint, LibPARI.PARI_jll.libpari)),
            3,
            Int(x1),
            reinterpret(Int, Ptr{Int}(x2.ptr)),
            reinterpret(Int, Ptr{Int}(x3.ptr)),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
        )
    end
    return nothing
end

"plotscale(w,x1,x2,y1,y2): scale the coordinates in rectwindow w so\nthat x goes from x1 to x2 and y from y1 to y2 (y2<y1 is allowed)."
function plotscale(
    x1::Integer,
    x2::LibPARI.Gen,
    x3::LibPARI.Gen,
    x4::LibPARI.Gen,
    x5::LibPARI.Gen,
)
    LibPARI.protected_call() do
        LibPARI._trap_call(
            Cvoid,
            cglobal((:plotscale, LibPARI.PARI_jll.libpari)),
            5,
            Int(x1),
            reinterpret(Int, Ptr{Int}(x2.ptr)),
            reinterpret(Int, Ptr{Int}(x3.ptr)),
            reinterpret(Int, Ptr{Int}(x4.ptr)),
            reinterpret(Int, Ptr{Int}(x5.ptr)),
            Int(0),
            Int(0),
            Int(0),
        )
    end
    return nothing
end

"plotstring(w,x,{flags=0}): draw in rectwindow w the string\ncorresponding to x. Bits 1 and 2 of flag regulate horizontal alignment: left\nif 0, right if 2, center if 1. Bits 4 and 8 regulate vertical alignment:\nbottom if 0, top if 8, v-center if 4. Can insert additional gap between\npoint and string: horizontal if bit 16 is set, vertical if bit 32 is set."
function plotstring(x1::Integer, x2::AbstractString; x3::Integer = 0)
    LibPARI.protected_call() do
        let _cs1 = Base.cconvert(Cstring, x2)
            GC.@preserve _cs1 LibPARI._trap_call(
                Cvoid,
                cglobal((:plotstring, LibPARI.PARI_jll.libpari)),
                3,
                Int(x1),
                reinterpret(Int, Base.unsafe_convert(Cstring, _cs1)),
                Int(x3),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
    return nothing
end

"polchebyshev(n,{flag=1},{a='x}): Chebyshev polynomial of the first (flag\n= 1) or second (flag = 2) kind, of degree n, evaluated at a."
function polchebyshev_eval(x1::Integer; x2::Integer = 1, x3 = nothing)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:polchebyshev_eval, LibPARI.PARI_jll.libpari)),
                3,
                Int(x1),
                Int(x2),
                reinterpret(Int, Ptr{Int}((x3 === nothing ? C_NULL : x3.ptr))),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"polclass(D,{inv=0},{x='x}): return a polynomial generating the\nHilbert class field of Q(sqrt(D)) for the discriminant D<0."
function polclass(x1::LibPARI.Gen; x2::Integer = 0, x3::Integer = -1)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:polclass, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(x2),
                Int(x3),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"polcoef(x,n,{v}): coefficient of degree n of x. With respect\nto the main variable if v is omitted, with respect to the variable v\notherwise."
function polcoef(x1::LibPARI.Gen, x2::Integer; x3::Integer = -1)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:polcoef, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(x2),
                Int(x3),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"polcompositum(P,Q,{flag=0}): vector of all possible compositums\nof the number fields defined by the polynomials P and Q; flag is\noptional, whose binary digits mean 1: output for each compositum, not only\nthe compositum polynomial pol, but a vector [R,a,b,k] where a (resp. b) is a\nroot of P (resp. Q) expressed as a polynomial modulo R, and a small integer k\nsuch that al2+k*al1 is the chosen root of R; 2: assume that the number\nfields defined by P and Q are linearly disjoint."
function polcompositum0(x1::LibPARI.Gen, x2::LibPARI.Gen; x3::Integer = 0)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:polcompositum0, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(x3),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"polcyclo(n,{a = 'x}): n-th cyclotomic polynomial evaluated at a."
function polcyclo_eval(x1::Integer; x2 = nothing)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:polcyclo_eval, LibPARI.PARI_jll.libpari)),
                2,
                Int(x1),
                reinterpret(Int, Ptr{Int}((x2 === nothing ? C_NULL : x2.ptr))),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"polcyclofactors(f): returns a vector of polynomials, whose product is\nthe product of distinct cyclotomic polynomials dividing f."
function polcyclofactors(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:polcyclofactors, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"poldegree(x,{v}): degree of the polynomial or rational function x with\nrespect to main variable if v is omitted, with respect to v otherwise.\nFor scalar x, return 0 if x is nonzero and -oo otherwise."
function gppoldegree(x1::LibPARI.Gen; x2::Integer = -1)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:gppoldegree, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(x2),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"poldisc(pol,{v}): discriminant of the polynomial pol, with respect to main\nvariable if v is omitted, with respect to v otherwise."
function poldisc0(x1::LibPARI.Gen; x2::Integer = -1)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:poldisc0, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(x2),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"poldiscfactors(T,{flag=0}): [D, faD], where D = discriminant of the\npolynomial T, and faD is a cheap partial factorization of D\n(entries are coprime but need not be primes); if flag is 1, finish the\nfactorization via factorint."
function poldiscfactors(x1::LibPARI.Gen; x2::Integer = 0)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:poldiscfactors, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(x2),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"poldiscreduced(f): vector of elementary divisors of Z[a]/f'(a)Z[a],\nwhere a is a root of the polynomial f."
function reduceddiscsmith(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:reduceddiscsmith, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"polfromroots(a,{v=x}): returns the monic polynomial in variable v\nwhose roots are the components of the vector a with multiplicities."
function polfromroots(x1::LibPARI.Gen; x2::Integer = -1)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:polfromroots, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(x2),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"polgalois(T): Galois group of the polynomial T (see manual for group\ncoding). Return [n, s, k, name] where n is the group order, s the signature,\nk the index and name is the GAP4 name of the transitive group."
function polgalois(x1::LibPARI.Gen; prec::Integer = 4)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:polgalois, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                prec,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"polgraeffe(f): returns the Graeffe transform g of f, such that\ng(x^2) = f(x)f(-x)."
function polgraeffe(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:polgraeffe, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"polhensellift(A,B,p,e): lift the factorization B of A modulo p to a\nfactorization modulo p^e using Hensel lift. The factors in B must be\npairwise relatively prime modulo p."
function polhensellift(
    x1::LibPARI.Gen,
    x2::LibPARI.Gen,
    x3::LibPARI.Gen,
    x4::Integer,
)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:polhensellift, LibPARI.PARI_jll.libpari)),
                4,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                reinterpret(Int, Ptr{Int}(x3.ptr)),
                Int(x4),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"polinterpolate(X,{Y},{t = 'x},{&e}): polynomial interpolation at t\naccording to data vectors X, Y, i.e., given P of minimal degree\nsuch that P(X[i]) = Y[i] for all i, return P(t). If Y is omitted,\ntake P such that P(i) = X[i]. If present and t is numeric, e will contain an\nerror estimate on the returned value (Neville's algorithm)."
function polint(x1::LibPARI.Gen; x2 = nothing, x3 = nothing)
    return LibPARI.protected_call() do
        out1 = Ref{Ptr{Int}}(C_NULL)
        av = LibPARI._avma()
        r = LibPARI._trap_call(
            Ptr{Int},
            cglobal((:polint, LibPARI.PARI_jll.libpari)),
            4,
            reinterpret(Int, Ptr{Int}(x1.ptr)),
            reinterpret(Int, Ptr{Int}((x2 === nothing ? C_NULL : x2.ptr))),
            reinterpret(Int, Ptr{Int}((x3 === nothing ? C_NULL : x3.ptr))),
            reinterpret(Int, Base.unsafe_convert(Ptr{Ptr{Int}}, out1)),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
        )
        primary = LibPARI.Gen(r)
        o1 = LibPARI.Gen(out1[])
        LibPARI._set_avma(av)
        return (primary, o1)
    end
end

"polisclass(P): P being a monic irreducible polynomial with integer\ncoefficients, return 0 if P is not a class polynomial for the j-invariant,\notherwise return the discriminant D<0 such that P=polclass(D)."
function polisclass(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        Int(
            LibPARI._trap_call(
                Int,
                cglobal((:polisclass, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            ),
        )
    end
end

"poliscyclo(f): returns 0 if f is not a cyclotomic polynomial, and n\n> 0 if f = Phi_n, the n-th cyclotomic polynomial."
function poliscyclo(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        Int(
            LibPARI._trap_call(
                Int,
                cglobal((:poliscyclo, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            ),
        )
    end
end

"poliscycloprod(f): returns 1 if f is a product of cyclotomic\npolynonials, and 0 otherwise."
function poliscycloprod(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        Int(
            LibPARI._trap_call(
                Int,
                cglobal((:poliscycloprod, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            ),
        )
    end
end

"polisirreducible(pol): true(1) if pol is an irreducible nonconstant\npolynomial, false(0) if pol is reducible or constant."
function polisirreducible(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        Int(
            LibPARI._trap_call(
                Int,
                cglobal((:polisirreducible, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            ),
        )
    end
end

"pollead(x,{v}): leading coefficient of polynomial or series x, or x\nitself if x is a scalar. Error otherwise. With respect to the main variable\nof x if v is omitted, with respect to the variable v otherwise."
function pollead(x1::LibPARI.Gen; x2::Integer = -1)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:pollead, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(x2),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"polrecip(pol): reciprocal polynomial of pol."
function polrecip(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:polrecip, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"polred(T,{flag=0}): deprecated, use polredbest. Reduction of the\npolynomial T (gives minimal polynomials only). The following binary digits of\n(optional) flag are significant 1: partial reduction, 2: gives also elements."
function polred0(x1::LibPARI.Gen; x2::Integer = 0, x3 = nothing)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:polred0, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(x2),
                reinterpret(Int, Ptr{Int}((x3 === nothing ? C_NULL : x3.ptr))),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"polredabs(T,{flag=0}): a smallest generating polynomial of the number\nfield for the T2 norm on the roots, with smallest index for the minimal T2\nnorm. flag is optional, whose binary digit mean 1: give the element whose\ncharacteristic polynomial is the given polynomial. 4: give all polynomials\nof minimal T2 norm (give only one of P(x) and P(-x))."
function polredabs0(x1::LibPARI.Gen; x2::Integer = 0)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:polredabs0, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(x2),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"polredbest(T,{flag=0}): reduction of the polynomial T (gives minimal\npolynomials only). If flag=1, gives also elements."
function polredbest(x1::LibPARI.Gen; x2::Integer = 0)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:polredbest, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(x2),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"polredord(x): this function is obsolete, use polredbest."
function polredord(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:polredord, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"polroots(T): complex roots of the polynomial T using\nSchonhage's method, as modified by Gourdon."
function roots(x1::LibPARI.Gen; prec::Integer = 4)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:roots, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                prec,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"polrootsbound(T,{tau=0.01}): return a sharp upper bound for the\nmodulus of the largest complex root of the polynomial T with relative error\ntau."
function polrootsbound(x1::LibPARI.Gen; x2 = nothing)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:polrootsbound, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}((x2 === nothing ? C_NULL : x2.ptr))),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"polrootsff(x,{p},{a}): obsolete, use polrootsmod."
function polrootsff(x1::LibPARI.Gen; x2 = nothing, x3 = nothing)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:polrootsff, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}((x2 === nothing ? C_NULL : x2.ptr))),
                reinterpret(Int, Ptr{Int}((x3 === nothing ? C_NULL : x3.ptr))),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"polrootsmod(f,{D}): roots of the polynomial f over the finite field\ndefined by the domain D."
function polrootsmod(x1::LibPARI.Gen; x2 = nothing)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:polrootsmod, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}((x2 === nothing ? C_NULL : x2.ptr))),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"polrootspadic(f,p,r): p-adic roots of the polynomial f to precision r."
function polrootspadic(x1::LibPARI.Gen, x2::LibPARI.Gen, x3::Integer)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:polrootspadic, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(x3),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"polrootsreal(T,{ab}): real roots of the polynomial T with real\ncoefficients, using Uspensky's method. In interval ab = [a,b] if present."
function realroots(x1::LibPARI.Gen; x2 = nothing, prec::Integer = 4)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:realroots, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}((x2 === nothing ? C_NULL : x2.ptr))),
                prec,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"polsturm(T,{ab}): number of distinct real roots of the polynomial\nT (in the interval ab = [a,b] if present)."
function sturmpart(x1::LibPARI.Gen; x2 = nothing, x3 = nothing)
    return LibPARI.protected_call() do
        Int(
            LibPARI._trap_call(
                Int,
                cglobal((:sturmpart, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}((x2 === nothing ? C_NULL : x2.ptr))),
                reinterpret(Int, Ptr{Int}((x3 === nothing ? C_NULL : x3.ptr))),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            ),
        )
    end
end

"polsubcyclo(n,d,{v='x}): finds an equation (in variable v) for the d-th\ndegree subfields of Q(zeta_n). Output is a polynomial, or a vector of\npolynomials if there are several such fields or none."
function polsubcyclo(x1::Integer, x2::Integer; x3::Integer = -1)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:polsubcyclo, LibPARI.PARI_jll.libpari)),
                3,
                Int(x1),
                Int(x2),
                Int(x3),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"polsubcyclofast(n,d,{s=0},{exact=0}): If 1 <= d <= 6\nor a prime, finds an equation for the subfields of Q(zeta_n) with galois\ngroup C_d. Contrary to polsubcyclo, the output is\nalways a (possibly empty) vector of polynomials. If s = 0 (default) all\nsignatures, otherwise s = 1 (resp., -1) for totally real (resp., totally\ncomplex). Set exact = 1 for subfields of exact conductor n."
function polsubcyclofast(
    x1::LibPARI.Gen,
    x2::Integer;
    x3::Integer = 0,
    x4::Integer = 0,
)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:polsubcyclofast, LibPARI.PARI_jll.libpari)),
                4,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(x2),
                Int(x3),
                Int(x4),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"polsylvestermatrix(x,y): forms the sylvester matrix attached to the\ntwo polynomials x and y. Warning: the polynomial coefficients are in\ncolumns, not in rows."
function sylvestermatrix(x1::LibPARI.Gen, x2::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:sylvestermatrix, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"polsym(x,n): column vector of symmetric powers of the roots of x up to n."
function polsym(x1::LibPARI.Gen, x2::Integer)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:polsym, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(x2),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"poltchebi(n,{v='x}): deprecated alias for polchebyshev."
function polchebyshev1(x1::Integer; x2::Integer = -1)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:polchebyshev1, LibPARI.PARI_jll.libpari)),
                2,
                Int(x1),
                Int(x2),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"polteichmuller(T,p,r): return the polynomial whose roots (resp. leading\ncoef) are the Teichmuller lift of the roots (resp. leading coef) of T, to\np-adic precision r."
function polteichmuller(x1::LibPARI.Gen, x2::Integer, x3::Integer)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:polteichmuller, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, UInt(x2)),
                Int(x3),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"poltomonic(T,{&L}): T in Q[x]; returns U monic in Z[x] such that\nU(x) = C T(x/L) for some rational C and L. If &L is given, set it to L."
function poltomonic(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        out1 = Ref{Ptr{Int}}(C_NULL)
        av = LibPARI._avma()
        r = LibPARI._trap_call(
            Ptr{Int},
            cglobal((:poltomonic, LibPARI.PARI_jll.libpari)),
            2,
            reinterpret(Int, Ptr{Int}(x1.ptr)),
            reinterpret(Int, Base.unsafe_convert(Ptr{Ptr{Int}}, out1)),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
        )
        primary = LibPARI.Gen(r)
        o1 = LibPARI.Gen(out1[])
        LibPARI._set_avma(av)
        return (primary, o1)
    end
end

"poltschirnhaus(x): random Tschirnhausen transformation of the\npolynomial x."
function tschirnhaus(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:tschirnhaus, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"polylog(m,x,{flag=0}): m-th polylogarithm of x. flag is optional, and\ncan be 0: default, 1: D_m~-modified m-th polylog of x, 2: D_m-modified m-th\npolylog of x, 3: P_m-modified m-th polylog of x."
function polylog0(
    x1::Integer,
    x2::LibPARI.Gen;
    x3::Integer = 0,
    prec::Integer = 4,
)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:polylog0, LibPARI.PARI_jll.libpari)),
                4,
                Int(x1),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(x3),
                prec,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"polylogmult(s,{z},{t=0}): multiple polylogarithm value at integral\ns = [s1,...,sr] with argument z = [z1,...,zr]. If z is omitted, assume\nz = [1,...,1], i.e., multiple zeta value. More generally, return Yamamoto's\ninterpolation at t (ordinary multiple polylog at t = 0 and star value at\nt = 1)."
function polylogmult_interpolate(
    x1::LibPARI.Gen;
    x2 = nothing,
    x3 = nothing,
    prec::Integer = 4,
)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:polylogmult_interpolate, LibPARI.PARI_jll.libpari)),
                4,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}((x2 === nothing ? C_NULL : x2.ptr))),
                reinterpret(Int, Ptr{Int}((x3 === nothing ? C_NULL : x3.ptr))),
                prec,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"polzagier(n,m): Zagier's polynomials of index n,m."
function polzag(x1::Integer, x2::Integer)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:polzag, LibPARI.PARI_jll.libpari)),
                2,
                Int(x1),
                Int(x2),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"powers(x,n,{x0}): return the vector [1,x,...,x^n] if x0 is omitted,\nand [x0, x0*x, ..., x0*x^n] otherwise."
function gpowers0(x1::LibPARI.Gen, x2::Integer; x3 = nothing)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:gpowers0, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(x2),
                reinterpret(Int, Ptr{Int}((x3 === nothing ? C_NULL : x3.ptr))),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"precision(x,{n}): if n is present, return x at precision n. If n is\nomitted, return real precision of object x."
function precision00(x1::LibPARI.Gen; x2 = nothing)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:precision00, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}((x2 === nothing ? C_NULL : x2.ptr))),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"precprime(x): largest pseudoprime <= x, 0 if x<=1."
function precprime(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:precprime, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"prime(n): returns the n-th prime (n C-integer)."
function prime(x1::Integer)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:prime, LibPARI.PARI_jll.libpari)),
                1,
                Int(x1),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"primecert(N,{flag=0},{partial=0}): If N is a prime, return a Primality\nCertificate.  Return 0 otherwise. If flag = 0 return an ECPP certificate\n(Atkin-Morain); if flag = 1 return an N-1 certificate (Pocklington-Lehmer)"
function primecert0(x1::LibPARI.Gen; x2::Integer = 0, x3::Integer = 0)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:primecert0, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(x2),
                Int(x3),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"primecertexport(cert,{format=0}): Returns a string suitable for\nprint/write to display a primality certificate."
function primecertexport(x1::LibPARI.Gen; x2::Integer = 0)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:primecertexport, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(x2),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"primecertisvalid(cert): Verifies if cert is a valid PARI ECPP Primality certificate."
function primecertisvalid(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        Int(
            LibPARI._trap_call(
                Int,
                cglobal((:primecertisvalid, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            ),
        )
    end
end

"primepi(x): the prime counting function pi(x) = #{p <= x, p prime}."
function primepi(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:primepi, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"primes(n): returns the vector of the first n primes (integer), or the\nprimes in interval n = [a,b]."
function primes0(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:primes0, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"prodnumrat(F,a): product from n = a to infinity of F(n), where F-1\nis a rational function of degree less than or equal to -2."
function prodnumrat(x1::LibPARI.Gen, x2::Integer; prec::Integer = 4)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:prodnumrat, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(x2),
                prec,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"psdraw(list,{flag=0}): obsolete function."
function psdraw(x1::LibPARI.Gen; x2::Integer = 0)
    LibPARI.protected_call() do
        LibPARI._trap_call(
            Cvoid,
            cglobal((:psdraw, LibPARI.PARI_jll.libpari)),
            2,
            reinterpret(Int, Ptr{Int}(x1.ptr)),
            Int(x2),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
        )
    end
    return nothing
end

"psi(x,{der}): psi-function at x (der-th derivative of psi if der is set)"
function gpsi_der(x1::LibPARI.Gen; x2::Integer = 0, prec::Integer = 4)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:gpsi_der, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(x2),
                prec,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"psplothraw(listx,listy,{flag=0}): obsolete function."
function psplothraw(x1::LibPARI.Gen, x2::LibPARI.Gen; x3::Integer = 0)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:psplothraw, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(x3),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"qfauto(G,{fl}): automorphism group of the positive definite quadratic\nform G."
function qfauto0(x1::LibPARI.Gen; x2 = nothing)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:qfauto0, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}((x2 === nothing ? C_NULL : x2.ptr))),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"qfautoexport(qfa,{flag}): qfa being an automorphism group as output by\nqfauto, output a string representing the underlying matrix group in\nGAP notation (default) or Magma notation (flag = 1)."
function qfautoexport(x1::LibPARI.Gen; x2::Integer = 0)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:qfautoexport, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(x2),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"qfbclassno(D,{flag=0}): class number of discriminant D using Shanks's\nmethod by default. If (optional) flag is set to 1, use Euler products."
function qfbclassno0(x1::LibPARI.Gen; x2::Integer = 0)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:qfbclassno0, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(x2),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"qfbcomp(x,y): Gaussian composition with reduction of the binary\nquadratic forms x and y."
function qfbcomp(x1::LibPARI.Gen, x2::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:qfbcomp, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"qfbcompraw(x,y): Gaussian composition without reduction of the binary\nquadratic forms x and y."
function qfbcompraw(x1::LibPARI.Gen, x2::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:qfbcompraw, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"qfbcornacchia(d,n): Solves the equation\nx^2+dy^2 = n in integers x and y where d > 0 and\nn is prime or 4 times a prime."
function qfbcornacchia(x1::LibPARI.Gen, x2::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:qfbcornacchia, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"qfbhclassno(x): Hurwitz-Kronecker class number of x>0."
function hclassno(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:hclassno, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"qfbil(x,y,{q}): this function is obsolete, use qfeval."
function qfbil(x1::LibPARI.Gen, x2::LibPARI.Gen; x3 = nothing)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:qfbil, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                reinterpret(Int, Ptr{Int}((x3 === nothing ? C_NULL : x3.ptr))),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"qfbnucomp(x,y,L): composite of primitive positive definite quadratic\nforms x and y using nucomp and nudupl, where L=[|D/4|^(1/4)] is precomputed."
function nucomp(x1::LibPARI.Gen, x2::LibPARI.Gen, x3::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:nucomp, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                reinterpret(Int, Ptr{Int}(x3.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"qfbnupow(x,n,{L}): n-th power of primitive positive definite quadratic\nform x using nucomp and nudupl."
function nupow(x1::LibPARI.Gen, x2::LibPARI.Gen; x3 = nothing)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:nupow, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                reinterpret(Int, Ptr{Int}((x3 === nothing ? C_NULL : x3.ptr))),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"qfbpow(x,n): n-th power with reduction of the binary quadratic\nform x."
function qfbpow(x1::LibPARI.Gen, x2::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:qfbpow, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"qfbpowraw(x,n): n-th power without reduction of the binary quadratic\nform x."
function qfbpowraw(x1::LibPARI.Gen, x2::Integer)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:qfbpowraw, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(x2),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"qfbprimeform(x,p): returns the prime form of discriminant x, whose\nfirst coefficient is p."
function primeform(x1::LibPARI.Gen, x2::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:primeform, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"qfbred(x,{flag=0},{isd},{sd}): reduction of the binary\nquadratic form x. All other args. are optional. The argument isd and\nsd, if present, supply the values of floor(sqrt(d)) and sqrt(d)\nrespectively, where d is the discriminant. If d<0, its value is not used.\nflag can be any of 0: default; 1: do a single reduction step;"
function qfbred0(x1::LibPARI.Gen; x2::Integer = 0, x3 = nothing, x4 = nothing)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:qfbred0, LibPARI.PARI_jll.libpari)),
                4,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(x2),
                reinterpret(Int, Ptr{Int}((x3 === nothing ? C_NULL : x3.ptr))),
                reinterpret(Int, Ptr{Int}((x4 === nothing ? C_NULL : x4.ptr))),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"qfbredsl2(x,{isD}): reduction of the binary quadratic form x, returns\n[y,g] where y is reduced and g in Sl(2,Z) is such that g.x = y; isD, if\npresent, must be equal to sqrtint(D), where D > 0 is the discriminant of x."
function qfbredsl2(x1::LibPARI.Gen; x2 = nothing)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:qfbredsl2, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}((x2 === nothing ? C_NULL : x2.ptr))),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"qfbsolve(Q,n,{flag=0}): Solve the equation\nQ(x,y)=n in coprime integers x and y where Q is a binary quadratic form,\nup to the action of the special orthogonal group of Q over the integers.\nBinary digits of flag mean\n1: return all solutions,\n2: also include imprimitive solutions."
function qfbsolve(x1::LibPARI.Gen, x2::LibPARI.Gen; x3::Integer = 0)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:qfbsolve, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(x3),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"qfcholesky(q): given a square symmetric matrix M, return R such that\nR~*R = M, or [] if there is no solution."
function qfcholesky(x1::LibPARI.Gen; prec::Integer = 4)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:qfcholesky, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                prec,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"qfeval({q},x,{y}): evaluate the quadratic form q (symmetric matrix) at x;\nif y is present, evaluate the polar form at (x,y);\nif q omitted, use the standard Euclidean form."
function qfeval0(x2::LibPARI.Gen; x1 = nothing, x3 = nothing)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:qfeval0, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}((x1 === nothing ? C_NULL : x1.ptr))),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                reinterpret(Int, Ptr{Int}((x3 === nothing ? C_NULL : x3.ptr))),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"qfgaussred(q,{flag=0}): square reduction of the symmetric matrix q.\nflag=0: returns a square matrix A such that q(x) = sum_i A[i,i] (x[i] +\nsum_{j != i} A[i,j] x[j])^2; flag=1 return [U,V] where U is a square matrix\nand V a vector such that q = U~ * matdiagonal(V) * U"
function qfgaussred0(x1::LibPARI.Gen; x2::Integer = 0)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:qfgaussred0, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(x2),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"qfisom(G,H,{fl},{grp}): find an isomorphism between the integral positive\ndefinite quadratic forms G and H if it exists. G can also be given by a\nqfisominit structure which is preferable if several forms need to be compared\nto G."
function qfisom0(x1::LibPARI.Gen, x2::LibPARI.Gen; x3 = nothing, x4 = nothing)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:qfisom0, LibPARI.PARI_jll.libpari)),
                4,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                reinterpret(Int, Ptr{Int}((x3 === nothing ? C_NULL : x3.ptr))),
                reinterpret(Int, Ptr{Int}((x4 === nothing ? C_NULL : x4.ptr))),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"qfisominit(G,{fl},{m}): G being a square and symmetric matrix representing an\nintegral positive definite quadratic form, this function returns a structure\nallowing to compute isomorphisms between G and other quadratic form faster."
function qfisominit0(x1::LibPARI.Gen; x2 = nothing, x3 = nothing)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:qfisominit0, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}((x2 === nothing ? C_NULL : x2.ptr))),
                reinterpret(Int, Ptr{Int}((x3 === nothing ? C_NULL : x3.ptr))),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"qfjacobi(A): eigenvalues and orthogonal matrix of eigenvectors of the\nreal symmetric matrix A."
function jacobi(x1::LibPARI.Gen; prec::Integer = 4)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:jacobi, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                prec,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"qflll(x,{flag=0}): LLL reduction of the vectors forming the matrix x\n(gives the unimodular transformation matrix T such that x*T is LLL-reduced).\nflag is optional, and can be 0: default, 1: disable FLATTER, 2: assumes x\nis integral, returns a partially reduced basis, 3: assumes x is integral, in\nplace (return x*T), 4: assumes x is integral, returns [K,T] where K is the\ninteger kernel of x and T the LLL reduced image, 5: same as 4 but x may have\npolynomial coefficients, 8: same as 0 but x may have polynomial coefficients."
function qflll0(x1::LibPARI.Gen; x2::Integer = 0)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:qflll0, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(x2),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"qflllgram(G,{flag=0}): LLL reduction of the lattice whose gram matrix\nis G (gives the unimodular transformation matrix). flag is optional and can\nbe 0: default,1: disable FLATTER, 4: assumes x is integral,\nreturns [K,T],  where K is the integer kernel of x\nand T the LLL reduced image, 5: same as 4 but x may have polynomial\ncoefficients, 8: same as 0 but x may have polynomial coefficients."
function qflllgram0(x1::LibPARI.Gen; x2::Integer = 0)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:qflllgram0, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(x2),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"qfminimize(G): given a square symmetric matrix G with rational\ncoefficients and non-zero determinant, of dimension n >= 1, return [H,U,c]\nsuch that H = c * U~*G*U for some rational c, and H integral with minimal\ndeterminant."
function qfminimize(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:qfminimize, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"qfnorm(x,{q}): this function is obsolete, use qfeval."
function qfnorm(x1::LibPARI.Gen; x2 = nothing)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:qfnorm, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}((x2 === nothing ? C_NULL : x2.ptr))),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"qforbits(G,V): return the orbits of V under the action of the group\nof linear transformation generated by the set G, which must stabilize V."
function qforbits(x1::LibPARI.Gen, x2::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:qforbits, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"qfparam(G,sol,{flag=0}):\ncoefficients of binary quadratic forms that parametrize the\nsolutions of the ternary quadratic form G, using the particular\nsolution sol."
function qfparam(x1::LibPARI.Gen, x2::LibPARI.Gen; x3::Integer = 0)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:qfparam, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(x3),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"qfperfection(G): rank of matrix of xx~ for x minimal vectors of a Gram\nmatrix G."
function qfperfection(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:qfperfection, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"qfrep(q,B,{flag=0}): vector of (half) the number of vectors of norms\nfrom 1 to B for the integral and definite quadratic form q. If flag is 1,\ncount vectors of even norm from 1 to 2B."
function qfrep0(x1::LibPARI.Gen, x2::LibPARI.Gen; x3::Integer = 0)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:qfrep0, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(x3),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"qfsign(x): signature of the symmetric matrix x."
function qfsign(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:qfsign, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"qfsolve(G): solve over Q the quadratic equation X~ G X = 0, where\nG is a symmetric matrix."
function qfsolve(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:qfsolve, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"quadclassunit(D,{flag=0},{tech=[]}): compute the structure of the\nclass group and the regulator of the quadratic field of discriminant D.\nSee manual for the optional technical parameters."
function quadclassunit0(
    x1::LibPARI.Gen;
    x2::Integer = 0,
    x3 = nothing,
    prec::Integer = 4,
)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:quadclassunit0, LibPARI.PARI_jll.libpari)),
                4,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(x2),
                reinterpret(Int, Ptr{Int}((x3 === nothing ? C_NULL : x3.ptr))),
                prec,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"quaddisc(x): discriminant of the quadratic field Q(sqrt(x))."
function quaddisc(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:quaddisc, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"quadgen(D,{v = 'w}): standard generator g of quadratic order of\ndiscriminant D. If v is given, the variable name is used to display g,\nelse 'w' is used."
function quadgen0(x1::LibPARI.Gen; x2::Integer = -1)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:quadgen0, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(x2),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"quadhilbert(D): relative equation for the Hilbert class field\nof the quadratic field of discriminant D (which can also be a bnf)."
function quadhilbert(x1::LibPARI.Gen; prec::Integer = 4)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:quadhilbert, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                prec,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"quadpoly(D,{v='x}): quadratic polynomial corresponding to the\ndiscriminant D, in variable v."
function quadpoly0(x1::LibPARI.Gen; x2::Integer = -1)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:quadpoly0, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(x2),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"quadray(D,f): relative equation for the ray class field of\nconductor f for the quadratic field of discriminant D (which can also be a\nbnf)."
function quadray(x1::LibPARI.Gen, x2::LibPARI.Gen; prec::Integer = 4)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:quadray, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                prec,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"quadregulator(D): regulator of the real quadratic field of\ndiscriminant D."
function quadregulator(x1::LibPARI.Gen; prec::Integer = 4)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:quadregulator, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                prec,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"quadunit(D,{v = 'w}): fundamental unit u of the quadratic order of\ndiscriminant D where D must be positive.\nIf v is given, the variable name is used to display u, else 'w' is used."
function quadunit0(x1::LibPARI.Gen; x2::Integer = -1)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:quadunit0, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(x2),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"quadunitindex(D,f): given a fundamental discriminant D, returns the\nindex of the unit group of the order of conductor f."
function quadunitindex(x1::LibPARI.Gen, x2::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:quadunitindex, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"quadunitnorm(D): returns the norm of the fundamental unit of the\nquadratic order of discriminant D."
function quadunitnorm(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        Int(
            LibPARI._trap_call(
                Int,
                cglobal((:quadunitnorm, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            ),
        )
    end
end

"quit({status = 0}): quit, return to the system with exit status\n'status'."
function gp_quit(; x1::Integer = 0)
    LibPARI.protected_call() do
        LibPARI._trap_call(
            Cvoid,
            cglobal((:gp_quit, LibPARI.PARI_jll.libpari)),
            1,
            Int(x1),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
        )
    end
    return nothing
end

"ramanujantau(n,{ell=12}): compute the value of Ramanujan's tau function\nat n, assuming the GRH. If ell is 16, 18, 20, 22, or 26, same for the\nnewform of level 1 and corresponding weight. Otherwise, compute the\ncoefficient of the trace form at n. Algorithm in O(n^{1/2+eps})."
function ramanujantau(x1::LibPARI.Gen; x2::Integer = 12)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:ramanujantau, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(x2),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"random({N=2^31}): random object, depending on the type of N.\nInteger between 0 and N-1 (t_INT), int mod N (t_INTMOD), element in a finite\nfield (t_FFELT), point on an elliptic curve (ellinit mod p or over a finite\nfield)."
function genrand(; x1 = nothing)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:genrand, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}((x1 === nothing ? C_NULL : x1.ptr))),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"randomprime({N=2^31},{q}): returns a strong pseudo prime in [2, N-1].\nIf q is an integer, return a prime = 1 mod q; if q is an intmod, return\na prime in the given congruence class."
function randomprime0(; x1 = nothing, x2 = nothing)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:randomprime0, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}((x1 === nothing ? C_NULL : x1.ptr))),
                reinterpret(Int, Ptr{Int}((x2 === nothing ? C_NULL : x2.ptr))),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"read({filename}): read from the input file filename. If filename is\nomitted, reread last input file, be it from read() or \\r."
function gp_read_file(; x1::AbstractString = "")
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            let _cs1 = Base.cconvert(Cstring, x1)
                GC.@preserve _cs1 LibPARI._trap_call(
                    Ptr{Int},
                    cglobal((:gp_read_file, LibPARI.PARI_jll.libpari)),
                    1,
                    reinterpret(Int, Base.unsafe_convert(Cstring, _cs1)),
                    Int(0),
                    Int(0),
                    Int(0),
                    Int(0),
                    Int(0),
                    Int(0),
                    Int(0),
                )
            end
        end
    end
end

"readstr({filename}): returns the vector of GP strings containing\nthe lines in filename."
function readstr(; x1::AbstractString = "")
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            let _cs1 = Base.cconvert(Cstring, x1)
                GC.@preserve _cs1 LibPARI._trap_call(
                    Ptr{Int},
                    cglobal((:readstr, LibPARI.PARI_jll.libpari)),
                    1,
                    reinterpret(Int, Base.unsafe_convert(Cstring, _cs1)),
                    Int(0),
                    Int(0),
                    Int(0),
                    Int(0),
                    Int(0),
                    Int(0),
                    Int(0),
                )
            end
        end
    end
end

"readvec({filename}): create a vector whose components are the evaluation\nof all the expressions found in the input file filename."
function gp_readvec_file(; x1::AbstractString = "")
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            let _cs1 = Base.cconvert(Cstring, x1)
                GC.@preserve _cs1 LibPARI._trap_call(
                    Ptr{Int},
                    cglobal((:gp_readvec_file, LibPARI.PARI_jll.libpari)),
                    1,
                    reinterpret(Int, Base.unsafe_convert(Cstring, _cs1)),
                    Int(0),
                    Int(0),
                    Int(0),
                    Int(0),
                    Int(0),
                    Int(0),
                    Int(0),
                )
            end
        end
    end
end

"real(x): real part of x."
function greal(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:greal, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"removeprimes({x=[]}): remove primes in the vector x from the prime table.\nx can also be a single integer. List the current extra primes if x is omitted."
function removeprimes(; x1 = nothing)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:removeprimes, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}((x1 === nothing ? C_NULL : x1.ptr))),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"return({x=0}): return from current subroutine with result x."
function return0(; x1 = nothing)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:return0, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}((x1 === nothing ? C_NULL : x1.ptr))),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"rnfalgtobasis(rnf,x): relative version of nfalgtobasis, where rnf is a\nrelative numberfield."
function rnfalgtobasis(x1::LibPARI.Gen, x2::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:rnfalgtobasis, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"rnfbasis(bnf,M): given a projective Z_K-module M as output by\nrnfpseudobasis or rnfsteinitz, gives either a basis of M if it is free, or an\nn+1-element generating set."
function rnfbasis(x1::LibPARI.Gen, x2::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:rnfbasis, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"rnfbasistoalg(rnf,x): relative version of nfbasistoalg, where rnf is a\nrelative numberfield."
function rnfbasistoalg(x1::LibPARI.Gen, x2::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:rnfbasistoalg, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"rnfcharpoly(nf,T,a,{var='x}): characteristic polynomial of a\nover nf, where a belongs to the algebra defined by T over nf. Returns a\npolynomial in variable var (x by default)."
function rnfcharpoly(
    x1::LibPARI.Gen,
    x2::LibPARI.Gen,
    x3::LibPARI.Gen;
    x4::Integer = -1,
)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:rnfcharpoly, LibPARI.PARI_jll.libpari)),
                4,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                reinterpret(Int, Ptr{Int}(x3.ptr)),
                Int(x4),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"rnfconductor(bnf,T,{flag=0}): conductor of the Abelian extension\nof bnf defined by T. The result is [conductor,bnr,subgroup],\nwhere conductor is the conductor itself, bnr the attached bnr\nstructure, and subgroup the HNF defining the norm\ngroup (Artin or Takagi group) on the given generators bnr.gen.\nIf flag is 1, return a bnr modulo deg(T), attached to Cl_f / (deg(T));\nif flag is 2 only return [f, idealfactor(f[1])]."
function rnfconductor0(x1::LibPARI.Gen, x2::LibPARI.Gen; x3::Integer = 0)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:rnfconductor0, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(x3),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"rnfdet(nf,M): given a pseudo-matrix M, compute its determinant."
function rnfdet(x1::LibPARI.Gen, x2::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:rnfdet, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"rnfdisc(nf,T): given a polynomial T with coefficients in nf, gives a\n2-component vector [D,d], where D is the relative ideal discriminant, and d\nis the relative discriminant in nf^*/nf*^2."
function rnfdiscf(x1::LibPARI.Gen, x2::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:rnfdiscf, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"rnfeltabstorel(rnf,x): transforms the element x from absolute to\nrelative representation."
function rnfeltabstorel(x1::LibPARI.Gen, x2::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:rnfeltabstorel, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"rnfeltdown(rnf,x,{flag=0}): expresses x on the base field if possible;\nreturns an error otherwise."
function rnfeltdown0(x1::LibPARI.Gen, x2::LibPARI.Gen; x3::Integer = 0)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:rnfeltdown0, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(x3),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"rnfeltnorm(rnf,x): returns the relative norm N_{L/K}(x), as an element\nof K."
function rnfeltnorm(x1::LibPARI.Gen, x2::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:rnfeltnorm, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"rnfeltreltoabs(rnf,x): transforms the element x from relative to\nabsolute representation."
function rnfeltreltoabs(x1::LibPARI.Gen, x2::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:rnfeltreltoabs, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"rnfelttrace(rnf,x): returns the relative trace Tr_{L/K}(x), as an element\nof K."
function rnfelttrace(x1::LibPARI.Gen, x2::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:rnfelttrace, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"rnfeltup(rnf,x,{flag=0}): expresses x (belonging to the base field) on\nthe relative field. As a t_POLMOD if flag = 0 and as a t_COL on the absolute\nfield integer basis if flag = 1."
function rnfeltup0(x1::LibPARI.Gen, x2::LibPARI.Gen; x3::Integer = 0)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:rnfeltup0, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(x3),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"rnfequation(nf,pol,{flag=0}): given a pol with coefficients in nf,\ngives an absolute equation z of the number field defined by pol. flag is\noptional, and can be 0: default, or nonzero, gives [z,al,k], where\nz defines the absolute equation L/Q as in the default behavior,\nal expresses as an element of L a root of the polynomial\ndefining the base field nf, and k is a small integer such that\nt = b + k al is a root of z, for b a root of pol."
function rnfequation0(x1::LibPARI.Gen, x2::LibPARI.Gen; x3::Integer = 0)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:rnfequation0, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(x3),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"rnfhnfbasis(bnf,M): given a bnf attached to a number field K and a\nprojective Z_K module M given by a pseudo-matrix, returns either a true\nHNF basis of M if one exists, or zero otherwise. If M is a polynomial with\ncoefficients in K, replace it by the pseudo-matrix returned by\nrnfpseudobasis."
function rnfhnfbasis(x1::LibPARI.Gen, x2::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:rnfhnfbasis, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"rnfidealabstorel(rnf,x): transforms the ideal x from absolute to\nrelative representation."
function rnfidealabstorel(x1::LibPARI.Gen, x2::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:rnfidealabstorel, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"rnfidealdown(rnf,x): finds the intersection of the ideal x with the\nbase field."
function rnfidealdown(x1::LibPARI.Gen, x2::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:rnfidealdown, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"rnfidealfactor(rnf,x): factor the ideal x into\nprime ideals in the number field nfinit(rnf)."
function rnfidealfactor(x1::LibPARI.Gen, x2::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:rnfidealfactor, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"rnfidealhnf(rnf,x): relative version of idealhnf, where rnf is a\nrelative numberfield."
function rnfidealhnf(x1::LibPARI.Gen, x2::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:rnfidealhnf, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"rnfidealmul(rnf,x,y): relative version of idealmul, where rnf is a\nrelative numberfield."
function rnfidealmul(x1::LibPARI.Gen, x2::LibPARI.Gen, x3::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:rnfidealmul, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                reinterpret(Int, Ptr{Int}(x3.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"rnfidealnormabs(rnf,x): absolute norm of the ideal x."
function rnfidealnormabs(x1::LibPARI.Gen, x2::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:rnfidealnormabs, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"rnfidealnormrel(rnf,x): relative norm of the ideal x."
function rnfidealnormrel(x1::LibPARI.Gen, x2::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:rnfidealnormrel, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"rnfidealprimedec(rnf,pr): return prime ideal decomposition of the maximal\nideal pr of K in L/K; pr is also allowed to be a prime number p, in which\ncase return a pair of vectors [SK,SL], where SK contains the primes of K\nabove p and SL[i] is the vector of primes of L above SK[i]."
function rnfidealprimedec(x1::LibPARI.Gen, x2::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:rnfidealprimedec, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"rnfidealreltoabs(rnf,x,{flag=0}): transforms the ideal x from relative to\nabsolute representation. As a vector of t_POLMODs if flag = 0 and as an ideal\nin HNF in the absolute field if flag = 1."
function rnfidealreltoabs0(x1::LibPARI.Gen, x2::LibPARI.Gen; x3::Integer = 0)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:rnfidealreltoabs0, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(x3),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"rnfidealtwoelt(rnf,x): relative version of idealtwoelt, where rnf\nis a relative numberfield."
function rnfidealtwoelement(x1::LibPARI.Gen, x2::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:rnfidealtwoelement, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"rnfidealup(rnf,x,{flag=0}): lifts the ideal x (of the base field) to the\nrelative field. As a vector of t_POLMODs if flag = 0 and as an ideal in HNF\nin the absolute field if flag = 1."
function rnfidealup0(x1::LibPARI.Gen, x2::LibPARI.Gen; x3::Integer = 0)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:rnfidealup0, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(x3),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"rnfinit(nf,T,{flag=0}): T being an irreducible polynomial\ndefined over the number field nf, initializes a vector of data necessary for\nworking in relative number fields (rnf functions). See manual for technical\ndetails."
function rnfinit0(x1::LibPARI.Gen, x2::LibPARI.Gen; x3::Integer = 0)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:rnfinit0, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(x3),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"rnfisabelian(nf,T): T being a relative polynomial with coefficients\nin nf, return 1 if it defines an abelian extension, and 0 otherwise."
function rnfisabelian(x1::LibPARI.Gen, x2::LibPARI.Gen)
    return LibPARI.protected_call() do
        Int(
            LibPARI._trap_call(
                Int,
                cglobal((:rnfisabelian, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            ),
        )
    end
end

"rnfisfree(bnf,M): given a bnf attached to a number field K and a\nprojective Z_K module M given by a pseudo-matrix, return true (1) if M\nis free else return false (0)."
function rnfisfree(x1::LibPARI.Gen, x2::LibPARI.Gen)
    return LibPARI.protected_call() do
        Int(
            LibPARI._trap_call(
                Int,
                cglobal((:rnfisfree, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            ),
        )
    end
end

"rnfislocalcyclo(rnf): true(1) if the l-extension attached to rnf\nis locally cyclotomic (locally contained in the Z_l extension of K_v at\nall places v | l), false(0) if not."
function rnfislocalcyclo(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        Int(
            LibPARI._trap_call(
                Int,
                cglobal((:rnfislocalcyclo, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            ),
        )
    end
end

"rnfisnorm(T,a,{flag=0}): T is as output by rnfisnorminit applied to\nL/K. Tries to tell whether a is a norm from L/K. Returns a vector [x,q]\nwhere a=Norm(x)*q. Looks for a solution which is a S-integer, with S a list\nof places in K containing the ramified primes, generators of the class group\nof ext, as well as those primes dividing a. If L/K is Galois, you may omit\nflag, otherwise it is used to add more places to S: all the places above the\nprimes p <= flag (resp. p | flag) if flag > 0 (resp. flag < 0). The answer\nis guaranteed (i.e a is a norm iff q=1) if L/K is Galois or, under GRH, if S\ncontains all primes less than 4log(disc(M))^2, where M is the normal\nclosure of L/K."
function rnfisnorm(x1::LibPARI.Gen, x2::LibPARI.Gen; x3::Integer = 0)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:rnfisnorm, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(x3),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"rnfisnorminit(pol,polrel,{flag=2}): let K be defined by a root of pol,\nL/K the extension defined by polrel. Compute technical data needed by\nrnfisnorm to solve norm equations Nx = a, for x in L, and a in K. If flag=0,\ndo not care whether L/K is Galois or not; if flag = 1, assume L/K is Galois;\nif flag = 2, determine whether L/K is Galois."
function rnfisnorminit(x1::LibPARI.Gen, x2::LibPARI.Gen; x3::Integer = 2)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:rnfisnorminit, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(x3),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"rnfkummer(bnr,{subgp}): this function is deprecated. Use bnrclassfield."
function rnfkummer(x1::LibPARI.Gen; x2 = nothing, prec::Integer = 4)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:rnfkummer, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}((x2 === nothing ? C_NULL : x2.ptr))),
                prec,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"rnflllgram(nf,pol,order): given a pol with coefficients in nf and an\norder as output by rnfpseudobasis or similar, gives [[neworder],U], where\nneworder is a reduced order and U is the unimodular transformation matrix."
function rnflllgram(
    x1::LibPARI.Gen,
    x2::LibPARI.Gen,
    x3::LibPARI.Gen;
    prec::Integer = 4,
)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:rnflllgram, LibPARI.PARI_jll.libpari)),
                4,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                reinterpret(Int, Ptr{Int}(x3.ptr)),
                prec,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"rnfnormgroup(bnr,pol): norm group (or Artin or Takagi group)\ncorresponding to the Abelian extension of bnr.bnf defined by pol, where\nthe module corresponding to bnr is assumed to be a multiple of the\nconductor. The result is the HNF defining the norm group on the\ngenerators in bnr.gen."
function rnfnormgroup(x1::LibPARI.Gen, x2::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:rnfnormgroup, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"rnfpolred(nf,pol): given a pol with coefficients in nf, finds a list\nof relative polynomials defining some subfields, hopefully simpler."
function rnfpolred(x1::LibPARI.Gen, x2::LibPARI.Gen; prec::Integer = 4)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:rnfpolred, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                prec,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"rnfpolredabs(nf,pol,{flag=0}): given an irreducible pol with coefficients\nin nf, finds a canonical relative polynomial defining the same field.\nBinary digits of flag mean: 1: return also the element whose characteristic\npolynomial is the given polynomial, 2: return an absolute polynomial,\n16: partial reduction."
function rnfpolredabs(x1::LibPARI.Gen, x2::LibPARI.Gen; x3::Integer = 0)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:rnfpolredabs, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(x3),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"rnfpolredbest(nf,pol,{flag=0}): given a pol with coefficients in nf,\nfinds a relative polynomial P defining the same field, hopefully simpler\nthan pol; flag\ncan be 0: default, 1: return [P,a], where a is a root of pol\n2: return an absolute polynomial Pabs, 3:\nreturn [Pabs, a,b], where a is a root of nf.pol and b is a root of pol."
function rnfpolredbest(x1::LibPARI.Gen, x2::LibPARI.Gen; x3::Integer = 0)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:rnfpolredbest, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(x3),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"rnfpseudobasis(nf,T): given an irreducible polynomial T with\ncoefficients in nf, returns [A,J,D,d] where [A,J] is a pseudo basis of the\nmaximal order of the extension, D is the relative ideal discriminant, and d\nis the relative discriminant in nf^*/nf*^2."
function rnfpseudobasis(x1::LibPARI.Gen, x2::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:rnfpseudobasis, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"rnfsteinitz(nf,M): given a nf attached to a number field K and a\nprojective module M given by a pseudo-matrix, returns [A,I,D,d] where (A,I)\nis a pseudo basis for M where all the ideals except perhaps the last are\ntrivial. If M is a polynomial with coefficients in K, replace it by the\npseudo-matrix returned by rnfpseudobasis."
function rnfsteinitz(x1::LibPARI.Gen, x2::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:rnfsteinitz, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"rootsof1(N): column vector of complex N-th roots of 1."
function grootsof1(x1::Integer; prec::Integer = 4)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:grootsof1, LibPARI.PARI_jll.libpari)),
                2,
                Int(x1),
                prec,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"round(x,{&e}): take the nearest integer to all the coefficients of x.\nIf e is present, do not take into account loss of integer part precision,\nand set e = error estimate in bits."
function round0(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        out1 = Ref{Ptr{Int}}(C_NULL)
        av = LibPARI._avma()
        r = LibPARI._trap_call(
            Ptr{Int},
            cglobal((:round0, LibPARI.PARI_jll.libpari)),
            2,
            reinterpret(Int, Ptr{Int}(x1.ptr)),
            reinterpret(Int, Base.unsafe_convert(Ptr{Ptr{Int}}, out1)),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
        )
        primary = LibPARI.Gen(r)
        o1 = LibPARI.Gen(out1[])
        LibPARI._set_avma(av)
        return (primary, o1)
    end
end

"select(f,A,{flag=0}): selects elements of A according to the selection\nfunction f. If flag is 1, return the indices of those elements (indirect\nselection)."
function select0(x1::LibPARI.Gen, x2::LibPARI.Gen; x3::Integer = 0)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:select0, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(x3),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"self(): return the calling function or closure. Useful for defining\nanonymous recursive functions."
function pari_self()
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:pari_self, LibPARI.PARI_jll.libpari)),
                0,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"seralgdep(s,p,r): find a linear relation between powers (1,s, ..., s^p)\nof the series s, with polynomial coefficients of degree <= r."
function seralgdep(x1::LibPARI.Gen, x2::Integer, x3::Integer)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:seralgdep, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(x2),
                Int(x3),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"serchop(s,{n=0}): remove all terms of degree strictly less than n in\nseries s."
function serchop(x1::LibPARI.Gen; x2::Integer = 0)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:serchop, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(x2),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"serconvol(x,y): convolution (or Hadamard product) of two power series."
function convol(x1::LibPARI.Gen, x2::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:convol, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"serdiffdep(s,p,r): find an inhomogenous linear differential equation\nsatisfied by the series s, with polynomial coefficients of degree <= r. The\nresult is a pair [E,P] such that E(d)(S)=P where E(d) is interpreted as a\ndifferential polynomial, or 0 in case no relation is found."
function serdiffdep(x1::LibPARI.Gen, x2::Integer, x3::Integer)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:serdiffdep, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(x2),
                Int(x3),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"serlaplace(x): replaces the power series sum of a_n*x^n/n! by sum of\na_n*x^n. For the reverse operation, use serconvol(x,exp(X))."
function laplace(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:laplace, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"serprec(x,v):\nreturn the absolute precision x with respect to power series in the variable v."
function gpserprec(x1::LibPARI.Gen, x2::Integer)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:gpserprec, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(x2),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"serreverse(s): reversion of the power series s."
function serreverse(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:serreverse, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"setbinop(f,X,{Y}): the set {f(x,y), x in X, y in Y}. If Y is omitted,\nassume that X = Y and that f is symmetric."
function setbinop(x1::LibPARI.Gen, x2::LibPARI.Gen; x3 = nothing)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:setbinop, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                reinterpret(Int, Ptr{Int}((x3 === nothing ? C_NULL : x3.ptr))),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"setdelta(x,y): symmetric difference of the sets x and y."
function setdelta(x1::LibPARI.Gen, x2::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:setdelta, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"setintersect(x,y): intersection of the sets x and y."
function setintersect(x1::LibPARI.Gen, x2::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:setintersect, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"setisset(x): true(1) if x is a set (row vector with strictly\nincreasing entries), false(0) if not."
function setisset(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        Int(
            LibPARI._trap_call(
                Int,
                cglobal((:setisset, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            ),
        )
    end
end

"setminus(x,y): set of elements of x not belonging to y."
function setminus(x1::LibPARI.Gen, x2::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:setminus, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"setrand(n): reset the seed of the random number generator to n."
function setrand(x1::LibPARI.Gen)
    LibPARI.protected_call() do
        LibPARI._trap_call(
            Cvoid,
            cglobal((:setrand, LibPARI.PARI_jll.libpari)),
            1,
            reinterpret(Int, Ptr{Int}(x1.ptr)),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
        )
    end
    return nothing
end

"setsearch(S,x,{flag=0}): determines whether x belongs to the set (or\nsorted list) S.\nIf flag is 0 or omitted, returns 0 if it does not, otherwise returns the index\nj such that x==S[j]. If flag is nonzero, return 0 if x belongs to S,\notherwise the index j where it should be inserted."
function setsearch(x1::LibPARI.Gen, x2::LibPARI.Gen; x3::Integer = 0)
    return LibPARI.protected_call() do
        Int(
            LibPARI._trap_call(
                Int,
                cglobal((:setsearch, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(x3),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            ),
        )
    end
end

"setunion(x,y): union of the sets x and y."
function setunion(x1::LibPARI.Gen, x2::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:setunion, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"shiftmul(x,n): multiply x by 2^n (n>=0 or n<0)."
function gmul2n(x1::LibPARI.Gen, x2::Integer)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:gmul2n, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(x2),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"sigma(x,{k=1}): sum of the k-th powers of the divisors of x. k is\noptional and if omitted is assumed to be equal to 1."
function sumdivk(x1::LibPARI.Gen; x2::Integer = 1)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:sumdivk, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(x2),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"sign(x): sign of x, of type integer, real or fraction."
function gsigne(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        Int(
            LibPARI._trap_call(
                Cint,
                cglobal((:gsigne, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            ),
        )
    end
end

"simplify(x): simplify the object x as much as possible."
function simplify(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:simplify, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"sin(x): sine of x."
function gsin(x1::LibPARI.Gen; prec::Integer = 4)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:gsin, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                prec,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"sinc(x): sinc function of x."
function gsinc(x1::LibPARI.Gen; prec::Integer = 4)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:gsinc, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                prec,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"sinh(x): hyperbolic sine of x."
function gsinh(x1::LibPARI.Gen; prec::Integer = 4)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:gsinh, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                prec,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"sizebyte(x): number of bytes occupied by the complete tree of the\nobject x."
function gsizebyte(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        Int(
            LibPARI._trap_call(
                Int,
                cglobal((:gsizebyte, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            ),
        )
    end
end

"sizedigit(x): rough upper bound for the number of decimal digits\nof (the components of) x. DEPRECATED."
function sizedigit(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        Int(
            LibPARI._trap_call(
                Int,
                cglobal((:sizedigit, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            ),
        )
    end
end

"snfrank(D,{q=0}): assuming that D is a Smith normal form\n(i.e. vector of elementary divisors) for some module and q a power of an\nirreducible element or 0 (default if omitted), returns the rank of D/qD."
function snfrank(x1::LibPARI.Gen; x2 = nothing)
    return LibPARI.protected_call() do
        Int(
            LibPARI._trap_call(
                Int,
                cglobal((:snfrank, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}((x2 === nothing ? C_NULL : x2.ptr))),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            ),
        )
    end
end

"sqr(x): square of x. NOT identical to x*x."
function gsqr(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:gsqr, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"sqrt(x): square root of x."
function gsqrt(x1::LibPARI.Gen; prec::Integer = 4)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:gsqrt, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                prec,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"sqrtint(x,{&r}): integer square root y of x, where x is a nonnegative\nreal number. If r is present, set it to the remainder x - y^2."
function sqrtint0(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        out1 = Ref{Ptr{Int}}(C_NULL)
        av = LibPARI._avma()
        r = LibPARI._trap_call(
            Ptr{Int},
            cglobal((:sqrtint0, LibPARI.PARI_jll.libpari)),
            2,
            reinterpret(Int, Ptr{Int}(x1.ptr)),
            reinterpret(Int, Base.unsafe_convert(Ptr{Ptr{Int}}, out1)),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
        )
        primary = LibPARI.Gen(r)
        o1 = LibPARI.Gen(out1[])
        LibPARI._set_avma(av)
        return (primary, o1)
    end
end

"sqrtn(x,n,{&z}): nth-root of x, n must be integer. If present, z is\nset to a suitable root of unity to recover all solutions. If it was not\npossible, z is set to zero."
function gsqrtn(x1::LibPARI.Gen, x2::LibPARI.Gen; prec::Integer = 4)
    return LibPARI.protected_call() do
        out1 = Ref{Ptr{Int}}(C_NULL)
        av = LibPARI._avma()
        r = LibPARI._trap_call(
            Ptr{Int},
            cglobal((:gsqrtn, LibPARI.PARI_jll.libpari)),
            4,
            reinterpret(Int, Ptr{Int}(x1.ptr)),
            reinterpret(Int, Ptr{Int}(x2.ptr)),
            reinterpret(Int, Base.unsafe_convert(Ptr{Ptr{Int}}, out1)),
            prec,
            Int(0),
            Int(0),
            Int(0),
            Int(0),
        )
        primary = LibPARI.Gen(r)
        o1 = LibPARI.Gen(out1[])
        LibPARI._set_avma(av)
        return (primary, o1)
    end
end

"sqrtnint(x,n): integer n-th root of x, where x is nonnegative real\nnumber."
function sqrtnint(x1::LibPARI.Gen, x2::Integer)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:sqrtnint, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(x2),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"stirling(n,k,{flag=1}): if flag=1 (default) return the Stirling number\nof the first kind s(n,k), if flag=2, return the Stirling number of the second\nkind S(n,k)."
function stirling(x1::Integer, x2::Integer; x3::Integer = 1)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:stirling, LibPARI.PARI_jll.libpari)),
                3,
                Int(x1),
                Int(x2),
                Int(x3),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"strjoin(v,{p = \"\"}): joins the strings in vector v, separating them with\ndelimiter p."
function strjoin(x1::LibPARI.Gen; x2 = nothing)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:strjoin, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}((x2 === nothing ? C_NULL : x2.ptr))),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"strsplit(s,{p = \"\"}): splits the string s into a vector of strings, with\np acting as a delimiter between successive fields; if p is empty or omitted,\nsplit into characters."
function strsplit(x1::LibPARI.Gen; x2 = nothing)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:strsplit, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}((x2 === nothing ? C_NULL : x2.ptr))),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"strtime(t): return a string describing the time t in milliseconds,\nin the format used by the GP timer."
function strtime(x1::Integer)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:strtime, LibPARI.PARI_jll.libpari)),
                1,
                Int(x1),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"subcyclohminus(fH,{p=0}):\nLet F be the abelian number field contained in Q(zeta_f) corresponding\nto the subgroup H of (Z/fZ)^*. Let h be the relative class number\nh^-(F) and Q the Hasse unit index in {1,2}. If Q could be computed, returns\n[h, Q]; else returns [2h/Q, 0]."
function subcyclohminus(x1::LibPARI.Gen; x2 = nothing)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:subcyclohminus, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}((x2 === nothing ? C_NULL : x2.ptr))),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"subcycloiwasawa(fH,p,{n=0}): Let F be the abelian\nnumber field contained in Q(zeta_f) corresponding to the subgroup H of\n(Z/fZ)^*. Returns the minus part of Iwasawa polynomials attached to the\ncyclotomic Z_p extension of F."
function subcycloiwasawa(x1::LibPARI.Gen, x2::LibPARI.Gen; x3::Integer = 0)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:subcycloiwasawa, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(x3),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"subcyclopclgp(fH,p,{flag=0}): Let F be the abelian\nnumber field contained in Q(zeta_f) corresponding to the subgroup H of\n(Z/fZ)^*. Returns the minus part of Iwasawa polynomials attached to the\nideal class group of F."
function subcyclopclgp(x1::LibPARI.Gen, x2::LibPARI.Gen; x3::Integer = 0)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:subcyclopclgp, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(x3),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"subst(x,y,z): in expression x, replace the variable y by the\nexpression z."
function gsubst(x1::LibPARI.Gen, x2::Integer, x3::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:gsubst, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(x2),
                reinterpret(Int, Ptr{Int}(x3.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"substpol(x,y,z): in expression x, replace the polynomial y by the\nexpression z, using remainder decomposition of x."
function gsubstpol(x1::LibPARI.Gen, x2::LibPARI.Gen, x3::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:gsubstpol, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                reinterpret(Int, Ptr{Int}(x3.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"substvec(x,v,w): in expression x, make a best effort to replace the\nvariables v1,...,vn by the expression w1,...,wn."
function gsubstvec(x1::LibPARI.Gen, x2::LibPARI.Gen, x3::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:gsubstvec, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                reinterpret(Int, Ptr{Int}(x3.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"sumdedekind(h,k): Dedekind sum attached to h,k."
function sumdedekind(x1::LibPARI.Gen, x2::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:sumdedekind, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"sumdigits(n,{B=10}): sum of digits in the integer n, when written in\nbase B."
function sumdigits0(x1::LibPARI.Gen; x2 = nothing)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:sumdigits0, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}((x2 === nothing ? C_NULL : x2.ptr))),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"sumformal(f,{v}): formal sum of f with respect to v, or to the\nmain variable of f if v is omitted."
function sumformal(x1::LibPARI.Gen; x2::Integer = -1)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:sumformal, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(x2),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"sumnumapinit({asymp}): initialize tables for Abel-Plana\nsummation of a series."
function sumnumapinit(; x1 = nothing, prec::Integer = 4)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:sumnumapinit, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}((x1 === nothing ? C_NULL : x1.ptr))),
                prec,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"sumnuminit({asymp}): initialize tables for Euler-MacLaurin delta\nsummation of a series with positive terms."
function sumnuminit(; x1 = nothing, prec::Integer = 4)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:sumnuminit, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}((x1 === nothing ? C_NULL : x1.ptr))),
                prec,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"sumnumlagrangeinit({asymp},{c1}): initialize tables for Lagrange\nsummation of a series."
function sumnumlagrangeinit(; x1 = nothing, x2 = nothing, prec::Integer = 4)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:sumnumlagrangeinit, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}((x1 === nothing ? C_NULL : x1.ptr))),
                reinterpret(Int, Ptr{Int}((x2 === nothing ? C_NULL : x2.ptr))),
                prec,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"sumnummonieninit({asymp},{w},{n0 = 1}): initialize tables for Monien summation of a series with positive terms."
function sumnummonieninit(;
    x1 = nothing,
    x2 = nothing,
    x3 = nothing,
    prec::Integer = 4,
)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:sumnummonieninit, LibPARI.PARI_jll.libpari)),
                4,
                reinterpret(Int, Ptr{Int}((x1 === nothing ? C_NULL : x1.ptr))),
                reinterpret(Int, Ptr{Int}((x2 === nothing ? C_NULL : x2.ptr))),
                reinterpret(Int, Ptr{Int}((x3 === nothing ? C_NULL : x3.ptr))),
                prec,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"sumnumrat(F,a): sum from n = a to infinity of F(n), where F\nis a rational function of degree less than or equal to -2."
function sumnumrat(x1::LibPARI.Gen, x2::LibPARI.Gen; prec::Integer = 4)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:sumnumrat, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                prec,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"system(str): str being a string, execute the system command str."
function gpsystem(x1::AbstractString)
    return LibPARI.protected_call() do
        Int(
            let _cs1 = Base.cconvert(Cstring, x1)
                GC.@preserve _cs1 LibPARI._trap_call(
                    Int,
                    cglobal((:gpsystem, LibPARI.PARI_jll.libpari)),
                    1,
                    reinterpret(Int, Base.unsafe_convert(Cstring, _cs1)),
                    Int(0),
                    Int(0),
                    Int(0),
                    Int(0),
                    Int(0),
                    Int(0),
                    Int(0),
                )
            end,
        )
    end
end

"tan(x): tangent of x."
function gtan(x1::LibPARI.Gen; prec::Integer = 4)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:gtan, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                prec,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"tanh(x): hyperbolic tangent of x."
function gtanh(x1::LibPARI.Gen; prec::Integer = 4)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:gtanh, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                prec,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"taylor(x,t,{d=seriesprecision}): taylor expansion of x with respect to\nt, adding O(t^d) to all components of x."
function tayl(x1::LibPARI.Gen, x2::Integer; seriesprec::Integer = 16)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:tayl, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(x2),
                seriesprec,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"teichmuller(x,{tab}): Teichmuller character of p-adic number x. If\nx = [p,n], return the lifts of all teichmuller(i + O(p^n)) for\ni = 1, ..., p-1. Such a vector can be fed back to teichmuller, as the\noptional argument tab, to speed up later computations."
function teichmuller(x1::LibPARI.Gen; x2 = nothing)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:teichmuller, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}((x2 === nothing ? C_NULL : x2.ptr))),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"theta(q,z): Jacobi sine theta-function."
function theta(x1::LibPARI.Gen, x2::LibPARI.Gen; prec::Integer = 4)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:theta, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                prec,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"thetanullk(q,k): k-th derivative at z=0 of theta(q,z)."
function thetanullk(x1::LibPARI.Gen, x2::Integer; prec::Integer = 4)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:thetanullk, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(x2),
                prec,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"thue(tnf,a,{sol}): solve the equation P(x,y)=a, where tnf was created\nwith thueinit(P), and sol, if present, contains the solutions of Norm(x)=a\nmodulo units in the number field defined by P. If tnf was computed without\nassuming GRH (flag 1 in thueinit), the result is unconditional. If tnf is a\npolynomial, compute thue(thueinit(P,0), a)."
function thue(x1::LibPARI.Gen, x2::LibPARI.Gen; x3 = nothing)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:thue, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                reinterpret(Int, Ptr{Int}((x3 === nothing ? C_NULL : x3.ptr))),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"thueinit(P,{flag=0}): initialize the tnf corresponding to P, that will\nbe used to solve Thue equations P(x,y) = some-integer. If flag is nonzero,\ncertify the result unconditionally. Otherwise, assume GRH (much faster of\ncourse)."
function thueinit(x1::LibPARI.Gen; x2::Integer = 0, prec::Integer = 4)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:thueinit, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(x2),
                prec,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"trace(x): trace of x."
function gtrace(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:gtrace, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"truncate(x,{&e}): truncation of x; when x is a power series,take away\nthe O(X^). If e is present, do not take into account loss of integer part\nprecision, and set e = error estimate in bits."
function trunc0(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        out1 = Ref{Ptr{Int}}(C_NULL)
        av = LibPARI._avma()
        r = LibPARI._trap_call(
            Ptr{Int},
            cglobal((:trunc0, LibPARI.PARI_jll.libpari)),
            2,
            reinterpret(Int, Ptr{Int}(x1.ptr)),
            reinterpret(Int, Base.unsafe_convert(Ptr{Ptr{Int}}, out1)),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
        )
        primary = LibPARI.Gen(r)
        o1 = LibPARI.Gen(out1[])
        LibPARI._set_avma(av)
        return (primary, o1)
    end
end

"type(x): return the type of the GEN x."
function type0(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:type0, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"unexportall(): empty the list of variables exported to the parallel\nworld."
function unexportall()
    LibPARI.protected_call() do
        LibPARI._trap_call(
            Cvoid,
            cglobal((:unexportall, LibPARI.PARI_jll.libpari)),
            0,
            Int(0),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
        )
    end
    return nothing
end

"valuation(x,{p}): valuation of x with respect to p."
function gpvaluation(x1::LibPARI.Gen; x2 = nothing)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:gpvaluation, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}((x2 === nothing ? C_NULL : x2.ptr))),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"varhigher(name,{v}): return a variable 'name' whose priority is\nhigher than the priority of v (of all existing variables if v is omitted)."
function varhigher(x1::AbstractString; x2::Integer = -1)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            let _cs1 = Base.cconvert(Cstring, x1)
                GC.@preserve _cs1 LibPARI._trap_call(
                    Ptr{Int},
                    cglobal((:varhigher, LibPARI.PARI_jll.libpari)),
                    2,
                    reinterpret(Int, Base.unsafe_convert(Cstring, _cs1)),
                    Int(x2),
                    Int(0),
                    Int(0),
                    Int(0),
                    Int(0),
                    Int(0),
                    Int(0),
                )
            end
        end
    end
end

"variable({x}): main variable of object x. Gives p for p-adic x, 0\nif no variable can be attached to x. Returns the list of user variables if\nx is omitted."
function gpolvar(; x1 = nothing)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:gpolvar, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}((x1 === nothing ? C_NULL : x1.ptr))),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"variables({x}): all variables occurring in object x, sorted by\ndecreasing priority. Returns the list of user variables if x is omitted."
function variables_vec(; x1 = nothing)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:variables_vec, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}((x1 === nothing ? C_NULL : x1.ptr))),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"varlower(name,{v}): return a variable 'name' whose priority is lower\nthan the priority of v (of all existing variables if v is omitted."
function varlower(x1::AbstractString; x2::Integer = -1)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            let _cs1 = Base.cconvert(Cstring, x1)
                GC.@preserve _cs1 LibPARI._trap_call(
                    Ptr{Int},
                    cglobal((:varlower, LibPARI.PARI_jll.libpari)),
                    2,
                    reinterpret(Int, Base.unsafe_convert(Cstring, _cs1)),
                    Int(x2),
                    Int(0),
                    Int(0),
                    Int(0),
                    Int(0),
                    Int(0),
                    Int(0),
                )
            end
        end
    end
end

"vecextract(x,y,{z}): extraction of the components of the matrix or\nvector x according to y and z. If z is omitted, y represents columns, otherwise\ny corresponds to rows and z to columns. y and z can be vectors (of indices),\nstrings (indicating ranges as in \"1..10\") or masks (integers whose binary\nrepresentation indicates the indices to extract, from left to right 1, 2, 4,\n8, etc.)."
function extract0(x1::LibPARI.Gen, x2::LibPARI.Gen; x3 = nothing)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:extract0, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                reinterpret(Int, Ptr{Int}((x3 === nothing ? C_NULL : x3.ptr))),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"vecmax(x,{&v}): largest entry in the vector/matrix x. If v\nis present, set it to the index of a largest entry (indirect max)."
function vecmax0(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        out1 = Ref{Ptr{Int}}(C_NULL)
        av = LibPARI._avma()
        r = LibPARI._trap_call(
            Ptr{Int},
            cglobal((:vecmax0, LibPARI.PARI_jll.libpari)),
            2,
            reinterpret(Int, Ptr{Int}(x1.ptr)),
            reinterpret(Int, Base.unsafe_convert(Ptr{Ptr{Int}}, out1)),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
        )
        primary = LibPARI.Gen(r)
        o1 = LibPARI.Gen(out1[])
        LibPARI._set_avma(av)
        return (primary, o1)
    end
end

"vecmin(x,{&v}): smallest entry in the vector/matrix x. If v is\npresent, set it to the index of a smallest\nentry (indirect min)."
function vecmin0(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        out1 = Ref{Ptr{Int}}(C_NULL)
        av = LibPARI._avma()
        r = LibPARI._trap_call(
            Ptr{Int},
            cglobal((:vecmin0, LibPARI.PARI_jll.libpari)),
            2,
            reinterpret(Int, Ptr{Int}(x1.ptr)),
            reinterpret(Int, Base.unsafe_convert(Ptr{Ptr{Int}}, out1)),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
        )
        primary = LibPARI.Gen(r)
        o1 = LibPARI.Gen(out1[])
        LibPARI._set_avma(av)
        return (primary, o1)
    end
end

"vecprod(v): return the product of the components of the vector v."
function vecprod(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:vecprod, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"vecsearch(v,x,{cmpf}): determines whether x belongs to the sorted\nvector v. If the comparison function cmpf is explicitly given, assume\nthat v was sorted according to vecsort(, cmpf)."
function vecsearch(x1::LibPARI.Gen, x2::LibPARI.Gen; x3 = nothing)
    return LibPARI.protected_call() do
        Int(
            LibPARI._trap_call(
                Int,
                cglobal((:vecsearch, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                reinterpret(Int, Ptr{Int}((x3 === nothing ? C_NULL : x3.ptr))),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            ),
        )
    end
end

"vecsum(v): return the sum of the components of the vector v."
function vecsum(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:vecsum, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"version(): returns the PARI version as [major,minor,patch] or [major,minor,patch,GITversion]."
function pari_version()
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:pari_version, LibPARI.PARI_jll.libpari)),
                0,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"weber(x,{flag=0}): one of Weber's f function of x. flag is optional,\nand can be 0: default, function f(x)=exp(-i*Pi/24)*eta((x+1)/2)/eta(x),\n1: function f1(x)=eta(x/2)/eta(x)\n2: function f2(x)=sqrt(2)*eta(2*x)/eta(x)."
function weber0(x1::LibPARI.Gen; x2::Integer = 0, prec::Integer = 4)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:weber0, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(x2),
                prec,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"whatnow(key): if key was present in GP version 1.39.15, gives\nthe new function name."
function whatnow0(x1::AbstractString)
    LibPARI.protected_call() do
        let _cs1 = Base.cconvert(Cstring, x1)
            GC.@preserve _cs1 LibPARI._trap_call(
                Cvoid,
                cglobal((:whatnow0, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Base.unsafe_convert(Cstring, _cs1)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
    return nothing
end

"writebin(filename,{x}): write x as a binary object to file filename.\nIf x is omitted, write all session variables."
function gpwritebin(x1::AbstractString; x2 = nothing)
    LibPARI.protected_call() do
        let _cs1 = Base.cconvert(Cstring, x1)
            GC.@preserve _cs1 LibPARI._trap_call(
                Cvoid,
                cglobal((:gpwritebin, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Base.unsafe_convert(Cstring, _cs1)),
                reinterpret(Int, Ptr{Int}((x2 === nothing ? C_NULL : x2.ptr))),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
    return nothing
end

"zeta(s): Riemann zeta function at s with s a complex or a p-adic number."
function gzeta(x1::LibPARI.Gen; prec::Integer = 4)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:gzeta, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                prec,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"zetahurwitz(s,x,{der=0}): Hurwitz zeta function at s, x, with s not 1 and\nx not a negative or zero integer. s can be a scalar, polynomial, rational\nfunction, or power series. If der>0, compute the der'th derivative with\nrespect to s."
function zetahurwitz(
    x1::LibPARI.Gen,
    x2::LibPARI.Gen;
    x3::Integer = 0,
    bitprec::Integer = 128,
)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:zetahurwitz, LibPARI.PARI_jll.libpari)),
                4,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(x3),
                bitprec,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"zetamult(s,{t=0}): multiple zeta value at integral s = [s1,...,sk];\nmore generally, return Yamamoto's t-MZV interpolation (star value for t = 1)."
function zetamult_interpolate(x1::LibPARI.Gen; x2 = nothing, prec::Integer = 4)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:zetamult_interpolate, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}((x2 === nothing ? C_NULL : x2.ptr))),
                prec,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"zetamultall(k,{flag=0}): list of all multiple zeta values for weight\nup to k. Binary digits of flag mean: 0 = zetastar values if set,\n1 = values up to duality if set, 2 = values of weight k if set\n(else all values up to weight k), 3 = return the 2-component vector\n[Z, M], where M is the vector of the corresponding indices m, i.e., such that\nzetamult(M[i]) = Z[i]."
function zetamultall(x1::Integer; x2::Integer = 0, prec::Integer = 4)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:zetamultall, LibPARI.PARI_jll.libpari)),
                3,
                Int(x1),
                Int(x2),
                prec,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"zetamultconvert(a,{flag=1}): a being either an evec, avec, or index m,\nconverts into evec (flag=0), avec (flag=1), or index m (flag=2)."
function zetamultconvert(x1::LibPARI.Gen; x2::Integer = 1)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:zetamultconvert, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(x2),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"zetamultdual(s): s being either an evec, avec, or index m,\nreturn the dual sequence in avec format."
function zetamultdual(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:zetamultdual, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"znchar(D): given a datum D describing a group G = (Z/NZ)^* and\na Dirichlet character chi, return the pair [G,chi]."
function znchar(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:znchar, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"zncharconductor(G,chi): let G be znstar(q,1) and chi\nbe a Dirichlet character on (Z/qZ)*. Return\nthe conductor of chi."
function zncharconductor(x1::LibPARI.Gen, x2::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:zncharconductor, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"znchardecompose(G,chi,Q): given a znstar G = (Z/NZ)^* and\na Dirichlet character chi, return the product of local characters chi_p\nfor p | (N,Q)."
function znchardecompose(x1::LibPARI.Gen, x2::LibPARI.Gen, x3::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:znchardecompose, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                reinterpret(Int, Ptr{Int}(x3.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"znchargauss(G,chi,{a=1}): given a Dirichlet character chi on\nG = (Z/NZ)^*, return the complex Gauss sum g(chi,a)."
function znchargauss(
    x1::LibPARI.Gen,
    x2::LibPARI.Gen;
    x3 = nothing,
    bitprec::Integer = 128,
)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:znchargauss, LibPARI.PARI_jll.libpari)),
                4,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                reinterpret(Int, Ptr{Int}((x3 === nothing ? C_NULL : x3.ptr))),
                bitprec,
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"zncharinduce(G,chi,N): let G be znstar(q,1), let chi\nbe a Dirichlet character mod q and let N be a multiple of q. Return\nthe character modulo N extending chi."
function zncharinduce(x1::LibPARI.Gen, x2::LibPARI.Gen, x3::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:zncharinduce, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                reinterpret(Int, Ptr{Int}(x3.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"zncharisodd(G,chi): let G be znstar(N,1), let chi\nbe a Dirichlet character mod N, return 1 if and only if chi(-1) = -1\nand 0 otherwise."
function zncharisodd(x1::LibPARI.Gen, x2::LibPARI.Gen)
    return LibPARI.protected_call() do
        Int(
            LibPARI._trap_call(
                Int,
                cglobal((:zncharisodd, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            ),
        )
    end
end

"znchartokronecker(G,chi,{flag=0}): let G be znstar(N,1), let chi\nbe a Dirichlet character mod N, return the discriminant D if chi is\nreal equal to the Kronecker symbol (D/.) and 0 otherwise. If flag\nis set, return the fundamental discriminant attached to the corresponding\nprimitive character."
function znchartokronecker(x1::LibPARI.Gen, x2::LibPARI.Gen; x3::Integer = 0)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:znchartokronecker, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(x3),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"znchartoprimitive(G,chi): let G be znstar(q,1) and chi\nbe a Dirichlet character on (Z/qZ)* of conductor q0. Return [G0,chi0],\nwhere chi0 is the primitive character attached to chi and G0 is znstar(q0,1)."
function znchartoprimitive(x1::LibPARI.Gen, x2::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:znchartoprimitive, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"znconreychar(G,m): Dirichlet character attached to m in (Z/qZ)*\nin Conrey's notation, where G is znstar(q,1)."
function znconreychar(x1::LibPARI.Gen, x2::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:znconreychar, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"znconreyconductor(G,chi,{&chi0}): let G be znstar(q,1) and chi\nbe a Dirichlet character on (Z/qZ)* given by its Conrey logarithm. Return\nthe conductor of chi, and set chi0 to (the Conrey logarithm of) the\nattached primitive character. If chi0 != chi, return the conductor\nand its factorization."
function znconreyconductor(x1::LibPARI.Gen, x2::LibPARI.Gen)
    return LibPARI.protected_call() do
        out1 = Ref{Ptr{Int}}(C_NULL)
        av = LibPARI._avma()
        r = LibPARI._trap_call(
            Ptr{Int},
            cglobal((:znconreyconductor, LibPARI.PARI_jll.libpari)),
            3,
            reinterpret(Int, Ptr{Int}(x1.ptr)),
            reinterpret(Int, Ptr{Int}(x2.ptr)),
            reinterpret(Int, Base.unsafe_convert(Ptr{Ptr{Int}}, out1)),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
            Int(0),
        )
        primary = LibPARI.Gen(r)
        o1 = LibPARI.Gen(out1[])
        LibPARI._set_avma(av)
        return (primary, o1)
    end
end

"znconreyexp(G,chi): Conrey exponential attached to G =\nznstar(q, 1). Returns the element m in (Z/qZ)^* attached to the character\nchi on G: znconreylog(G, m) = chi."
function znconreyexp(x1::LibPARI.Gen, x2::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:znconreyexp, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"znconreylog(G,m): Conrey logarithm attached to m in (Z/qZ)*,\nwhere G is znstar(q,1)."
function znconreylog(x1::LibPARI.Gen, x2::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:znconreylog, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"zncoppersmith(P,N,X,{B=N}): finds all integers x\nwith |x| <= X such that  gcd(N, P(x)) >= B. The parameter X should be smaller\nthan exp((log B)^2 / (deg(P) log N)) and the leading coefficient of P should be\ncoprime to N."
function zncoppersmith(
    x1::LibPARI.Gen,
    x2::LibPARI.Gen,
    x3::LibPARI.Gen;
    x4 = nothing,
)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:zncoppersmith, LibPARI.PARI_jll.libpari)),
                4,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                reinterpret(Int, Ptr{Int}(x3.ptr)),
                reinterpret(Int, Ptr{Int}((x4 === nothing ? C_NULL : x4.ptr))),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"znlog(x,g,{o}): return the discrete logarithm of x in\n(Z/nZ)* in base g. If present, o represents the multiplicative\norder of g. Return [] if no solution exist."
function znlog0(x1::LibPARI.Gen, x2::LibPARI.Gen; x3 = nothing)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:znlog0, LibPARI.PARI_jll.libpari)),
                3,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}(x2.ptr)),
                reinterpret(Int, Ptr{Int}((x3 === nothing ? C_NULL : x3.ptr))),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"znorder(x,{o}): order of the integermod x in (Z/nZ)*.\nOptional o represents a multiple of the order of the element."
function znorder(x1::LibPARI.Gen; x2 = nothing)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:znorder, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                reinterpret(Int, Ptr{Int}((x2 === nothing ? C_NULL : x2.ptr))),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"znprimroot(n): returns a primitive root of n when it exists."
function znprimroot(x1::LibPARI.Gen)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:znprimroot, LibPARI.PARI_jll.libpari)),
                1,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"znstar(n,{flag=0}): 3-component vector v = [no,cyc,gen], giving the\nstructure of the abelian group (Z/nZ)^*;\nno is the order (i.e. eulerphi(n)), cyc is a vector of cyclic components,\nand gen is a vector giving the corresponding generators."
function znstar0(x1::LibPARI.Gen; x2::Integer = 0)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:znstar0, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(x2),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

"znsubgroupgenerators(H,{flag=0}): finds generators of the subgroup H\nof (Z/fZ)^*; H is given by a vector of length f of 1/0 values: the a-th component is 1\nif and only if a belongs to H."
function znsubgroupgenerators(x1::LibPARI.Gen; x2::Integer = 0)
    return LibPARI.protected_call() do
        LibPARI.gen_from() do
            LibPARI._trap_call(
                Ptr{Int},
                cglobal((:znsubgroupgenerators, LibPARI.PARI_jll.libpari)),
                2,
                reinterpret(Int, Ptr{Int}(x1.ptr)),
                Int(x2),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end

end  # module PARI
