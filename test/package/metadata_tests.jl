@testitem "Release metadata" begin
    using LibPARI
    using TOML

    root = pkgdir(LibPARI)
    project = TOML.parsefile(joinpath(root, "Project.toml"))

    # Registry-conformant package metadata (FR-009, FR-001, FR-013).
    @test project["name"] == "LibPARI"
    @test !isempty(project["uuid"])
    @test VersionNumber(project["version"]) isa VersionNumber

    # Compatibility bounds (FR-010, FR-011).
    compat = project["compat"]
    @test haskey(compat, "julia")
    @test haskey(compat, "PARI_jll")

    # Changelog in "Keep a Changelog" form, with an entry for the current
    # package version (FR-012).
    changelog = joinpath(root, "CHANGELOG.md")
    @test isfile(changelog)
    @test occursin("## [$(project["version"])]", read(changelog, String))
end
