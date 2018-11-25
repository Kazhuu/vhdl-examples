library ieee;
use ieee.std_logic_1164.all;


entity test is
end entity;


architecture tb of test is

    signal end_simulation : boolean := true;

    type lv is ('X', '0', '1', 'Z');
    type lv_byte is array (7 downto 0) of lv;
    type lv_octal is array (7 downto 0) of lv;

    signal byte_reg1 : lv_byte;
    signal byte_reg2 : lv_octal;

begin

    -- Explicit type conversion to closely related type.
    byte_reg1 <= lv_byte(byte_reg2) after 1 ps;
    byte_reg2 <= lv_octal(byte_reg1) after 2 ps;

    end_simulation <= false after 3 ps;
    assert end_simulation
    report "simulation ended"
    severity failure;

end architecture;
