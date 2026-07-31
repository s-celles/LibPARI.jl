@testitem "Aqua quality assurance" begin
    using Aqua
    using LibPARI

    # `ambiguities` is on (REQ-TYPE-13). It was disabled pending M9: Aqua
    # runs that check in a spawned subprocess that loads LibPARI, and PARI's
    # working state is thread-local, so loading it under a multi-threaded
    # Julia was unsafe. M9 (0.10.0) and the per-thread contexts of 0.13.0
    # settled that, and the check matters more now: M11-M18 added a large
    # matrix of two-argument methods on `Gen`, which is exactly the change
    # that introduces ambiguities.
    Aqua.test_all(LibPARI)
end
