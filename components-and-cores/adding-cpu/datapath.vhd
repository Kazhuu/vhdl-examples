library ieee;
use ieee.std_logic_1164.all;


entity datapath is
    port(
        clk : in std_logic;
        ir_on_address : in std_logic;
        pc_on_address : in std_logic;
        dbus_on_data : in std_logic;
        data_on_dbus : in std_logic;
        load_ir : in std_logic;
        load_ac : in std_logic;
        load_pc : in std_logic;
        inc_pc : in std_logic;
        clear_pc : in std_logic;
        pass : in std_logic;
        add : in std_logic;
        alu_on_dbus : in std_logic;
        address_bus : out std_logic_vector(5 downto 0);
        op_code : out std_logic_vector(1 downto 0);
        data_bus : inout std_logic_vector(7 downto 0)
    );
end entity;


architecture structural of datapath is
    signal dbus : std_logic_vector(7 downto 0);
    signal ir_out : std_logic_vector(7 downto 0);
    signal a_side : std_logic_vector(7 downto 0);
    signal b_side : std_logic_vector(7 downto 0);
    signal alu_out : std_logic_vector(7 downto 0);
    signal pc_out : std_logic_vector(5 downto 0);
begin
    -- Wire components with their bus and control signals.
    ir : entity work.instruction_register
    port map(clk, dbus, load_ir, ir_out);
    pc : entity work.program_counter
    port map(clk, ir_out(5 downto 0), load_pc, inc_pc, clear_pc, pc_out);
    ac : entity work.accumulator_register
    port map(clk, dbus, load_ac, a_side);
    alu : entity work.alu
    port map(a_side, b_side, pass, add, alu_out);

    -- Wire rest of the signals like data busses and their logic.
    b_side <= "00" & ir_out(5 downto 0);
    address_bus <= ir_out(5 downto 0)
        when ir_on_address = '1' else (others => 'Z');
    address_bus <= pc_out when pc_on_address = '1' else (others => 'Z');
    dbus <= alu_out when alu_on_dbus = '1' else (others => 'Z');
    dbus <= data_bus when data_on_dbus = '1' else (others => 'Z');
    data_bus <= dbus when dbus_on_data = '1' else (others => 'Z');
    op_code <= ir_out(7 downto 6);
end architecture;
