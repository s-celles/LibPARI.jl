# M4 — generator contract. `src/bindings.jl` is one committed, header-marked,
# reproducible file, and the generator omits / skips / excludes records rather
# than emitting a broken binding or failing silently.

@testitem "the generated bindings file is one committed, header-marked module" begin
    using LibPARI

    path = joinpath(pkgdir(LibPARI), "src", "bindings.jl")
    @test isfile(path)

    text = read(path, String)
    head = first(split(text, '\n'), 6)

    # G5 — an auto-generated, do-not-edit header opens the file.
    @test startswith(head[1], "#")
    @test any(l -> occursin("AUTO-GENERATED", l), head)
    @test any(l -> occursin("DO NOT EDIT", l), head)

    # G4 — the file defines the LibPARI.PARI submodule.
    @test occursin(r"(?m)^module PARI$", text)
    @test occursin(r"(?m)^end  # module PARI$", text)
end

@testitem "regenerating the bindings is byte-for-byte reproducible" begin
    using LibPARI

    repo = pkgdir(LibPARI)
    bindings = joinpath(repo, "src", "bindings.jl")
    genenv = joinpath(repo, "gen")
    before = read(bindings, String)

    # The gen/ environment is development-time only and gen/Manifest.toml
    # is intentionally untracked (matches docs/-pattern). Instantiate it
    # so a cold CI runner can launch the generator below. The explicit
    # JULIA_LOAD_PATH overrides Pkg.test()'s `@`-only inheritance so the
    # subprocess can `using Pkg` (stdlib).
    rm(joinpath(genenv, "Manifest.toml"); force = true)
    run(
        pipeline(
            addenv(
                `$(Base.julia_cmd()) --startup-file=no --project=$genenv -e "using Pkg; Pkg.instantiate()"`,
                "JULIA_LOAD_PATH" => "@$(Sys.iswindows() ? ';' : ':')@stdlib",
            );
            stdout = devnull,
            stderr = devnull,
        ),
    )

    # G7 — re-run the development-time generator in its own environment;
    # the same PARI version must yield byte-identical output.
    run(
        pipeline(
            `$(Base.julia_cmd()) --startup-file=no --project=$genenv $(joinpath(genenv, "generate.jl"))`;
            stdout = devnull,
            stderr = devnull,
        ),
    )

    @test read(bindings, String) == before
end

@testitem "the generator omits, skips, and excludes — never silently" begin
    using LibPARI

    # A minimal RFC-822 reader for `pari.desc`.
    function records(path)
        recs = Dict{String,String}[]
        cur = Dict{String,String}()
        key = ""
        for line in eachline(path)
            if isempty(line)
                isempty(cur) || (push!(recs, cur); cur = Dict{String,String}())
                key = ""
            elseif startswith(line, ' ') || startswith(line, '\t')
                key == "" || (cur[key] *= "\n" * strip(line))
            else
                m = match(r"^([A-Za-z0-9_-]+):[ ]?(.*)$", line)
                m === nothing ||
                    (key = m.captures[1]; cur[key] = String(m.captures[2]))
            end
        end
        isempty(cur) || push!(recs, cur)
        return recs
    end

    recs = records(LibPARI.PARI_jll.pari_desc)
    isbinding(name) =
        isdefined(LibPARI.PARI, Symbol(name)) &&
        getfield(LibPARI.PARI, Symbol(name)) isa Function

    emitted = filter(names(LibPARI.PARI; all = true)) do s
        !startswith(string(s), "#") &&
            s ∉ (:eval, :include) &&
            isdefined(LibPARI.PARI, s) &&
            getfield(LibPARI.PARI, s) isa Function
    end

    # FR-014 — a record with no `C-Name` produces no binding: every emitted
    # binding traces back to a record that has a `C-Name`.
    cnames = Set(strip(r["C-Name"]) for r in recs if haskey(r, "C-Name"))
    no_cname = filter(r -> !haskey(r, "C-Name"), recs)
    @test !isempty(no_cname)
    @test all(s -> string(s) in cnames, emitted)

    # FR-016 — a GP-closure-argument function (`E`/`I`/`V`/`C`) is excluded.
    closures = filter(recs) do r
        haskey(r, "C-Name") &&
            haskey(r, "Prototype") &&
            occursin(r"[EIVC]", r["Prototype"])
    end
    @test !isempty(closures)
    @test all(r -> !isbinding(strip(r["C-Name"])), closures)

    # FR-015 — the generator names what it skips, in a diagnostic report.
    repo = pkgdir(LibPARI)
    genenv = joinpath(repo, "gen")

    # The gen/ environment is development-time only and gen/Manifest.toml
    # is intentionally untracked (matches docs/-pattern). Instantiate it
    # so a cold CI runner can launch the generator below. The explicit
    # JULIA_LOAD_PATH overrides Pkg.test()'s `@`-only inheritance so the
    # subprocess can `using Pkg` (stdlib).
    rm(joinpath(genenv, "Manifest.toml"); force = true)
    run(
        pipeline(
            addenv(
                `$(Base.julia_cmd()) --startup-file=no --project=$genenv -e "using Pkg; Pkg.instantiate()"`,
                "JULIA_LOAD_PATH" => "@$(Sys.iswindows() ? ';' : ':')@stdlib",
            );
            stdout = devnull,
            stderr = devnull,
        ),
    )

    report = read(
        pipeline(
            `$(Base.julia_cmd()) --startup-file=no --project=$genenv $(joinpath(genenv, "generate.jl"))`;
            stderr = devnull,
        ),
        String,
    )

    @test occursin(r"omitted \(no C-Name\) [\. ]+[1-9]", report)
    @test occursin(r"excluded \(GP closures\) [\. ]+[1-9]", report)
    @test occursin(r"skipped \(unrecognized\) [\. ]+[1-9]", report)
    @test occursin("Skipped functions:", report)
end
