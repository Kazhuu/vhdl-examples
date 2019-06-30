library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity datapath is
    port (
        clk : in std_logic;
        clear_p : in std_logic;
        load_p : in std_logic;
        load_b : in std_logic;
        load_a : in std_logic;
        shift_a : in std_logic;
        msb_out : in std_logic;
        lsb_out : in std_logic;
        sel_sum : in std_logic;
        data : inout std_logic_vector(7 downto 0);
        a0 : out std_logic
    );
end entity;


architecture rtl of datapath is
    signal sum, shift_add : std_logic_vector(7 downto 0);
    signal a, b, p : std_logic_vector(7 downto 0);
    signal co : std_logic;
    signal op : std_logic_vector(1 downto 0);
    signal result : std_logic_vector(8 downto 0);
begin
    process (clk) begin
        if rising_edge(clk) then
            if (load_b = '1') then
                b <= data;
            end if;
        end if;
    end process;

    process (clk) begin
        if rising_edge(clk) then
            if (load_p = '1') then
                p <= (co and sel_sum) & shift_add(7 downto 1);
            end if;
        end if;
    end process;

    process (clk) begin
        if rising_edge(clk) then
            case op is
                when "01" => a <= shift_add(0) & a(7 downto 1);
                when "10" => a <= data;
                when others => a <= a;
            end case;
        end if;
    end process;

    -- How to add two std_logic_vectors together?
    result <= unsigned('0' & p) + unsigned('0' & b);

end architecture;
