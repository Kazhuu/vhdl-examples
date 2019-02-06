library ieee;
use ieee.std_logic_1164.all;


entity others_keyword is
end entity;


architecture tb of others_keyword is

    signal end_simulation : boolean := true;
    signal test : std_logic;

    -- Declare attributes and return type.
    attribute hello : string;

    -- Associate hello_others attribute with signals that have not been
    -- specified before it with others keyword. Works similarly to all keyword.
    attribute hello of others : signal is "hello others";

begin

    end_simulation <= false after 1 ps;
    assert end_simulation
    -- end_simulation'hello: hello others
    report "end_simulation'hello: " & end_simulation'hello
    severity failure;

    assert false
    -- test'hello: hello others
    report "test'hello: " & test'hello
    severity note;

end architecture;
