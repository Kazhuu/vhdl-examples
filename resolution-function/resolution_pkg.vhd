package resolution_pgk is

    type v4l is ('X', '0', '1', 'Z');
    type v4l_vector is array (natural range <>) of v4l;

    function resolution_fn (drivers : v4l_vector) return v4l;

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

    function resolution_fn(drivers : v4l_vector) return v4l is
        variable accumulate : v4l := 'Z';
    begin
        for i in drivers'range loop
            accumulate := v4l_resolution_table(accumulate, drivers(i));
            report "accu: " & v4l'image(accumulate) & ", driver: " & v4l'image(drivers(i));
        end loop;
        return accumulate;
    end function;

end package body;
