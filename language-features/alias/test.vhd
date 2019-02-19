library ieee;
use ieee.std_logic_1164.all;


entity test is
end entity;


architecture tb of test is

    signal end_simulation : boolean := true;


    -- Register with some status flags.
    signal flags : std_logic_vector(3 downto 0) := "0101";

    -- Each bit of the register can be assigned individually.
    alias a_flag : std_logic is flags(3);
    alias b_flag : std_logic is flags(2);
    alias c_flag : std_logic is flags(1);
    alias d_flag : std_logic is flags(0);

    -- Alias two status bits at the same time.
    alias ab_flag : std_logic_vector(1 downto 0) is flags(3 downto 2);

begin

    c_flag <= '1' after 1 ps;   -- Assign one flag.
    ab_flag <= "00" after 2 ps; -- Assign two flags.

    end_simulation <= false after 5 ps;
    assert end_simulation
    -- flags(abcd): '0''0''1''1'
    report "flags(abcd): " & std_logic'image(a_flag) & std_logic'image(b_flag) &
        std_logic'image(c_flag) & std_logic'image(d_flag)
    severity failure;

end architecture;
