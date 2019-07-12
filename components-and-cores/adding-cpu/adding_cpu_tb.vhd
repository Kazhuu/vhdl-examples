library ieee;
library vunit_lib;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
context vunit_lib.vunit_context;


entity adding_cpu_tb is
    generic(runner_cfg : string);
end entity;


architecture tb of adding_cpu_tb is
    constant half_period : time := 1 ps;

    signal clk : std_logic := '0';
    signal rst : std_logic := '1';
    signal read_mem, write_mem : std_logic;
    signal address_bus : std_logic_vector(5 downto 0);
    signal data_bus : std_logic_vector(7 downto 0);
begin
    -- Device under test.
    dut: entity work.adding_cpu
    port map(clk, rst, address_bus, read_mem, write_mem, data_bus);

    -- Generate clock.
    clk <= not clk after half_period;
    rst <= '0' after 2 ps;

    main: process
        variable address_bus_result : std_logic_vector(address_bus'range);
        variable data_bus_result : std_logic_vector(data_bus'range);
    begin
        test_runner_setup(runner, runner_cfg);
        while test_suite loop
            if run("init_state_mem_signals") then
                check_equal(read_mem, '0');
                check_equal(read_mem, '0');
                wait until rst = '0';
                check_equal(read_mem, '0');
                check_equal(write_mem, '0');
                wait until rising_edge(clk);
                check_equal(read_mem, '0');
                check_equal(write_mem, '0');
                wait until rising_edge(clk);
                check_equal(read_mem, '1');
                check_equal(write_mem, '0');
            elsif run("init_state_address_bus") then
                address_bus_result := "ZZZZZZ";
                wait until read_mem = '1';
                check_equal(address_bus, address_bus_result);
                wait until rising_edge(clk); -- fetch
                address_bus_result := "000000";
                check_equal(address_bus, address_bus_result);
            elsif run("load_opcode") then
                data_bus <= "00111111"; -- load from 111111
                wait until read_mem = '1';
                wait until rising_edge(clk); -- fetch
                wait until rising_edge(clk); -- decode
                wait until rising_edge(clk); -- execute
                address_bus_result := "111111";

                check_equal(address_bus, address_bus_result);
                check_equal(read_mem, '1');
                check_equal(write_mem, '0');
            elsif run("store_opcode") then
                data_bus <= "01011111"; -- store to 011111
                wait until read_mem = '1';
                wait until rising_edge(clk); -- fetch
                wait until rising_edge(clk); -- decode
                wait until rising_edge(clk); -- execute
                address_bus_result := "011111";

                check_equal(address_bus, address_bus_result);
                check_equal(read_mem, '0');
                check_equal(write_mem, '1');
            elsif run("jump_opcode") then
                data_bus <= "10111111"; -- jump to 111111
                wait until read_mem = '1';
                wait until rising_edge(clk); -- fetch
                wait until rising_edge(clk); -- decode
                wait until rising_edge(clk); -- execute
                wait until rising_edge(clk); -- fetch
                address_bus_result := "111111";

                check_equal(address_bus, address_bus_result);
                check_equal(read_mem, '1');
                check_equal(write_mem, '0');
            elsif run("add_opcode") then
                wait until read_mem = '1';
                data_bus <= "00000000"; -- load 00000000 to ac
                wait until rising_edge(clk); -- fetch
                wait until rising_edge(clk); -- decode
                wait until rising_edge(clk); -- execute
                data_bus <= "11011111"; -- add 011111
                wait until rising_edge(clk); -- fetch
                wait until rising_edge(clk); -- decode
                wait until rising_edge(clk); -- execute
                data_bus <= "01000000"; -- store result to 000000
                wait until rising_edge(clk); -- fetch
                wait until rising_edge(clk); -- decode
                -- set bus to Z state so dut can drive it.
                data_bus <= "ZZZZZZZZ";
                wait until rising_edge(clk); -- execute
                data_bus_result := "00011111";

                check_equal(data_bus, data_bus_result);
            end if;
        end loop;
        test_runner_cleanup(runner);
    end process;
end architecture;
