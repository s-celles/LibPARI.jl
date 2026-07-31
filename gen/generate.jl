#!/usr/bin/env julia
# ===========================================================================
# LibPARI binding generator (milestone M4).
#
# Reads PARI's machine-readable function database `pari.desc` (shipped in
# PARI_jll) and writes `src/bindings.jl` — the auto-generated `LibPARI.PARI`
# submodule with one `ccall` binding per eligible function.
#
# Development-time tool. Not shipped, not loaded at package use. Run:
#     julia --project=gen gen/generate.jl
# ===========================================================================

using PARI_jll
using JuliaFormatter

const REPO = dirname(@__DIR__)
const OUTFILE = joinpath(REPO, "src", "bindings.jl")

# Defaults a binding supplies when the caller gives no precision.
#
# UNITS (verified against PARI 2.17's headers): prototype codes `p` and `b`
# are BIT counts — `pariinl.h` defines `prec2nbits(long x) { return x; }` —
# and PARI rounds a `p` request up to a whole number of machine words. The
# previous `DEFAULT_PREC = 4`, commented "word precision", therefore asked
# for 4 bits and got PARI's 64-bit minimum; it was not a deliberate choice.
#
# Both now read LibPARI's working precision, in bits, at the CALL SITE: a
# keyword default is evaluated in the caller's frame, which is what carries a
# `setprecision(Gen, bits)` scope across the hop onto the PARI worker task
# (REQ-PREC-04, REQ-PREC-06).
const DEFAULT_PREC = "LibPARI.nbits2prec(LibPARI.precision(LibPARI.Gen))"
const DEFAULT_BITPREC = "LibPARI.precision(LibPARI.Gen)"
# A series precision is a NUMBER OF TERMS, not bits, so it has its own
# default and is deliberately left out of the precision scope.
const DEFAULT_SERIESPREC = 16

# Julia reserved words a C-Name must not collide with.
const RESERVED = Set([
    "function",
    "end",
    "if",
    "else",
    "elseif",
    "while",
    "for",
    "do",
    "let",
    "module",
    "baremodule",
    "struct",
    "mutable",
    "begin",
    "return",
    "try",
    "catch",
    "finally",
    "quote",
    "macro",
    "const",
    "global",
    "local",
    "import",
    "using",
    "export",
    "true",
    "false",
    "in",
    "isa",
    "where",
])

# --- RFC-822 parsing -------------------------------------------------------

"Parse `pari.desc` into a vector of records (`Dict` of field => value)."
function parse_desc(path)
    records = Dict{String,String}[]
    cur = Dict{String,String}()
    last = ""
    for line in eachline(path)
        if isempty(line)
            isempty(cur) || (push!(records, cur); cur = Dict{String,String}())
            last = ""
        elseif startswith(line, ' ') || startswith(line, '\t')
            last == "" || (cur[last] = cur[last] * "\n" * strip(line))
        else
            m = match(r"^([A-Za-z0-9_-]+):[ ]?(.*)$", line)
            if m !== nothing
                last = m.captures[1]
                cur[last] = String(m.captures[2])
            end
        end
    end
    isempty(cur) || push!(records, cur)
    return records
end

# --- Prototype classification ---------------------------------------------

# An argument descriptor: how one prototype code becomes ccall + signature.
struct Arg
    ctype::String   # ccall argument type
    cexpr::String   # ccall argument expression (uses the param names below)
    param::String   # positional Julia parameter, or "" (none)
    kwarg::String   # keyword Julia parameter, or "" (none)
    output::Bool    # is this an output (`&`) argument?
    conv::String    # statement converting the argument, or "" (none)
end

# Most argument kinds need no conversion statement.
Arg(ctype, cexpr, param, kwarg, output) =
    Arg(ctype, cexpr, param, kwarg, output, "")

