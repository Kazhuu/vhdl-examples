library ieee;
use ieee.std_logic_1164.all;
-- Import resolution_pgk package content.
use work.resolution_pgk.all;


entity test is
end entity;


architecture tb of test is

    signal test : resolution_fn v4l;

    subtype resolved_v4l is resolution_fn v4l;
    type resolved_v4l_vector is array (natural range <>) of resolved_v4l;
    signal test_vector : resolved_v4l_vector(1 downto 0);

    signal end_simulation : boolean := true;

begin

    test <= '1';
    test <= 'Z';
    --test_vector <= "11";
    --test_vector <= "11";

    end_simulation <= false after 1 ps;
    assert end_simulation
    -- resolved test: '1'
    report "resolved test: " & v4l'image(test)
    severity failure;

    assert false
    report "resolved test_vector: " & resolved_v4l'image(test_vector(1)) &
    resolved_v4l'image(test_vector(0))
    severity note;

end architecture;
