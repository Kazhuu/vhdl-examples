library ieee;
use ieee.std_logic_1164.all;


entity all_keyword is
end entity;


architecture tb of all_keyword is

    signal end_simulation : boolean := true;
    signal test1, test2 : std_logic;

    -- Declare attribute name and it's return type.
    attribute hello : string;
    -- Associate attribute with all visible signals with all keyword and
    -- their return value.
    -- Both test1 and test2 will be associated with the hello attribute.
    attribute hello of all : signal is "hello signals";

begin

    end_simulation <= false after 1 ps;
    assert end_simulation
    -- test1'hello: hello signals
    report "test1'hello: " & test1'hello
    severity failure;

end architecture;
