library ieee;
use ieee.std_logic_1164.all;
-- Import resolution_pgk package content.
use work.resolution_pgk.all;


-- Resolved signal example.
-- Standard std_logic_1164 package has std_logic as a resolved type.
-- So own v4l type must be used for this example.
entity resolved_signal is
end entity;


architecture tb of resolved_signal is

    -- Declare a resolved signal with resolution_fn, which will be executed
    -- when this signal has multiple drivers and driver value needs to be
    -- resolved. Own subtype should be declared in the resolution_pgk package
    -- instead and then use it to declare new signals.
    signal test : resolution_fn v4l;
    signal end_simulation : boolean := true;

begin

    -- Make two assignments to the signal. This will create two drivers for it.
    -- This causes execution of resolution_fn to resolve the end signal which
    -- will evaluate to '1' according the v4l_resolution_table in
    -- resolution_pgk package.
    test <= '1';
    test <= 'Z';

    end_simulation <= false after 1 ps;
    assert end_simulation
    -- resolved test: '1'
    report "resolved test: " & v4l'image(test)
    severity failure;

end architecture;
