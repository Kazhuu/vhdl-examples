library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity program_counter is
    port(
        clk : in std_logic;
        data_in : in std_logic_vector(5 downto 0);
        load : in std_logic;
        increment : in std_logic;
        clear : in std_logic;
        data_out : out std_logic_vector(5 downto 0)
    );
end entity;


architecture rtl of program_counter is
    signal program_counter : std_logic_vector(5 downto 0);
begin
    process(clk)
    begin
        if rising_edge(clk) then
            if clear = '1' then
                program_counter <= (others => '0');
            elsif load = '1' then
                program_counter <= data_in;
            elsif increment = '1' then
                program_counter <= std_logic_vector(unsigned(program_counter) + 1);
            end if;
        end if;
    end process;

    data_out <= program_counter;
end architecture;
