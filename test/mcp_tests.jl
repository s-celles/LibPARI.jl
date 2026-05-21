# ---------------------------------------------------------------------------
# Optional MCP connector extension — tests.
#
# The connector lives in `ext/LibPARIMCPExt.jl` and activates only when
# `ModelContextProtocol` is loaded alongside `LibPARI`. `ModelContextProtocol`
# is a test dependency, so the extension is live in this test process. Tool
# handlers are plain `params -> result` functions, invoked here directly; the
# server is built with `serve_mcp(start = false)` so no stdio loop runs.
#
# See specs/012-mcp-connector-extension/contracts/.
# ---------------------------------------------------------------------------

@testitem "the MCP extension activates and serve_mcp builds a server" begin
    using LibPARI
    using ModelContextProtocol

    ext = Base.get_extension(LibPARI, :LibPARIMCPExt)
    @test ext !== nothing                       # the extension is loaded

    server = LibPARI.serve_mcp(start = false)   # build, do not start
    @test server !== nothing

    tools = ext._mcp_tools()
    @test length(tools) == 3
    @test Set(t.name for t in tools) ==
          Set(["pari_eval", "pari_functions", "pari_help"])

    # Each tool declares `return_type = TextContent`: the handlers return a
    # `String`, which the MCP layer only auto-wraps into content when the
    # declared return type is `TextContent` (not the default `Vector`).
    @test all(t -> t.return_type === TextContent, tools)
end

@testitem "MCP pari_eval evaluates a GP expression to PARI's exact result" begin
    using LibPARI
    using ModelContextProtocol

    ext = Base.get_extension(LibPARI, :LibPARIMCPExt)

    # A large exact integer is returned without precision loss.
    r = ext._eval_handler(Dict{String,Any}("expression" => "2^200"))
    @test r isa AbstractString
    @test r == string(big(2)^200)

    # factor(2^67 - 1) = 193707721 * 761838257287 (Mersenne, famously
    # factored by Cole in 1903).
    r2 = ext._eval_handler(Dict{String,Any}("expression" => "factor(2^67-1)"))
    @test r2 isa AbstractString
    @test occursin("193707721", r2)
    @test occursin("761838257287", r2)

    # A missing parameter is a structured error, not a crash.
    bad = ext._eval_handler(Dict{String,Any}())
    @test bad isa ModelContextProtocol.CallToolResult
    @test bad.is_error
end

@testitem "ModelContextProtocol is a weak dependency, not a hard one" begin
    using LibPARI
    using TOML

    proj = TOML.parsefile(joinpath(pkgdir(LibPARI), "Project.toml"))

    # The MCP library is a weak dependency and an extension trigger — never
    # a hard dependency (FR-006).
    @test haskey(proj, "weakdeps")
    @test haskey(proj["weakdeps"], "ModelContextProtocol")
    @test !haskey(get(proj, "deps", Dict{String,Any}()), "ModelContextProtocol")
    @test haskey(proj, "extensions")
    @test proj["extensions"]["LibPARIMCPExt"] == "ModelContextProtocol"
end

@testitem "serve_mcp without ModelContextProtocol gives a helpful hint" begin
    using LibPARI

    # A fresh process that loads ONLY LibPARI — the extension stays dormant,
    # so `serve_mcp` has no method. The MethodError must carry the hint.
    root = pkgdir(LibPARI)
    code = "using LibPARI; LibPARI.serve_mcp()"
    err = IOBuffer()
    run(
        pipeline(
            ignorestatus(
                `$(Base.julia_cmd()) --startup-file=no --project=$root -e $code`,
            );
            stdout = devnull,
            stderr = err,
        ),
    )
    msg = String(take!(err))
    @test occursin("MethodError", msg)
    @test occursin("ModelContextProtocol", msg)
end

@testitem "MCP pari_functions lists and searches PARI functions" begin
    using LibPARI
    using ModelContextProtocol

    ext = Base.get_extension(LibPARI, :LibPARIMCPExt)

    # The full list covers the generated binding layer (NFR-01: >= 1200).
    all_fns = ext._functions_handler(Dict{String,Any}())
    @test all_fns isa AbstractString
    @test occursin("nextprime", all_fns)

    # A query filters by case-insensitive substring.
    primes = ext._functions_handler(Dict{String,Any}("query" => "prime"))
    @test primes isa AbstractString
    @test occursin("nextprime", primes)
    @test count("\n", primes) < count("\n", all_fns)   # filtered is shorter
end

@testitem "MCP pari_help returns help text and errors on unknown names" begin
    using LibPARI
    using ModelContextProtocol

    ext = Base.get_extension(LibPARI, :LibPARIMCPExt)

    help = ext._help_handler(Dict{String,Any}("name" => "nextprime"))
    @test help isa AbstractString
    @test !isempty(strip(help))

    unknown =
        ext._help_handler(Dict{String,Any}("name" => "no_such_pari_function"))
    @test unknown isa ModelContextProtocol.CallToolResult
    @test unknown.is_error
end

@testitem "MCP tool errors are structured, and the server stays usable" begin
    using LibPARI
    using ModelContextProtocol

    ext = Base.get_extension(LibPARI, :LibPARIMCPExt)
    iserr(r) = r isa ModelContextProtocol.CallToolResult && r.is_error

    # A PARI domain error (division by zero) -> structured error.
    @test iserr(ext._eval_handler(Dict{String,Any}("expression" => "1/0")))
    # A syntax error -> structured error.
    @test iserr(ext._eval_handler(Dict{String,Any}("expression" => "factor(")))
    # An unknown function for help -> structured error.
    @test iserr(ext._help_handler(Dict{String,Any}("name" => "nope")))

    # After the failures the connector still computes correctly.
    ok = ext._eval_handler(Dict{String,Any}("expression" => "2 + 2"))
    @test ok == "4"
end
