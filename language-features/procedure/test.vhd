library ieee;
use ieee.std_logic_1164.all;


entity test is
end entity;


architecture tb of test is

    -- Simple procedure with one output and two inputs.
    -- Procedure does not use declarative part.
    procedure times (signal target : out integer; constant a, b : integer) is
    begin
        target <= a * b;
    end procedure;

    -- Procedure with one output and one input.
    -- Procedure's declarative part declares string variable for intermediate result.
    -- Procedure use for loop to replace single string characters with value of n.
    procedure numers_string (signal target : out string; constant n : positive) is
        variable greeting : string(1 to n);
    begin
        for i in 1 to n loop
            -- Integer is turned to string and first character is indexed from it.
            greeting(i) := integer'image(i - 1)(1);
        end loop;
        target <= greeting;
    end procedure;

    -- Signals for procedures.
    constant n : positive := 10;
    signal numers_string_result : string(1 to n);
    signal times_result : integer;
    -- Signals for simulation control.
    signal hello_n_print : boolean := true;
    signal end_simulation : boolean := true;

begin

    -- In concurrent parts procedures are called once in the beginning of
    -- simulation and after that when one of its input values has event
    -- (value change).
    times(times_result, 5, 5);              -- 25
    numers_string(numers_string_result, n); -- "0123456789"

    hello_n_print <= false after 1 ps;
    end_simulation <= false after 5 ps;

    assert hello_n_print
    report "numers_string() result: " & numers_string_result
    severity note;

    assert end_simulation
    report "times() result: " & integer'image(times_result)
    severity failure;

end architecture;
