library p_lib;
-- "use p_lib.procedure_pkg.all;" also works.
use p_lib.procedure_pkg.hello;


entity test is
end;


architecture tb of test is

	signal hello_result : string(1 to 18);
	signal end_simulation : boolean := true;

begin

	-- Procedure will be called once beginning of simulation.
	hello(hello_result); -- "hello from package"

	end_simulation <= false after 1 ps;

	assert end_simulation
	report "hello() result: " & hello_result
	severity failure;

end architecture;
