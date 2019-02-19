-- Make library visible to design.
library test_lib;
-- Apply test_lib context to this design. This will include context includes
-- visible to this design. No need to write or import ieee stuff.
context test_lib.lib_context;


entity test is
end entity;


architecture tb of test is

    -- std_logic type available because of the context.
    signal a, b, s : std_logic := '0';
    signal d : std_logic;
    signal end_simulation : boolean := true;

begin

    -- Mux component available because of the context.
    mux1 : entity mux port map(a, b, s, d);

    end_simulation <= false after 1 ps;
    assert end_simulation
    report "simulation ended"
    severity failure;

end architecture;


