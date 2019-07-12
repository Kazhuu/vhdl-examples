library ieee;
use ieee.std_logic_1164.all;


entity adding_cpu is
    port(
        clk : in std_logic;
        rst : in std_logic;
        address_bus : out std_logic_vector(5 downto 0);
        read_mem : out std_logic;
        write_mem : out std_logic;
        data_bus : inout std_logic_vector(7 downto 0)
    );
end entity;


architecture structural of adding_cpu is
    signal ir_on_address : std_logic;
    signal pc_on_address : std_logic;
    signal dbus_on_data : std_logic;
    signal data_on_dbus : std_logic;
    signal load_ir : std_logic;
    signal load_ac : std_logic;
    signal load_pc : std_logic;
    signal inc_pc : std_logic;
    signal clear_pc : std_logic;
    signal pass : std_logic;
    signal add : std_logic;
    signal alu_on_dbus : std_logic;
    signal op_code : std_logic_vector(1 downto 0);
begin
    contoller: entity work.controller
    port map(
        clk, rst, op_code, read_mem, write_mem, ir_on_address,
        pc_on_address, dbus_on_data, data_on_dbus, load_ir,
        load_ac, load_pc, inc_pc, clear_pc, pass, add, alu_on_dbus
    );
    datapath: entity work.datapath
    port map(
        clk, ir_on_address, pc_on_address, dbus_on_data, data_on_dbus,
        load_ir, load_ac, load_pc, inc_pc, clear_pc, pass, add,
        alu_on_dbus, address_bus, op_code, data_bus
    );
end architecture;
