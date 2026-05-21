# ---------------------------------------------------------------------------
# LibPARIMCPExt — the optional MCP connector for LibPARI.
#
# This package extension is loaded only when `ModelContextProtocol` is loaded
# alongside `LibPARI`. It supplies the `LibPARI.serve_mcp` method: an MCP
# server that exposes PARI/GP to MCP clients (AI assistants) through three
# tools — `pari_eval`, `pari_functions`, and `pari_help`.
#
# Every PARI call routes through LibPARI's existing error-safe, thread-safe
# path (`gp_eval` -> `protected_call` -> the M9 worker); a `PariError` becomes
# a structured MCP error result, never a server crash.
# ---------------------------------------------------------------------------

module LibPARIMCPExt

using LibPARI
using ModelContextProtocol

# --- helpers ---------------------------------------------------------------

# A structured MCP error result — MCP text content flagged `is_error`.
_tool_error(msg::AbstractString) = CallToolResult(
    content = [Dict{String,Any}("type" => "text", "text" => String(msg))],
    is_error = true,
)

# Render an exception as a human-readable message. For a `PariError` this is
# PARI's own message and error category (`Base.showerror` from M3).
_describe(e) = sprint(showerror, e)

# The callable PARI bindings in `LibPARI.PARI` — the same filter the test
# suite and the documentation use.
function _pari_function_names()
    return filter(names(LibPARI.PARI; all = true)) do s
        n = string(s)
        !startswith(n, "#") &&
            s ∉ (:eval, :include) &&
            isdefined(LibPARI.PARI, s) &&
            getfield(LibPARI.PARI, s) isa Function
    end
end

# The help text PARI's `pari.desc` attached to a generated binding as its
# docstring (M4), read from the module's documentation metadata. Returns
# `nothing` when the binding carries no docstring.
function _binding_docstring(mod::Module, sym::Symbol)
    b = Base.Docs.Binding(mod, sym)
    m = Base.Docs.meta(mod)
    haskey(m, b) || return nothing
    md = m[b]
    isempty(md.order) && return nothing
    text = strip(join(md.docs[first(md.order)].text))
    return isempty(text) ? nothing : String(text)
end

# --- tool handlers (params dict -> String on success, CallToolResult on
#     error; never throw past the MCP server loop) -------------------------

function _eval_handler(args)
    expr = args isa AbstractDict ? get(args, "expression", nothing) : nothing
    expr isa AbstractString || return _tool_error(
        "`pari_eval` requires a string parameter `expression`.",
    )
    try
        return string(LibPARI.gp_eval(String(expr)))
    catch e
        return _tool_error(_describe(e))
    end
end

function _functions_handler(args)
    raw = args isa AbstractDict ? get(args, "query", "") : ""
    query = raw isa AbstractString ? lowercase(String(raw)) : ""
    try
        names_ = sort!(string.(_pari_function_names()))
        isempty(query) || filter!(n -> occursin(query, lowercase(n)), names_)
        return string(
            length(names_),
            " PARI function(s):\n",
            join(names_, "\n"),
        )
    catch e
        return _tool_error(_describe(e))
    end
end

function _help_handler(args)
    name = args isa AbstractDict ? get(args, "name", nothing) : nothing
    name isa AbstractString ||
        return _tool_error("`pari_help` requires a string parameter `name`.")
    try
        sym = Symbol(name)
        if !(
            isdefined(LibPARI.PARI, sym) &&
            getfield(LibPARI.PARI, sym) isa Function
        )
            return _tool_error("PARI has no function named `$(name)`.")
        end
        help = _binding_docstring(LibPARI.PARI, sym)
        return help === nothing ? "PARI function `$(name)` has no help text." :
               help
    catch e
        return _tool_error(_describe(e))
    end
end

# --- tool definitions ------------------------------------------------------

function _mcp_tools()
    return MCPTool[
        MCPTool(
            name = "pari_eval",
            description = "Evaluate a PARI/GP expression and return the " *
                          "exact result. A GP expression can call any PARI " *
                          "function — e.g. `factor(2^67-1)`, `isprime(N)`, " *
                          "`ellinit([0,1])`.",
            parameters = [
                ToolParameter(
                    name = "expression",
                    description = "The GP-language expression to evaluate.",
                    type = "string",
                    required = true,
                ),
            ],
            handler = _eval_handler,
            return_type = TextContent,
        ),
        MCPTool(
            name = "pari_functions",
            description = "List or search the PARI functions available " *
                          "through the connector. The optional `query` " *
                          "filters names by a case-insensitive substring.",
            parameters = [
                ToolParameter(
                    name = "query",
                    description = "Optional case-insensitive substring filter.",
                    type = "string",
                    required = false,
                ),
            ],
            handler = _functions_handler,
            return_type = TextContent,
        ),
        MCPTool(
            name = "pari_help",
            description = "Return PARI's help text for a named PARI function.",
            parameters = [
                ToolParameter(
                    name = "name",
                    description = "The PARI function name (e.g. `nextprime`).",
                    type = "string",
                    required = true,
                ),
            ],
            handler = _help_handler,
            return_type = TextContent,
        ),
    ]
end

# --- the entry point -------------------------------------------------------

function LibPARI.serve_mcp(;
    start::Bool = true,
    name::AbstractString = "libpari",
    version::AbstractString = "0.12.0",
)
    server = mcp_server(
        name = String(name),
        version = String(version),
        description = "PARI/GP number theory through LibPARI.jl — evaluate " *
                      "GP expressions and discover PARI's functions.",
        tools = _mcp_tools(),
    )
    start && start!(server)
    return server
end

end # module LibPARIMCPExt
