library ieee;
use ieee.std_logic_1164.all;


entity mux is
	port (
		a, b, s : in std_logic;
		d : out std_logic
	);
end entity;


architecture rtl of mux is
begin
	d <= b when s = '1' else a;
end architecture;
