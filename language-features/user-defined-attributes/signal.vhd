library ieee;
use ieee.std_logic_1164.all;


entity signal_attribute is
end entity;


architecture tb of signal_attribute is

    signal end_simulation : boolean := true;
    signal test1, test2 : std_logic;

    -- Declare attribute name and it's return type.
    attribute hello : string;
    -- Associate attribute with signal and it return value.
    attribute hello of end_simulation : signal is "hello world";
    -- Associate attribute with many signals separating them with commas.
    attribute hello of test1, test2 : signal is "hello signals";


begin

    end_simulation <= false after 1 ps;
    assert end_simulation
    -- end_simulation'hello: hello world
    report "end_simulation'hello: " & end_simulation'hello
    severity failure;

    assert false
    report "test1'hello: " & test1'hello
    severity note;

end architecture;

