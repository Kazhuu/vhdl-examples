library ieee;
use ieee.std_logic_1164.all;


entity stable_and_event is
end entity;


architecture tb of stable_and_event is

    signal test : std_logic := '1';
    signal d : std_logic := '1';
    signal qf, ql : std_logic;
    signal end_simulation : boolean := true;

begin

    test <= '0' after 0 ps;
    d <= '0' after 1 ps;

    -- This block will produce falling edge detected flip-flop.
    -- When d changes to '0' at 1 ps, qf will stay at it's old value.
    -- This happens because test'stable returns signal which will evaluate
    -- block statement to false on very next simulation cycle. This will make
    -- qf disconnected from d.
    ff: block (test = '0' and not test'stable)
    begin
        qf <= guarded d;
    end block;

    -- This block will produce level sensitive latch.
    -- When d changes to '0' at 1 ps, ql will also be driven by d and changes
    -- in d are propagated to ql as long as test stays low. This happens because test'event
    -- returns value and not signal. On next simulation cycle test'event will evaluate to false,
    -- but because it's a value. It will not make block statement to re-evaluate. ql will become
    -- disconnected from d only when test is high.
    fl: block (test = '0' and test'event)
    begin
        ql <= guarded d;
    end block;

    end_simulation <= false after 2 ps;
    assert end_simulation
    report "end simulation"
    severity failure;

end architecture;
