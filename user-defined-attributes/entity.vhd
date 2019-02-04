library ieee;
use ieee.std_logic_1164.all;


entity entity_attribute is

    -- Declare attribute name and it's return type.
    attribute hello: string;
    -- Associate attribute with entity and it return value.
    attribute hello of entity_attribute : entity is "hello world";

end entity;


architecture tb of entity_attribute is

    signal end_simulation : boolean := true;
    signal test : std_logic;

begin

    end_simulation <= false after 1 ps;
    assert end_simulation
    -- entity_attribute'hello: hello world
    report "entity_attribute'hello: " & entity_attribute'hello
    severity failure;

end architecture;

