library ieee;
use ieee.std_logic_1164.all;


-- Bit multiplier based on the book: VHDL: Modular Design and Synthesis of Cores
-- and Systems on page 307.
entity bit_multiplier is
    port (
        x_in, y_in, p_in, c_in : in std_logic;
        x_out, y_out, p_out, c_out : out std_logic
    );
end entity;


architecture rtl of bit_multiplier is
    signal xy : std_logic;
begin
    xy <= x_in and y_in;
    c_out <= (p_in and xy) or (p_in and c_in) or (xy and c_in);
    p_out <= p_in xor xy xor c_in;
    -- Wire inputs bits right to output bits for chaining.
    x_out <= x_in;
    y_out <= y_in;
end architecture;
