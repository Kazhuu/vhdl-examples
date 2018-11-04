library f_lib;
use f_lib.function_pkg.all;


entity test is
end;


architecture tb of test is

	constant FIRST_NAME : string := "Jon";
	constant LAST_NAME : string := "Snow";

	signal print : boolean := true;
	signal end_simulation : boolean := true;

begin

	print <= false after 1 ps;
	end_simulation <= false after 2 ps;

	-- Hello World
	assert print report "hello() result: " & hello
	severity note;

	-- Hello Jon Snow
	assert end_simulation report "hello_for() result: " & hello_for(FIRST_NAME, LAST_NAME)
	severity failure;

end tb;
