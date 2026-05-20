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

# Default precision values used when a binding auto-supplies precision.
const DEFAULT_PREC = 4        # word precision (prototype code `p`)
const DEFAULT_BITPREC = 128   # bit precision  (prototype code `b`)
const DEFAULT_SERIESPREC = 16 # series precision (prototype code `P`)

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
end

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
            push!(
                args,
                Arg(
                    "Ptr{Clong}",
                    "x$(np).ptr",
                    "x$(np)::LibPARI.Gen",
                    "",
                    false,
                ),
            )
            i += 1
        elseif c == 'L' || c == 'n'
            np += 1
            push!(
                args,
                Arg("Clong", "Clong(x$(np))", "x$(np)::Integer", "", false),
            )
            i += 1
        elseif c == 'U'
            np += 1
            push!(
                args,
                Arg("Culong", "Culong(x$(np))", "x$(np)::Integer", "", false),
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
                    "Clong",
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
                    "Clong",
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
                    "Clong",
                    "seriesprec",
                    "",
                    "seriesprec::Integer = $DEFAULT_SERIESPREC",
                    false,
                ),
            )
            i += 1
        elseif c == '&'
            no += 1
            push!(args, Arg("Ref{Ptr{Clong}}", "out$(no)", "", "", true))
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
                            "Clong",
                            "Clong(x$(np))",
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
                            "Culong",
                            "Culong(x$(np))",
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
                    push!(
                        args,
                        Arg(
                            "Ptr{Clong}",
                            "(x$(np) === nothing ? C_NULL : x$(np).ptr)",
                            "",
                            "x$(np) = nothing",
                            false,
                        ),
                    )
                elseif code == 'n'
                    np += 1
                    push!(
                        args,
                        Arg(
                            "Clong",
                            "Clong(x$(np))",
                            "",
                            "x$(np)::Integer = -1",
                            false,
                        ),
                    )
                elseif code == '&'
                    no += 1
                    push!(
                        args,
                        Arg("Ref{Ptr{Clong}}", "out$(no)", "", "", true),
                    )
                elseif code == 'p'
                    push!(
                        args,
                        Arg(
                            "Clong",
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
                            "Clong",
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
        ret == :gen ? "Ptr{Clong}" :
        ret == :long ? "Clong" :
        ret == :int ? "Cint" : ret == :ulong ? "Culong" : "Cvoid"
    call =
        "ccall((:$(cname), LibPARI.PARI_jll.libpari), $cret, " *
        "$crange, $cargs)"

    doc = "\"$(escdoc(isempty(help) ? "$fname (PARI)" : help))\"\n"
    body = IOBuffer()
    if isempty(outs)
        if ret == :gen
            println(body, "    return LibPARI.protected_call() do")
            println(body, "        LibPARI.gen_from() do")
            println(body, "            $call")
            println(body, "        end")
            println(body, "    end")
        elseif ret == :void
            println(body, "    LibPARI.protected_call() do")
            println(body, "        $call")
            println(body, "    end")
            println(body, "    return nothing")
        else
            println(body, "    return LibPARI.protected_call() do")
            println(body, "        Int($call)")
            println(body, "    end")
        end
    else
        println(body, "    return LibPARI.protected_call() do")
        for k = 1:length(outs)
            println(body, "        out$(k) = Ref{Ptr{Clong}}(C_NULL)")
        end
        println(body, "        av = LibPARI._avma()")
        println(body, "        r = $call")
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
    n_omit = n_exclude = n_skip = n_dup = 0
    skips = String[]

    for rec in records
        haskey(rec, "C-Name") || (n_omit += 1; continue)
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