# Classify a `Prototype` string. Returns one of:
#   (:exclude,)        — a GP-closure-argument function
#   (:skip, reason)    — an unrecognized prototype code
#   (:ok, ret, args)   — ret::Symbol, args::Vector{Arg}
function classify(proto::AbstractString)
    ret = :gen
    i = 1
    n = lastindex(proto)
    if n >= 1 && proto[1] in "limuv"
        ret =
            proto[1] == 'l' ? :long :
            proto[1] == 'i' ? :int :
            proto[1] == 'u' ? :ulong : proto[1] == 'v' ? :void : :gen
        i = 2
    end
    args = Arg[]
    np = 0          # positional value-argument counter
    no = 0          # output-argument counter
    while i <= n
        c = proto[i]
        if c == 'G'
            np += 1
            # A `G` slot takes a `Gen` or any `PariConvertible` scalar. The
            # conversion happens ONCE, into a local, inside the producer
            # closure — so it runs on the PARI worker, and the result is a
            # persistent clone whose pointer survives any `avma` movement.
            # `gen_convert(::Gen)` returns its argument, so an existing
            # `Gen` is never copied (REQ-ARG-02, REQ-ARG-03).
            push!(
                args,
                Arg(
                    "Ptr{Int}",
                    "_g$(np).ptr",
                    "x$(np)::LibPARI.GenArg",
                    "",
                    false,
                    "_g$(np) = LibPARI.gen_convert(x$(np))",
                ),
            )
            i += 1
        elseif c == 'L' || c == 'n'
            np += 1
            push!(
                args,
                Arg("Int", "Int(x$(np))", "x$(np)::Integer", "", false),
            )
            i += 1
        elseif c == 'U'
            np += 1
            push!(
                args,
                Arg("UInt", "UInt(x$(np))", "x$(np)::Integer", "", false),
            )
            i += 1
        elseif c == 's' || c == 'r'
            np += 1
            push!(
                args,
                Arg("Cstring", "x$(np)", "x$(np)::AbstractString", "", false),
            )
            i += 1
        elseif c == 'p'
            push!(
                args,
                Arg(
                    "Int",
                    "prec",
                    "",
                    "prec::Integer = $DEFAULT_PREC",
                    false,
                ),
            )
            i += 1
        elseif c == 'b'
            push!(
                args,
                Arg(
                    "Int",
                    "bitprec",
                    "",
                    "bitprec::Integer = $DEFAULT_BITPREC",
                    false,
                ),
            )
            i += 1
        elseif c == 'P'
            push!(
                args,
                Arg(
                    "Int",
                    "seriesprec",
                    "",
                    "seriesprec::Integer = $DEFAULT_SERIESPREC",
                    false,
                ),
            )
            i += 1
        elseif c == '&'
            no += 1
            push!(args, Arg("Ref{Ptr{Int}}", "out$(no)", "", "", true))
            i += 1
        elseif c in "EIVC"
            return (:exclude,)
        elseif c == 'D'
            # Optional argument: `D<single-code>` or `D<default>,<code>,`.
            rest = proto[(i+1):n]
            m = match(r"^([^,]*),([A-Za-z]),", rest)
            if m !== nothing
                val, code = m.captures[1], m.captures[2][1]
                if code == 'L' || code == 'n'
                    tryparse(Int, val) === nothing && return (:skip, "D$val,L,")
                    np += 1
                    push!(
                        args,
                        Arg(
                            "Int",
                            "Int(x$(np))",
                            "",
                            "x$(np)::Integer = $val",
                            false,
                        ),
                    )
                elseif code == 'U'
                    tryparse(Int, val) === nothing && return (:skip, "D$val,U,")
                    np += 1
                    push!(
                        args,
                        Arg(
                            "UInt",
                            "UInt(x$(np))",
                            "",
                            "x$(np)::Integer = $val",
                            false,
                        ),
                    )
                elseif code == 's' || code == 'r'
                    startswith(val, '"') || return (:skip, "D$val,s,")
                    np += 1
                    push!(
                        args,
                        Arg(
                            "Cstring",
                            "x$(np)",
                            "",
                            "x$(np)::AbstractString = $val",
                            false,
                        ),
                    )
                elseif code in "EIVC"
                    return (:exclude,)
                else
                    return (:skip, "D...,$code,")
                end
                i += 1 + m.match.ncodeunits
            elseif i + 1 <= n
                code = proto[i+1]
                if code == 'G'
                    np += 1
                    # Typed, where it used to be a bare `x = nothing`: an
                    # unsupported argument now fails at dispatch instead of
                    # late, inside the ccall, as `no field ptr`
                    # (REQ-ARG-04).
                    push!(
                        args,
                        Arg(
                            "Ptr{Int}",
                            "(_g$(np) === nothing ? C_NULL : _g$(np).ptr)",
                            "",
                            "x$(np)::Union{Nothing,LibPARI.GenArg} " *
                            "= nothing",
                            false,
                            "_g$(np) = x$(np) === nothing ? nothing : " *
                            "LibPARI.gen_convert(x$(np))",
                        ),
                    )
                elseif code == 'n'
                    np += 1
                    push!(
                        args,
                        Arg(
                            "Int",
                            "Int(x$(np))",
                            "",
                            "x$(np)::Integer = -1",
                            false,
                        ),
                    )
                elseif code == '&'
                    no += 1
                    push!(
                        args,
                        Arg("Ref{Ptr{Int}}", "out$(no)", "", "", true),
                    )
                elseif code == 'p'
                    push!(
                        args,
                        Arg(
                            "Int",
                            "prec",
                            "",
                            "prec::Integer = $DEFAULT_PREC",
                            false,
                        ),
                    )
                elseif code == 'P'
                    push!(
                        args,
                        Arg(
                            "Int",
                            "seriesprec",
                            "",
                            "seriesprec::Integer = $DEFAULT_SERIESPREC",
                            false,
                        ),
                    )
                elseif code in "EIVC"
                    return (:exclude,)
                else
                    return (:skip, "D$code")
                end
                i += 2
            else
                return (:skip, "trailing D")
            end
        else
            return (:skip, "code '$c'")
        end
    end
    return (:ok, ret, args)
