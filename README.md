# VHDL examples and components

This repository is my personal study notes and examples of VHDL language and
FPGA hardware design. Various language features are explored with simple
examples and some components are implemented as well. All language examples and
components can be found under their related folders and subfolders. I hope
someone else might find this information also useful.

## Tools used

All code is written using Vim and some plugins. The plugins used are [hdlcc](https://github.com/suoto/hdlcc) and
[vim-hdl](https://github.com/suoto/vim-hdl).  These plugins together provide
syntax checking and automatic compiling for simulation with ModelSim.
Configuration file is named `vimhdl.prj` and Vim needs to be started in the
folder with this file.

All automatically compiled code is placed in the `.build` subfolder. In this
subfolder ModelSim can be started and it should read all compiled code and
libraries without errors. ModelSim can be given with the design to simulate. For
example:
```
cd .build/
vsim work.test
```
Then run example in ModelSim console with `run` and example should print the
results and stop automatically.

Components are tested with [VUnit](https://vunit.github.io/) Python based
testing library.  Repository root includes `Pipfile` which can be used with
[pipenv](https://github.com/pypa/pipenv) to create Python virtual environments
VUnit installed and not populating your system's installation. Virtual environment
installed and activated all tests can be run with `python run.py` at project
root.

## Missing VHDL topics

* Different ways to instantiate a component.
* Qualified expression.
* Configure examples.
* Use of generics.
* Block statements and signal kinds `bus` and `register` and how they behave.
* Shared variable and how to use.
* Different wait statements with process.
* Three main different ways to implement state machines.
* Use VHDL 2008 env package (std.env.finish for instance).
* Reduction operator e.g. `xxx <= and yyy`.
* Example to show that 'work' is not a library but a reference to same library
    where this element is defined (example:
    https://github.com/VUnit/vunit/issues/497).
