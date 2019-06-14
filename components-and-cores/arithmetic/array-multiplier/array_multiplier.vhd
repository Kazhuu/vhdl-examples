library ieee;
use ieee.std_logic_1164.all;


entity array_multiplier is
    port(
        x_in : in std_logic_vector;
        y_in : in std_logic_vector;
        result_out : out std_logic_vector
    );
end entity;


architecture rtl of array_multiplier is
    type std_logic_2d_t is array (x_in'length downto 0, y_in'length downto 0) of std_logic;

    signal xi, yi, pi, ci : std_logic_2d_t;
begin
    rows: for i in x_in'range generate
        cols: for j in y_in'range generate
            cell: entity work.bit_multiplier port map(
                xi(i, j), yi(i, j), pi(i, j+1), ci(i, j),
                xi(i, j+1), yi(i+1, j), pi(i+1, j), ci(i, j+1)
            );
        end generate;
    end generate;


    right_and_left_side: for i in x_in'range generate
        xi(i, 0) <= x_in(i);
        ci(i, 0) <= '0';
        pi(i+1, y_in'length) <= ci(i, y_in'length);
    end generate;

    top_and_bottom_side: for i in y_in'range generate
        yi(0, i) <= y_in(i);
        pi(0, i+1) <= '0';
        result_out(i) <= pi(i+1, 0);
        result_out(i+y_in'length) <= pi(y_in'length, i);
    end generate;

    assert result_out'length = x_in'length + y_in'length
    report "result_out'length(" & integer'image(result_out'length) & ") must be equal x_in'lenght("
        & integer'image(x_in'length) & ") + y_in'length(" & integer'image(y_in'length) & ")"
    severity failure;


end architecture;
