# VHDL examples

Repository to contain my VHDL examples for different topics. Topics are organized in subfolders.

## How to use

Examples can be compiled for ModelSim with [hdlcc](https://github.com/suoto/hdlcc/wiki).
This Python backend is automatically used with [vim-hdl](https://github.com/suoto/vim-hdl) Vim plugin.

Vim needs to be started in example folder with VHDL source file.
```
vim test.vhd
```
Then the plugin searches for `msim.prj` in the same folder and compiles the sources according to it. All compiled code is then placed in the `.build` subfolder. In this subfolder ModelSim can be started and it should read all compiled code and libraries without errors.
```
cd .build/
vsim &
```
In ModelSim open `test.vhd` file under `work` library. Testbench can be run with ModelSim console.
```
run 10 ns
```