end

# --- Emitting a binding ----------------------------------------------------

# Escape help text into a single safe Julia string literal.
escdoc(s) = replace(
    strip(s),
    '\\' => "\\\\",
    '"' => "\\\"",
    '$' => "\\\$",
    '\n' => "\\n",
)

ctypes_tuple(args) =
    isempty(args) ? "()" :
    "(" * join((a.ctype for a in args), ", ") * (length(args) == 1 ? ",)" : ")")

# The trap shim's argument-count ceiling (mirrors `_TRAP_MAXARGS` in
# src/trap.jl). A binding with more arguments falls back to a raw `ccall`.
const TRAP_MAXARGS = 8

# Marshal one argument to a pointer-sized `Int` expression for the trap
# shim. Returns `nothing` for a `Cstring` (handled with a preserve block).
function clong_arg(a::Arg)
    t = a.ctype
    if t == "Ptr{Int}"
        return "reinterpret(Int, Ptr{Int}($(a.cexpr)))"
    elseif t == "Int"
        return a.cexpr
    elseif t == "UInt"
        return "reinterpret(Int, $(a.cexpr))"
    elseif t == "Ref{Ptr{Int}}"
        return "reinterpret(Int, " *
               "Base.unsafe_convert(Ptr{Ptr{Int}}, $(a.cexpr)))"
    else
        return nothing   # Cstring — see `trap_call_expr`
    end
end

