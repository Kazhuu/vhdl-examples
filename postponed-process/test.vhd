library ieee;
use ieee.std_logic_1164.all;


entity test is
end entity;


architecture tb of test is

    signal a, b : std_logic := '0';
    signal trg_count : integer := 0;
    signal postponed_trg_count : integer := 0;
    signal end_simulation : boolean := true;

begin

    a <= '1';
    b <= '1' when a = '1' else '0';
    end_simulation <= false after 2 ps;

    -- This process will be triggered 3 times.
    -- 1 = beginning of simulation (a=0, b=0).
    -- 2 = delta cycle when 'a' changes first (a=1, b=0).
    -- 3 = last delta cycle when 'b' changes after 'a' (a=1, b=1).
    process (a, b)
    begin
        trg_count <= trg_count + 1;
    end process;

    -- This process will only be triggered 2 times.
    -- 1 = beginning of the simulation (a=0, b=0).
    -- 2 = just before advancing real time (a=1, b=1).
    -- Postponed process will only be executed when all its sensitive
    -- list signal has settled down.
    postponed process (a, b)
    begin
        postponed_trg_count <= postponed_trg_count + 1;
    end process;

    -- "count: 3 postponed count: 2"
    assert end_simulation
    report "count: " & integer'image(trg_count) & " postponed count: " & integer'image(postponed_trg_count)
    severity failure;

end architecture;
