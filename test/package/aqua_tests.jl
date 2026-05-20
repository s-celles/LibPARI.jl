@testitem "Aqua quality assurance" begin
    using Aqua
    using LibPARI

    # `ambiguities` is disabled: Aqua runs that check in a spawned subprocess
    # that loads LibPARI, and loading PARI inside a multi-threaded Julia
    # process is not yet safe — PARI's working state is thread-local. Thread
    # serialization is milestone M9 (REQ-PLT-03); re-enable this check then.
    # All other Aqua checks run.
    Aqua.test_all(LibPARI; ambiguities = false)
end
