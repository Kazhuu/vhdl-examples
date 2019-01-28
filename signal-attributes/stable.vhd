library ieee;
use ieee.std_logic_1164.all;


entity test is
end entity;


architecture tb of test is

    signal end_simulation : boolean := true;
    signal test : std_logic := '0';
    signal stable_test : boolean := true;
    signal delta_stable_test : boolean := true;

begin

    test <= '1' after 1 ps;
    -- This signal will become true when test has not changed in the last
    -- 2 ps.
    stable_test <= test'stable(2 ps);
    -- This signal will become true when test signal has not changed in the
    -- last delta cycle.
    delta_stable_test <= test'stable;

    -- This will be printed at start of simulation and at 3 ps.
    assert not stable_test
    report "stable_test: " & time'image(now)
    severity note;

    -- This will be printed at start of simulation and at 1 ps.
    assert not delta_stable_test
    report "delta_stable_test: " & time'image(now)
    severity note;

    end_simulation <= false after 4 ps;
    assert end_simulation
    report "simulation ended"
    severity failure;

end architecture;
