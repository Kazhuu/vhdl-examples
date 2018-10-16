library f_lib;
use f_lib.function_pkg.all;


entity test is
end;


architecture tb of test is
	constant FIRST_NAME : string := "Jon";
	constant LAST_NAME : string := "Snow";
begin
	assert false report "hello() result: " & hello
	severity note;

	assert false report "hello_for() result: " & hello_for(FIRST_NAME, LAST_NAME)
	severity note;
end tb;
