# M9 — platform correctness (US2 / REQ-PLT-01): LibPARI's hand-written code
# carries no platform-specific assumption, so it is correct on every
# platform `PARI_jll` provides an artifact for.

@testitem "the source code carries no platform-specific assumption" begin
    using LibPARI

    srcdir = joinpath(pkgdir(LibPARI), "src")
    # `bindings.jl` is auto-generated (pure `ccall`/`Gen` code, reviewed via
    # the generator); the audit covers the hand-written core files.
    handwritten =
        filter(f -> endswith(f, ".jl") && f != "bindings.jl", readdir(srcdir))
    @test !isempty(handwritten)

    offenders = String[]
    for file in handwritten
        text = read(joinpath(srcdir, file), String)
        for pat in ("@static", "Sys.iswindows", "Sys.isapple", "Sys.islinux")
            occursin(pat, text) && push!(offenders, "$(file): $(pat)")
        end
    end
    @test isempty(offenders)
end
