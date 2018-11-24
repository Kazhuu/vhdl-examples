library ieee;
use ieee.std_logic_1164.all;


entity test is
end entity;


architecture tb of test is

    signal end_simulation : boolean := true;

    type chars is (a, b, c, d, e, f);
    subtype abc is chars range a to c;

    signal char_a : chars := a;
    signal char_f : chars := f;
    signal abc_char1 : abc;
    signal abc_char2 : abc;

begin

    -- Neither following assigments needs explicit type conversion.
    abc_char1 <= char_a after 1 ps;
    char_a <= abc_char1 after 2 ps;

    -- This would cause a simulation error
    -- abc_char2 <= char_f after 3 ps;

    end_simulation <= false after 5 ps;
    assert end_simulation
    report "simulated for " & time'image(now)
    severity failure;

end architecture;
