library ieee;
use ieee.std_logic_1164.all;


library c_lib;
use c_lib.mux;


entity test is
end entity;


architecture tb of test is

    signal a, b, s : std_logic := '0';
    signal end_simulation : boolean := true;
    signal d : std_logic;

begin

    b <= '1';
    -- d = low, high, low, high
    mux1 : entity mux port map(a, b, s, d);
    s <= '1' after 1 ps, '0' after 2 ps, '1' after 3 ps;

    end_simulation <= false after 4 ps;

    assert end_simulation
    report "simulation ended"
    severity failure;

end architecture;
