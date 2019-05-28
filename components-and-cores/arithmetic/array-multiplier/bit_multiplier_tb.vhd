-- TODO: Finish this test bench with carry and p testings.
library ieee;
library vunit_lib;

use ieee.std_logic_1164.all;
context vunit_lib.vunit_context;


entity tb_example is
    generic (runner_cfg : string);
end entity;


architecture tb of tb_example is
    signal x_in, y_in, c_in, p_in : std_logic := '0';
    signal x_out, y_out, c_out, p_out : std_logic;
begin
    dut : entity work.bit_multiplier port map (x_in, y_in, p_in, c_in, x_out, y_out, p_out, c_out);

    main : process
    begin
        test_runner_setup(runner, runner_cfg);

        while test_suite loop
            if run("test_without_carry") then
                x_in <= '1';
                y_in <= '0';
                wait for 1 ps;
                check(y_out = '0');
                check(x_out = '1');
            elsif run("second test") then
                report "second";
            end if;
        end loop;

        test_runner_cleanup(runner); -- Simulation ends here
    end process;
end architecture;
