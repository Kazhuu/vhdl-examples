-- Wait until statement can be used in processes to suspend its execution until
-- given expressions becomes true.

-- This example code will print following messages:
-- Note: before wait until
-- Note: after wait until
-- Note: before wait until
-- Failure: simulation ended

library ieee;
use ieee.std_logic_1164.all;


entity wait_until is
end entity;


architecture tb of wait_until is

    signal test : boolean := false;
    signal end_simulation : boolean := true;

begin

    test <= true after 1 ps;

    -- Process will execute until wait statement and suspends until test signal
    -- changes to true. After that execution continues until wait statements is
    -- executed again. This causes process to be suspended again until event
    -- happens on the test signal. This is the reason also why first message is
    -- printed twice.
    main : process
    begin
        report "before wait until";
        wait until test;
        report "after wait until";
    end process;

    end_simulation <= false after 2 ps;
    assert end_simulation
    report "simulation ended"
    severity failure;

end architecture;
