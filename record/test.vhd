library ieee;
use ieee.std_logic_1164.all;


entity test is
end entity;


architecture tb of test is

    signal end_simulation : boolean := true;

    type person is record
        name : string(1 to 8);
        age : natural;
    end record;


    constant jon : person := (
        "Jon Snow",
        30
    );


begin

    end_simulation <= false after 5 ps;
    assert end_simulation
    -- Jon Snow is 30 years old
    report jon.name & " is " & Integer'image(jon.age) & " years old"
    severity failure;

end architecture;
