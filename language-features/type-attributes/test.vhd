library ieee;
use ieee.std_logic_1164.all;


entity test is
end entity;


architecture tb of test is

    signal end_simulation : boolean := true;

    type vl is ('X', '0', '1', 'Z');
    subtype v0z is vl range '0' to 'Z';
    subtype v01 is vl range '0' to '1';
    subtype v10 is vl range '1' downto '0';

begin

    process (end_simulation)
    begin
        -- Base of type.
        report "v0z'base: v4l";
        -- Left bound of type or subtype.
        report "v0z'left: " & vl'image(v0z'left); -- '0'
        report "vl'left: " & vl'image(vl'left); -- 'X'
        -- Right bound of type or subtype.
        report "v01'right: " & vl'image(v01'right); -- '1'
        report "vl'right: " & vl'image(vl'right); -- 'Z'
        -- Upper bound of type or subtype.
        report "integer'high: " & integer'image(integer'high); -- 2147483647
        report "v01'high: " & vl'image(v01'high); -- '1'
        -- Lower bound of type or subtype.
        report "integer'low: " & integer'image(integer'low); -- -2147483648
        report "v01'low: " & vl'image(v01'low); -- '0'
        -- Position of value in base of type.
        report "v01'pos('Z'): " & integer'image(v01'pos('Z')); -- 3
        report "vl'pos('Z'): " & integer'image(vl'pos('Z')); -- 3
        -- Value at position in base of type.
        report "v01'val(1): " & vl'image(v01'val(1)); -- '0'
        report "v1'val(3): " & vl'image(vl'val(3)); -- 'Z'
        -- Value after given value in base of type.
        report "vl'succ('1'): " & vl'image(vl'succ('1')); -- 'Z'
        report "v10'succ('0'): " & vl'image(v10'succ('0')); -- '1'
        -- Value before given value in base of type.
        report "vl'pred('0'): " & vl'image(vl'pred('0')); -- 'X'
        report "v10'pred('1'): " & vl'image(v01'pred('1')); -- '0'
        -- Value left of given value in type.
        report "vl'leftof('1'): " & vl'image(vl'leftof('1')); -- '0'
        report "v10'leftof('0'): " & vl'image(v10'leftof('0')); -- '1'
        -- Value right of given value in type.
        report "vl'rightof('0'): " & vl'image(vl'rightof('0')); -- '1'
        report "v10'rightof('1'): " & vl'image(v10'rightof('1')); -- '0'
        -- True if ascending.
        report "vl'ascending: " & boolean'image(vl'ascending); -- true
        -- Converts given value type to string.
        report "vl'image('Z'): " & vl'image('Z'); -- 'Z'
        -- Converts given string to value of type.
        report "vl'value(""X""): " & vl'image(vl'value("X")); -- 'X'
    end process;

    end_simulation <= false after 1 ps;
    assert end_simulation
    report "simulation ended"
    severity failure;

end architecture;
