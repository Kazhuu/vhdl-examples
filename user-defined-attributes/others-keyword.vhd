library ieee;
use ieee.std_logic_1164.all;


entity others_keyword is
end entity;


architecture tb of others_keyword is

    signal end_simulation : boolean := true;
    signal test1, test2 : std_logic;

    -- Declare attributes and return type.
    attribute hello : string;
    attribute hello_others : string;

    -- TODO: Also applied to end_simulation signal?
    -- Associate hello attribute with end_simulation signal.
    attribute hello of end_simulation : signal is "hello signal";
    -- Associate hello_others attribute with every other signal that
    -- has not been specified before it. In this case test1 and test2.
    attribute hello_others of others : signal is "hello others";

begin

    end_simulation <= false after 1 ps;
    assert end_simulation
    -- end_simulation'hello: hello signal
    report "end_simulation'hello: " & end_simulation'hello_others
    severity failure;

    assert false
    -- test1'hello: hello others
    report "test1'hello_others: " & test1'hello_others
    severity note;

    assert false
    -- test2'hello: hello others
    report "test2'hello_others: " & test2'hello_others
    severity note;

end architecture;
