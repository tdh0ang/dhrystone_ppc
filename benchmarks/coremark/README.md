# CoreMark Benchmark Compilation for PowerPC

## General Information
CoreMark's primary goals are simplicity and providing a method for testing only a processor's core features. For more information about EEMBC's comprehensive embedded benchmark suites, please see www.eembc.org (taken from https://github.com/eembc/coremark). 

CoreMark intends to be the successor of Dhrystone, by improving on certain aspects, where Dhrystone did not perform well. More on that can be found here: https://www.eembc.org/coremark.

## How it works
The process is fairly simple, since CoreMark already provides everything for compilation and running. When calling make, the program should compile for the architecture the current system is based on. For our case, this is not important, as we want to cross-compile. 

To do that, since the PPC environment is based on linux, the contents of the linux folder are copied to another folder called powerpc. Then, the core_portme.mak is adjusted to point to our cross compiler and the correct flags are passed as well. To actually compile, call "make PORT_DIR=powerpc", so it knows that there is a different config to be used for compilation. The output is a file called coremark.exe.

## How to use the benchmark
tbd