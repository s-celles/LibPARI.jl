@testitem "Source code is formatted" begin
    using JuliaFormatter
    using LibPARI

    # Every Julia source under src/ and test/ must already conform to
    # .JuliaFormatter.toml (80-column margin). `overwrite = false` checks
    # without modifying.
    root = pkgdir(LibPARI)
    @test JuliaFormatter.format(joinpath(root, "src"); overwrite = false)
    @test JuliaFormatter.format(joinpath(root, "test"); overwrite = false)
end
