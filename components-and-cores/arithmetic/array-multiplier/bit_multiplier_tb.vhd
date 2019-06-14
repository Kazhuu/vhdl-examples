library ieee;
library vunit_lib;

use ieee.std_logic_1164.all;
context vunit_lib.vunit_context;


entity tb_bit_multiplier is
    generic(runner_cfg : string);
end entity;


architecture tb of tb_bit_multiplier is
    signal x_in, y_in, c_in, p_in : std_logic := '0';
    signal x_out, y_out, c_out, p_out : std_logic;
begin
    dut : entity work.bit_multiplier port map (x_in, y_in, p_in, c_in, x_out, y_out, p_out, c_out);

    main : process
    begin
        test_runner_setup(runner, runner_cfg);
        while test_suite loop
            if run("multiply_with_x") then
                x_in <= '1';
                wait for 1 ps;

                check_equal(x_out, '1');
                check_equal(y_out, '0');
                check_equal(p_out, '0');
                check_equal(c_out, '0');
            elsif run("multiply_with_y") then
                y_in <= '1';
                wait for 1 ps;

                check_equal(x_out, '0');
                check_equal(y_out, '1');
                check_equal(p_out, '0');
                check_equal(c_out, '0');
            elsif run("multiply_with_x_y") then
                x_in <= '1';
                y_in <= '1';
                wait for 1 ps;

                check_equal(x_out, '1');
                check_equal(y_out, '1');
                check_equal(p_out, '1');
                check_equal(c_out, '0');
            elsif run("multiply_with_partial") then
                p_in <= '1';
                wait for 1 ps;

                check_equal(x_out, '0');
                check_equal(y_out, '0');
                check_equal(p_out, '1');
                check_equal(c_out, '0');
            elsif run("multiply_with_carry") then
                c_in <= '1';
                wait for 1 ps;

                check_equal(x_out, '0');
                check_equal(y_out, '0');
                check_equal(p_out, '1');
                check_equal(c_out, '0');
            elsif run("multiply_with_partial_carry") then
                p_in <= '1';
                c_in <= '1';
                wait for 1 ps;

                check_equal(x_out, '0');
                check_equal(y_out, '0');
                check_equal(p_out, '0');
                check_equal(c_out, '1');
            elsif run("multiply_with_partial_carry_x") then
                x_in <= '1';
                p_in <= '1';
                c_in <= '1';
                wait for 1 ps;

                check_equal(x_out, '1');
                check_equal(y_out, '0');
                check_equal(p_out, '0');
                check_equal(c_out, '1');
            elsif run("multiply_with_partial_carry_x_y") then
                x_in <= '1';
                y_in <= '1';
                p_in <= '1';
                c_in <= '1';
                wait for 1 ps;

                check_equal(x_out, '1');
                check_equal(y_out, '1');
                check_equal(p_out, '1');
                check_equal(c_out, '1');
            end if;
        end loop;
        test_runner_cleanup(runner);
    end process;
end architecture;
