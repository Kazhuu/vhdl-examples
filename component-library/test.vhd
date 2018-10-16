library ieee;
use ieee.std_logic_1164.all;

library c_lib;
use c_lib.mux;

entity test is
end entity;


architecture tb of test is
	signal a, b, s, d : std_logic := '0';
begin
	b <= '1';
	mux1 : entity mux port map(a, b, s, d);
	s <= '1' after 1 ps, '0' after 2 ps, '1' after 3 ps;
end architecture;
