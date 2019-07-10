library ieee;
use ieee.std_logic_1164.all;


entity instruction_register is
    port(
        clk : in std_logic;
        data_in : in std_logic_vector(7 downto 0);
        load : in std_logic;
        data_out : out std_logic_vector(7 downto 0)
    );
end entity;


architecture rtl of instruction_register is
begin
    process(clk)
    begin
        if rising_edge(clk) then
            if load = '1' then
                data_out <= data_in;
            end if;
        end if;
    end process;
end architecture;