# Build the concurrency-safe `_trap_call(...)` expression for a binding, or
# `nothing` if it has more arguments than the trap shim supports (feature
# 014). Every PARI argument is passed as a pointer-sized integer; `Cstring`
# arguments are kept alive across the call with `GC.@preserve`.
function trap_call_expr(cname, cret, args)
    length(args) > TRAP_MAXARGS && return nothing
    clongs = String[]
    cstr_lets = String[]
    cstr_keep = String[]
    csi = 0
    for a in args
        ce = clong_arg(a)
        if ce === nothing               # Cstring
            csi += 1
            lv = "_cs$(csi)"
            push!(cstr_lets, "$lv = Base.cconvert(Cstring, $(a.cexpr))")
            push!(cstr_keep, lv)
            push!(
                clongs,
                "reinterpret(Int, Base.unsafe_convert(Cstring, $lv))",
            )
        else
            push!(clongs, ce)
        end
    end
    while length(clongs) < TRAP_MAXARGS
        push!(clongs, "Int(0)")
    end
    fnptr = "cglobal((:$(cname), LibPARI.PARI_jll.libpari))"
    inner =
        "LibPARI._trap_call($cret, $fnptr, $(length(args)), " *
        join(clongs, ", ") * ")"
    isempty(cstr_lets) && return inner
    return "let " * join(cstr_lets, ", ") * "; GC.@preserve " *
           join(cstr_keep, " ") * " " * inner * "; end"
end

"Emit the Julia source for one binding. Returns a String."
function emit_binding(cname, fname, ret, args, help)
    params = String[a.param for a in args if a.param != ""]
    kwargs = String[a.kwarg for a in args if a.kwarg != ""]
    outs = [a for a in args if a.output]
    sig = "function $(cname)(" * join(params, ", ")
    sig *= isempty(kwargs) ? ")" : "; " * join(kwargs, ", ") * ")"

    crange = ctypes_tuple(args)
    cargs = join((a.cexpr for a in args), ", ")
    cret =
        ret == :gen ? "Ptr{Int}" :
        ret == :long ? "Int" :
        ret == :int ? "Cint" : ret == :ulong ? "UInt" : "Cvoid"
    # The `libpari` call routes through the concurrency-safe error trap
    # (feature 014). A binding with more arguments than the trap shim
    # supports falls back to a raw `ccall` (milestone-M3 error handling).
    call = trap_call_expr(cname, cret, args)
    if call === nothing
        call =
            "ccall((:$(cname), LibPARI.PARI_jll.libpari), $cret, " *
            "$crange, $cargs)"
    end

    # Arguments needing conversion (the `G` slots): each is converted ONCE,
    # into a local, before the call — and every local is rooted across the
    # call with `GC.@preserve`, since from there on it is reachable only as
    # a raw integer inside the ccall (REQ-ARG-03, REQ-ARG-06).
    convs = String[a.conv for a in args if a.conv != ""]
    locals = String[
        match(r"^(_g\d+)", a.conv).captures[1] for a in args if a.conv != ""
    ]
    guard(indent, expr) =
        isempty(locals) ? expr :
        "GC.@preserve " * join(locals, " ") * " " * expr

    doc = "\"$(escdoc(isempty(help) ? "$fname (PARI)" : help))\"\n"
    body = IOBuffer()
    emitconv(pad) = for c in convs
        println(body, pad, c)
    end
    if isempty(outs)
        if ret == :gen
            println(body, "    return LibPARI.protected_call() do")
            println(body, "        LibPARI.gen_from() do")
            emitconv("            ")
            println(body, "            ", guard(12, call))
            println(body, "        end")
            println(body, "    end")
        elseif ret == :void
            # `avma` is captured and restored around the call: a converted
            # temporary, and anything the PARI function leaves behind, must
            # not accumulate on the transient stack call after call
            # (REQ-ARG-05). `protected_call` restores it only on error.
            println(body, "    LibPARI.protected_call() do")
            emitconv("        ")
            println(body, "        av = LibPARI._avma()")
            println(body, "        ", guard(8, call))
            println(body, "        LibPARI._set_avma(av)")
            println(body, "        return nothing")
            println(body, "    end")
            println(body, "    return nothing")
        else
            println(body, "    return LibPARI.protected_call() do")
            emitconv("        ")
            println(body, "        av = LibPARI._avma()")
            println(body, "        r = Int(", guard(8, call), ")")
            println(body, "        LibPARI._set_avma(av)")
            println(body, "        return r")
            println(body, "    end")
        end
    else
        println(body, "    return LibPARI.protected_call() do")
        emitconv("        ")
        for k = 1:length(outs)
            println(body, "        out$(k) = Ref{Ptr{Int}}(C_NULL)")
        end
        println(body, "        av = LibPARI._avma()")
        println(body, "        r = ", guard(8, call))
        prim =
            ret == :gen ? "LibPARI.Gen(r)" : ret == :void ? "nothing" : "Int(r)"
        println(body, "        primary = $prim")
        for k = 1:length(outs)
            println(body, "        o$(k) = LibPARI.Gen(out$(k)[])")
        end
        println(body, "        LibPARI._set_avma(av)")
        rtuple =
            "(primary, " * join(("o$(k)" for k = 1:length(outs)), ", ") * ")"
        println(body, "        return $rtuple")
        println(body, "    end")
    end
    return doc * sig * "\n" * String(take!(body)) * "end\n"
