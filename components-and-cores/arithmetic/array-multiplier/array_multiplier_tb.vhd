library ieee;
library vunit_lib;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
context vunit_lib.vunit_context;


entity tb_array_multiplier is
    generic(runner_cfg : string);
end entity;


architecture tb of tb_array_multiplier is
    signal x : std_logic_vector(3 downto 0) := (others => '0');
    signal y : std_logic_vector(3 downto 0) := (others => '0');
    signal result : std_logic_vector(x'length + y'length - 1 downto 0);
begin
    dut: entity work.array_multiplier port map(x, y, result);

    main: process
    begin
        test_runner_setup(runner, runner_cfg);
        while test_suite loop
            if run("0_times_0") then
                wait for 1 ps;
                check(to_integer(unsigned(result)) = 0, to_string(result));

            elsif run("5_times_5") then
                x <= "0101";
                y <= "0101";
                wait for 1 ps;

                check(result = "00011001", to_string(result));
            end if;
        end loop;
    end process;
end architecture;
