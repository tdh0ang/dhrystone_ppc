# CoreMark Benchmark Compilation for PowerPC

## General Information
CoreMark's primary goals are simplicity and providing a method for testing only a processor's core features. For more information about EEMBC's comprehensive embedded benchmark suites, please see www.eembc.org (taken from https://github.com/eembc/coremark). 

CoreMark intends to be the successor of Dhrystone, by improving on certain aspects, where Dhrystone did not perform well. More on that can be found here: https://www.eembc.org/coremark.

## How it works
The process is fairly simple, since CoreMark already provides everything for compilation and running. When calling make, the program should compile for the architecture the current system is based on. For our case, this is not important, as we want to cross-compile. 

To do that, since the PPC environment is based on linux, the contents of the linux folder are copied to another folder called powerpc. Then, the core_portme.mak is adjusted to point to our cross compiler and the correct flags are passed as well. To actually compile, call "make PORT_DIR=powerpc", so it knows that there is a different config to be used for compilation. The output is a file called coremark.exe.

## How to use 
To execute coremark, you need to know that it is quite specific, as in it needs seeds to run. You can read it in the `README_CoreMark.md`:


>CoreMark's executable takes several parameters as follows (but only if main() accepts arguments): 1st - A seed value used for initialization of data. 2nd - A seed value used for initialization of data. 3rd - A seed value used for initialization of data. 4th - Number of iterations (0 for auto : default value) 5th - Reserved for internal use. 6th - Reserved for internal use. 7th - For malloc users only, override the size of the input data buffer.


`core_main.c` also gives some more insight as seen below:


>Arguments:
1 - first seed  : Any value
2 - second seed : Must be identical to first for iterations to be identical
3 - third seed  : Any value, should be at least an order of magnitude less then the input size, but bigger then 32.
4 - Iterations  : Special, if set to 0, iterations will be automatically determined such that the benchmark will run between 10 to 100 secs


Some more requirements are also described:


>1. The benchmark needs to run for at least 10 seconds.
>2. All validation must succeed for seeds 0,0,0x66 and 0x3415,0x3415,0x66, buffer size of 2000 bytes total.


Buffer size of 2000 is a default define macro found in `coremark.h`, so you do not need to adjust anything. So, to do the validation according to the documentation, run:

```
./coremark.exe 0 0 0x66 0 
```

This outputs `Correct operation validated. See readme.txt for run and reporting rules. CoreMark 1.0 : 3728.792493 / GCC8.4.0 -O2 -mabi=spe -mfloat-gprs=double -Wa,-me500x2 -g0 -Ipowerpc -DPERFORMANCE_RUN=1  -lrt / Heap` for me, and 

```
./coremark.exe 0x3415 0x3415 0x66 0
```

outputs just `Correct operation validated. See readme.txt for run and reporting rules.`

This is just a brief summary and overview of how it is used. Take it as a quick start guide and reference the `README_CoreMark.md` for a more comprehensive description. 
