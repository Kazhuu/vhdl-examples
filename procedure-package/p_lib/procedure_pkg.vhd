package procedure_pkg is

	-- Procedure declaration.
	procedure hello (signal target : out string);

end package;


package body procedure_pkg is

	-- Procedure definition.
	procedure hello (signal target : out string) is
	begin
		target <= "hello from package";
	end procedure;

end package body;
