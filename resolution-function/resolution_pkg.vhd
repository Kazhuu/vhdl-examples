-- Package containing types and constants related to the signal
-- resolution. Standard std_logic_1164 package has own resolved types
-- already (std_logic and std_logic_vector) so own unresolved v4l type
-- must be used.
package resolution_pgk is

    -- Unresolved v4l type.
    type v4l is ('X', '0', '1', 'Z');
    -- Unresolved vector type.
    type v4l_vector is array (natural range <>) of v4l;

    -- Resolution function declaration which will be executed if signal
    -- has multiple drivers and driving value needs to be resolved.
    function resolution_fn (drivers : v4l_vector) return v4l;

    -- Resolution vector and resolution table which will be used to
    -- resolve signal driving values. Table is indexed with enum values
    -- instead of numerical indices.
    type v4l_resolution_vector is array (v4l, v4l) of v4l;
    constant v4l_resolution_table : v4l_resolution_vector := (
        --      'X'  '0', '1'  'Z'
        'X' => ('X', 'X', 'X', 'X'),
        '0' => ('X', '0', 'X', '0'),
        '1' => ('X', 'X', '1', '1'),
        'Z' => ('X', '0', '1', 'Z')
    );

end package;


package body resolution_pgk is

    -- Definition of resolution function. This function will be executed for
    -- signal when it has multiple drivers. Each driver is included in
    -- v4l_vector parameter.
    -- This function needs to be pure and should return default value in case
    -- drivers vector is empty. This can happen when all drivers are
    -- disconnected from it.
    -- Function example taken from book: VHDL: Modular Design and
    -- Synthesis of Cores and Systems from page 257.
    function resolution_fn(drivers : v4l_vector) return v4l is
        variable accumulate : v4l := 'Z';
    begin
        for i in drivers'range loop
            accumulate := v4l_resolution_table(accumulate, drivers(i));
            --report "accu: " & v4l'image(accumulate) & ", driver: " & v4l'image(drivers(i));
        end loop;
        return accumulate;
    end function;

end package body;
