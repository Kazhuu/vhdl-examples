-- Declare context which can be used in some other design with context
-- keyword. This is like an entry point to this library.
-- Using context make inlcuding multiple libraries less tedious and
-- easier. This context is compiled to test_lib library.
context lib_context is
    library ieee;
    use ieee.std_logic_1164.all;
    -- Notice no library statement needed, because this file is compiled
    -- to the test_lib library.
    use test_lib.all;
end context;
