# Simple adding CPU
This simple CPU is based on [Von
Neuman](https://en.wikipedia.org/wiki/Von_Neumann_architecture) architecture.
CPU is a modified example from a book: VHDL: Modular Design and Synthesis of
Cores and Systems on pages 322-334.

Implementation is simple adding CPU with four opcodes **load**, **add**, **store**,
**jump** and three registers: accumulator (AC), program counter (PC) and instruction
register (IR). Implementation is missing memory but testbench is used to verify
that the CPU is working correctly.
