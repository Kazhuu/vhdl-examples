library ieee;
use ieee.std_logic_1164.all;


entity controller is
    port(
        rst : in std_logic;
        clk : in std_logic;
        op_code : in std_logic_vector(1 downto 0);
        read_mem : out std_logic;
        write_mem : out std_logic;
        ir_on_address : out std_logic;
        pc_on_address : out std_logic;
        dbus_on_data : out std_logic;
        data_on_dbus : out std_logic;
        load_ir : out std_logic;
        load_ac : out std_logic;
        load_pc : out std_logic;
        inc_pc : out std_logic;
        clear_pc : out std_logic;
        pass : out std_logic;
        add : out std_logic;
        alu_on_dbus : out std_logic
    );
end entity;


architecture rtl of controller is
    type state is (reset, fetch, decode, execute);
    signal current_state : state;
    signal next_state : state;
begin
    process(clk)
    begin
        if rising_edge(clk) then
            if rst = '1' then
                current_state <= reset;
            else
                current_state <= next_state;
            end if;
        end if;
    end process;

    process(current_state, op_code, rst)
    begin
        read_mem <= '0';
        write_mem <= '0';
        ir_on_address <= '0';
        pc_on_address <= '0';
        dbus_on_data <= '0';
        data_on_dbus <= '0';
        load_ir <= '0';
        load_ac <= '0';
        load_pc <= '0';
        pass <= '0';
        inc_pc <= '0';
        clear_pc <= '0';
        add <= '0';
        alu_on_dbus <= '0';
        case current_state is
            when reset =>
                if rst = '1' then
                    next_state <= reset;
                else
                    next_state <= fetch;
                end if;
                clear_pc <= '1';
            when fetch =>
                next_state <= decode;
                pc_on_address <= '1';
                read_mem <= '1';
                data_on_dbus <= '1';
                load_ir <= '1';
                inc_pc <= '1';
            when decode =>
                next_state <= execute;
            when execute =>
                next_state <= fetch;
                case op_code is
                    when "00" =>
                        ir_on_address <= '1';
                        read_mem <= '1';
                        data_on_dbus <= '1';
                        load_ac <= '1';
                    when "01" =>
                        dbus_on_data <= '1';
                        alu_on_dbus <= '1';
                        pass <= '1';
                        write_mem <= '1';
                        ir_on_address <= '1';
                    when "10" =>
                        load_pc <= '1';
                    when "11" =>
                        add <= '1';
                        alu_on_dbus <= '1';
                        load_ac <= '1';
                    when others =>
                        read_mem <= '0';
                        pc_on_address <= '0';
                        pass <= '0';
                        ir_on_address <= '0';
                        write_mem <= '0';
                        load_ac <= '0';
                        dbus_on_data <= '0';
                        data_on_dbus <= '0';
                        load_ir <= '0';
                        alu_on_dbus <= '0';
                        add <= '0';
                        inc_pc <= '0';
                        clear_pc <= '0';
                        load_pc <= '0';
                end case;
            when others =>
                next_state <= reset;
        end case;
    end process;
end architecture;
