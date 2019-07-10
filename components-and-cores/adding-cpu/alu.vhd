library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity alu is
    port(
        a : in std_logic_vector(7 downto 0);
        b : in std_logic_vector(7 downto 0);
        pass : in std_logic;
        add : in std_logic;
        result_out : out std_logic_vector(7 downto 0)
    );
end entity;


architecture rtl of alu is
    signal result : std_logic_vector(7 downto 0);
begin
    process(a, b, pass, add)
    begin
        if pass = '1' then
            result <= a;
        elsif add = '1' then
            result <= std_logic_vector(unsigned(a) + unsigned(b));
        else
            result <= (others => '0');
        end if;
    end process;

    result_out <= result;
end architecture;
