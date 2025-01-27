# Dhrystone Benchmark Compilation for PowerPC

## General Information
Dhrystone is a computing benchmark for integer programming, while its counterpart, Whetstone tests the floating point performance. This benchmark is used to test CPU performance. For an ongoing project this benchmark is needed, specifically for the PowerPC (PPC) architecture. This process is not as easy as expected, so this repo tries to facilitate the compilation process of this fairly old benchmark. 

## How it works
The dhrystone file can be downloaded here: https://www.netlib.org/benchmark/dhry-c. It is intended to give it execution permissions and then execute the file. This essentially splits the files into several text files, as well as the source files: dhry_1.c, dhry_2.c and dhry.h. For PPC some patches are needed, I copied those from the buildroot config, which essentially does the same thing. Compiling for PPC only works with these patches!!

You do not need to execute the file, only give it the permissions. Calling make will do everything for you. What make does here is to put compilation related files into the build directory and the source files into the src directory, while keeping the executable "dhrystone" in the main directory. This should be it. 

## Cross Compilation
tbd

