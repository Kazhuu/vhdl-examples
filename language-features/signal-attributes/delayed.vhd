library ieee;
use ieee.std_logic_1164.all;


entity delayed is
end entity;


architecture tb of delayed is

    signal end_simulation : boolean := true;
    signal test : std_logic := '0';
    signal delayed_test : std_logic;
    signal delta_delayed_test : std_logic;

begin

    -- delayed_test signal will be delayed by 1 ps from test signal.
    delayed_test <= test'delayed(1 ps);
    -- delta_delayed_test signal will be delayed by one delta cycle from test
    -- signal if no parameter is given.
    delta_delayed_test <= test'delayed;

    test <= '1' after 1 ps;

    -- Process will be executed when simulation time is 2 ps.
    process (delayed_test)
    begin
        report "pr1 run at " & time'image(now);
    end process;

    -- Process will be executed when simulation time is 1 ps.
    process (delta_delayed_test)
    begin
        report "pr2 run at " & time'image(now);
    end process;

    end_simulation <= false after 2 ps;
    assert end_simulation
    report "simulation ended"
    severity failure;

end architecture;
