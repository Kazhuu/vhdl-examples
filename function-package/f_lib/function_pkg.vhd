library ieee;
use ieee.std_logic_1164.all;


package function_pkg is
	function hello return string;

	function hello_for
		(first_name : string; last_name : string)
		return string;
end package;


package body function_pkg is
	-- Function body without parameters and declarative part.
	function hello return string is
	begin
		return "Hello World";
	end function;

	-- Function call with parameters and declarative part.
	function hello_for
		(first_name : string; last_name : string)
	return string is
		constant greeting : string := "Hello ";
	begin
		return greeting & first_name & " " & last_name;
	end function;
end package body;
