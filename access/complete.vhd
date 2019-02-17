entity complete is
end entity;


architecture tb of complete is

    -- Declare record type.
    type person is record
        name : string(1 to 3);
        age : integer;
    end record;
    -- Declare complete access type of person record.
    -- Complete means not using type definition which doesn't include all
    -- information before declaring access type.
    -- For incomplete check incomplete.vhd.
    type person_access is access person;

    signal end_simulation : boolean := true;

begin

    persons : process(end_simulation)
        -- Access types are allocated with new keyword and can only be allocated
        -- only to variables.
        variable person1 : person_access := new person;
        -- Null keyword means unallocated variable.
        variable person2 : person_access := null;
    begin
        -- Set record values normally and print it.
        person1.name := "jon";
        person1.age := 35;
        report "person1.name: " & person1.name & " person1.age: " &
        integer'image(person1.age);
    end process;

    end_simulation <= false after 1 ps;
    assert end_simulation
    report "simulation ended"
    severity failure;

end architecture;
