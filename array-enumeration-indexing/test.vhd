library ieee;
use ieee.std_logic_1164.all;


entity test is
    end entity;


architecture tb of test is

    signal end_simulation : boolean := true;

    -- Declare enumeration type.
    type chars is ('a', 'b', 'c', 'd', 'f');
    -- Declare array type which is indexed using chars enumeration elements.
    type ascii_vector is array (chars) of integer;

    -- ASCII table can be indexed using chars enumeration elements.
    constant ascii_table : ascii_vector := (
        97,  -- a
        98,  -- b
        99,  -- c
        100, -- d
        101  -- f
    );

begin

    end_simulation <= false after 1 ps;

    assert end_simulation
    -- a: 97, b: 98, c: 99, d: 100, f: 101
    report "a: " & Integer'image(ascii_table('a')) & ", b: " & Integer'image(ascii_table('b')) &
        ", c: " & Integer'image(ascii_table('c')) & ", d: " & Integer'image(ascii_table('d')) & ", f: " &
        Integer'image(ascii_table('f'))
    severity failure;

end architecture;
