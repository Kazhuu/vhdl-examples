library ieee;
use ieee.std_logic_1164.all;


entity test is
end entity;


architecture tb of test is

    signal end_simulation : boolean := true;

    type vl is ('X', '0', '1', 'Z');
    type vl_4by8 is array (3 downto 0, 0 to 7) of vl;

    signal mem : vl_4by8;



begin

    process (mem)
    begin
        -- Left bound.
        report "'LEFT: " & Integer'image(mem'left); -- 'LEFT: 3
        -- Right bound.
        report "'RIGTH: " & Integer'image(mem'right); -- 'RIGHT: 0
        -- Attributes parameter indicates the index range of the array.
        report "'RIGTH(1): " & Integer'image(mem'right(1)); -- 'RIGHT: 0
        report "'RIGHT(2): " & Integer'image(mem'right(2)); -- 'RIGHT(2): 7
        -- Upper bound.
        report "'HIGH: " & Integer'image(mem'high); -- 'HIGH: 3
        report "'HIGH(2): " & Integer'image(mem'high(2)); -- 'HIGH(2): 7
        -- Lower bound.
        report "'LOW(1): " & Integer'image(mem'low(1)); -- 'LOW(1): 0
        report "'LOW(2): " & Integer'image(mem'low(2)); -- 'LOW(2): 0
    end process;

    end_simulation <= false after 1 ps;
    assert end_simulation
    report "simulation ended"
    severity failure;

end architecture;
