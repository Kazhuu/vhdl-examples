library ieee;
use ieee.std_logic_1164.all;


entity test is
end entity;


-- This example is based on the book VHDL: Modular Design and Synthesis of Cores
-- and Systems on pages 232-233.
architecture tb of test is

    signal end_simulation : boolean := true;
    signal waveform : std_logic := '0';
    signal target1, target2, target3 : std_logic := '0';

begin

    -- Inertial delay, inertial keyword is optional.
    -- Pulses on waveform less then 5 ns will be rejected and does not appear
    -- on target1. Pulses 5 ns or above will appear on target1.
    target1 <= waveform after 5 ns;

    -- Inertial delay with reject.
    -- Pulses on waveform that are larger than 3 ns will appear on target2 with
    -- 5 ns. delay. If pulse width is exactly 3 ns, it will be rejected.
    target2 <= reject 3 ns inertial waveform after 5 ns;

    -- Transport delay.
    -- Pulses on waveform will appear on target3 delayed by 5 ns. target3 is
    -- exactly like waveform signal but delayed.
    target3 <= transport waveform after 5 ns;

    -- Create waveform with positive and negative pulses of 5 ns, 4 ns, 3 ns, and 2 ns
    -- that are distanced by 6 ps pulse inbetween.
                -- 1, 5, 6, 4,
    waveform <= '1' after 1 ns, '0' after 6 ns, '1' after 12 ns, '0' after 16 ns,
                -- 6, 3, 6, 2,
                '1' after 22 ns, '0' after 25 ns, '1' after 31 ns, '0' after 33 ns,
                -- 6, 6, 5, 6,
                '1' after 39 ns, '0' after 45 ns, '1' after 50 ns, '0' after 56 ns,
                -- 4, 6, 3, 6,
                '1' after 60 ns, '0' after 66 ns, '1' after 69 ns, '0' after 75 ns,
                -- 2, 6
                '1' after 77 ns, '0' after 83 ns;

    end_simulation <= false after 83 ns;
    assert end_simulation
    report "simulation ended"
    severity failure;

end architecture;
