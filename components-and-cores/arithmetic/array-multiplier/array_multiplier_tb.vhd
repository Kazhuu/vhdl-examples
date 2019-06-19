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

            elsif run("1_times_1") then
                x <= "0001";
                y <= "0001";
                wait for 1 ps;

                check(result = "00000001", to_string(to_integer(unsigned(result))));
            elsif run("0_to_15_times_1") then
                for i in 0 to (2**x'length)-1 loop
                    x <= std_logic_vector(to_unsigned(i, x'length));
                    wait for 1 ps;

                    check(to_integer(unsigned(result)) = i, to_string(result));
                end loop;
            elsif run("5_times_5") then
                x <= "0101";
                y <= "0101";
                wait for 1 ps;

                check(result = "00011001", to_string(to_integer(unsigned(result))));
            end if;
        end loop;
        test_runner_cleanup(runner);
    end process;
end architecture;
