package procedure_pkg is

	procedure hello (signal target : out string);

end package;


package body procedure_pkg is

	procedure hello (signal target : out string) is
	begin
		target <= "hello from package";
	end procedure;

end package body;
