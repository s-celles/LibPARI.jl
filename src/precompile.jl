# ---------------------------------------------------------------------------
# Precompilation workload — a representative subset of the API exercised at
# precompile time so the first call in a fresh session is fast (M8).
# Included last by src/LibPARI.jl.
# ---------------------------------------------------------------------------

@compile_workload begin
    # Julia does not run `__init__` during precompilation, so bring PARI up
    # here for the duration of the workload.
    is_initialized() ||
        _init_libpari!(_configured_stack_size(), _DEFAULT_MAXPRIME)
    try
        a = Gen(12)
        b = Gen(7)

        # Conversions (M5, M6).
        Gen(1)
        Gen(1.5)
        Gen(1 // 2)
        BigInt(a)
        Int(a)
        string(a)

        # Arithmetic operators and equality (M6).
        a + b
        a - b
        a * b
        a / b
        a^2
        -a
        a == b

        # The GP expression evaluator (M7).
        gp_eval("2 + 2")

        # One generated binding (M4) of each return convention.
        PARI.nextprime(a)          # Gen-returning
        PARI.getabstime()          # scalar-returning
        PARI.setrand(Gen(1))       # void-returning
        PARI.issquareall(Gen(49))  # output-argument
    finally
        # Do not let precompilation bake an initialized state into the image:
        # `_init_libpari!` is guarded on `_STATE`, so the loading process
        # must see a pristine `UNINITIALIZED` state and run its own
        # `__init__`.
        _STATE[] = LibraryState.UNINITIALIZED
        _STACK_SIZE[] = 0
    end
end
