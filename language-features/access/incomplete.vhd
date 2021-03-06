entity incomplete is
end entity;


-- Incomplete type declaration must be used to be able to declare other types
-- before the actual declaration. This example use record queue_element which can
-- point to other queue_element with link field.
architecture tb of incomplete is

    -- Declare incomplete type queue_element.
    type queue_element;
    -- Declare pointer access type of queue_element.
    type pointer is access queue_element;
    -- Complete queue_element type declaration as a record type.
    -- Incomplete type declaration is used to declare pointer type and record
    -- type link field. In order to declare both types, incomplete type
    -- queue_element must be used.
    type queue_element is record
        value : integer;
        link : pointer;
    end record;

    signal end_simulation : boolean := true;

begin

    test : process(end_simulation)
        -- Access types are allocated with new keyword and can only be allocated
        -- only to variables.
        variable element1 : pointer := new queue_element;
        -- Null keyword means unallocated variable.
        variable element2 : pointer := null;
    begin
        -- Set element1 value.
        element1.value := 1;

        -- Create new element2 and set element1 to point to it.
        element2 := new queue_element;
        element2.value := 2;
        element1.link := element2;

        report "element1.value: " & integer'image(element1.value);
        report "element1.link.value: " & integer'image(element1.link.value);
    end process;

    end_simulation <= false after 1 ps;
    assert end_simulation
    report "simulation ended"
    severity failure;

end architecture;
