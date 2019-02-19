library ieee;
use ieee.std_logic_1164.all;
-- Import resolution_pgk package content.
use work.resolution_pgk.all;


-- Resolved vector example.
-- Standard std_logic_1164 package has std_logic_vector as a resolved type.
-- So own v4l type must be used for this example.
entity resolved_vector is
end entity;


architecture tb of resolved_vector is

    -- First declare resolved subtype which will use resolution_fn function.
    -- This could and should be done in the package instead, not here.
    subtype resolved_v4l is resolution_fn v4l;
    -- Declare unconstrained array of resolved subtype. This type too should
    -- be declared in the resolution_pgk package.
    type resolved_v4l_vector is array (natural range <>) of resolved_v4l;
    -- Then constrained signal with declared vector type.
    signal test_vector : resolved_v4l_vector(1 downto 0);

    signal end_simulation : boolean := true;

begin

    -- Make two assignments to the signal. This will create two drivers for it.
    -- This causes execution of resolution_fn to resolve the end signal which
    -- will evaluate to "10" according the v4l_resolution_table in
    -- resolution_pgk package.
    test_vector <= "1Z";
    test_vector <= "Z0";

    end_simulation <= false after 1 ps;
    assert end_simulation
    -- resolved test_vector: '1''0'
    report "resolved test_vector: " & v4l'image(test_vector(1)) & v4l'image(test_vector(0))
    severity failure;

end architecture;
