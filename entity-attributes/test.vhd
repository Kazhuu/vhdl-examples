library ieee;
use ieee.std_logic_1164.all;


-- Parent component.
entity test is
end entity;


architecture tb of test is

    signal end_simulation : boolean := true;
    signal d : std_logic;

begin

    -- Instantiate component which will print entity attributes.
    mock1: entity work.mock port map(d);

    end_simulation <= false after 1 ps;
    assert end_simulation
    report "simulation ended"
    severity failure;

end architecture;



library ieee;
use ieee.std_logic_1164.all;


-- Child component.
entity mock is
    port (d : out std_logic);
end entity;


architecture tb_mock of mock is
begin
    -- Entity attributes can be applied to all entity classes in VHDL.
    -- These are entities, architectures, configurations, procedures, functions,
    -- packages, types, subtypes, constants, signals, variables, components,
    -- labels, literals, units, groups and files.

    -- instance_name: :test(tb):mock1@mock(tb_mock):
    assert false report "instance_name: " & tb_mock'instance_name severity note;
    -- path_name: :test:mock1:
    assert false report "path_name: " & tb_mock'path_name severity note;
    -- simple_name: tb_mock
    assert false report "simple_name: " & tb_mock'simple_name severity note;

    -- signal: :test(tb):mock1@mock(tb_mock):d
    assert false report "mock: " & d'instance_name severity note;
    d <= '1';

end architecture;
