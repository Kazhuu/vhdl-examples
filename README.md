# VHDL examples

Repository to contain VHDL examples for a different topics. Topics are organized in subfolders.

## How to use

Examples can be compiled for ModelSim with [hdlcc](https://github.com/suoto/hdlcc).
This Python backend is automatically used with [vim-hdl](https://github.com/suoto/vim-hdl) Vim plugin.

Vim needs to be started in example subfolder with VHDL source file or without.
```
vim test.vhd
```
Then the plugin searches for `msim.prj` in the same folder and compiles the sources according to it. All compiled code is then placed in the `.build` subfolder. In this subfolder ModelSim can be started and it should read all compiled code and libraries without errors. ModelSim can be given with the desing to simulate.
```
cd .build/
vsim work.test
```
In VHDL compiled `test.vhd` is located under under `work` library by default. Then run testbench in ModelSim console.
```
run
```
Testbench will run, print results and then stop automatically.