end

# --- Orchestration ---------------------------------------------------------

function generate()
    descpath = PARI_jll.pari_desc
    records = parse_desc(descpath)
    emitted = Set{String}()
    bindings = String[]
    n_omit = n_exclude = n_skip = n_dup = n_default = 0
    skips = String[]

    for rec in records
        haskey(rec, "C-Name") || (n_omit += 1; continue)
        # `Class: default` records are GP's `default()` setters, not
        # computational functions. Their `Prototype:` field is EMPTY, so a
        # binding generated from it takes no arguments — while the C
        # function behind it is declared `(const char *v, long flag)`
        # (paridecl.h). Calling such a binding makes the C function read two
        # argument registers the caller never set: undefined behaviour, not
        # a catchable error. They are excluded, and reachable properly
        # through `gp_eval("default(...)")` or
        # `LibPARI.set_global_precision!` (REQ-PREC-13).
        if strip(get(rec, "Class", "")) == "default"
            n_default += 1
            continue
        end
        cname = strip(rec["C-Name"])
        fname = get(rec, "Function", cname)
        proto = strip(get(rec, "Prototype", ""))
        help = get(rec, "Help", "")

        if cname in emitted
            n_dup += 1
            continue
        end
        if !Base.isidentifier(cname) || cname in RESERVED
            n_skip += 1
            push!(skips, "$fname (C-Name '$cname' not a usable identifier)")
            continue
        end

        cls = classify(proto)
        if cls[1] == :exclude
            n_exclude += 1
            continue
        elseif cls[1] == :skip
            n_skip += 1
            push!(skips, "$fname [$cname] — prototype '$proto': $(cls[2])")
            continue
        end
        _, ret, args = cls
        push!(bindings, emit_binding(cname, fname, ret, args, help))
        push!(emitted, cname)
    end

    open(OUTFILE, "w") do io
        println(io, "# " * "="^74)
        println(io, "# AUTO-GENERATED — DO NOT EDIT BY HAND.")
        println(
            io,
            "# Generated from PARI's pari.desc by gen/generate.jl",
            " (milestone M4).",
        )
        println(io, "# Regenerate with:  julia --project=gen gen/generate.jl")
        println(io, "# " * "="^74)
        println(io)
        println(io, "module PARI")
        println(io)
        println(io, "import ..LibPARI")
        println(io)
        for b in bindings
            println(io, b)
        end
        println(io, "end  # module PARI")
    end
    format(OUTFILE)

    println("LibPARI binding generator")
    println("  records read ............ ", length(records))
    println("  bindings emitted ........ ", length(bindings))
    println("  omitted (no C-Name) ..... ", n_omit)
    println("  excluded (GP closures) .. ", n_exclude)
    println("  skipped (unrecognized) .. ", n_skip)
    println("  duplicate C-Name ........ ", n_dup)
    println("  GP defaults (unsafe) .... ", n_default)
    println("  -> ", OUTFILE)
    if !isempty(skips)
        println("\nSkipped functions:")
        for s in first(skips, 40)
            println("  - ", s)
        end
        length(skips) > 40 && println("  … and ", length(skips) - 40, " more")
    end
    return length(bindings)
end

generate()
