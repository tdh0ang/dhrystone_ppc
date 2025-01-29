# Whetstone Benchmark Compilation for PowerPC

## General Information
The Whetstone benchmark primarily measures the floating-point arithmetic performance. It was first written in ALGOL 60 in 1972 at the Technical Support Unit of the Department of Trade and Industry (later part of the Central Computer and Telecommunications Agency) in the United Kingdom (see https://en.wikipedia.org/wiki/Whetstone_(benchmark)).

## How it works
Compilation is simple, just call make and it should compile and link the binary for you. 

## How to use
Whetstone requires command line arguments to run. By default it runs 1000 loops. You can specify the count by putting the number directly after:

```bash
./whetstone 2000
```

This would specify 2000 loops. There is also an additional flag, which is `-c` and is used as followed:

```bash
./whetstone -c
```

This runs the benchmark continuously until you stop the execution. You can also specify the loop count with the `-c` flag:

```bash
./whetstone -c 2000
```

This would run the benchmark continuously, while one iteration is 2000 loops.
