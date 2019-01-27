library ieee;
use ieee.std_logic_1164.all;


entity test is
end entity;


architecture tb of test is

    signal clock : std_logic := '0';

begin

    -- Generate clock for 10 ps with now.
    clock <= not clock after 2 ps when now < 10 ps else '0';

    -- This will stop simulation at 10 ps. Other signal in assert condition
    -- is needed because 'now' itself won't trigger assert condition evaluation.
    -- 'assert now < 8 ps' would not work. This would only be triggered at start
    -- of simulation.
    assert clock = '0' or now < 8 ps
    report "simulated for " & time'image(now)
    severity failure;

end architecture;
