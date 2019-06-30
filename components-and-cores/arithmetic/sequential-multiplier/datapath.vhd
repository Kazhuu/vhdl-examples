library ieee;
use ieee.std_logic_1164.all;


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
        sel_num : in std_logic;
        data : inout std_logic_vector(7 downto 0);
        a0 : out std_logic
    );
end entity;


architecture rtl of datapath is

begin

end architecture;
