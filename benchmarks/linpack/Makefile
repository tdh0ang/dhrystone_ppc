# Compiler
CC = ../../toolchain/toolchain/bin/powerpc-buildroot-linux-uclibcspe-gcc

# Base flags
BASE_CFLAGS = -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -mabi=spe -mfloat-gprs=double -Wa,-me500x2 -O3 -g0
LDFLAGS = -lm

# Target binary
TARGET = linpack

# Source and object files
SRC = linpackc.c
OBJ = linpackc.o

# Precision flags (must choose one)
SINGLE = -DSP
DOUBLE = -DDP

# BLAS rolling flags (must choose one)
ROLLED = -DROLL
UNROLLED = -DUNROLL

# Default target
all:
	@echo "Specify a target: make single-rolled, single-unrolled, double-rolled, or double-unrolled."

# Single precision, rolled BLAS
single-rolled: CFLAGS = $(BASE_CFLAGS) $(SINGLE) $(ROLLED)
single-rolled: build

# Single precision, unrolled BLAS
single-unrolled: CFLAGS = $(BASE_CFLAGS) $(SINGLE) $(UNROLLED)
single-unrolled: build

# Double precision, rolled BLAS
double-rolled: CFLAGS = $(BASE_CFLAGS) $(DOUBLE) $(ROLLED)
double-rolled: build

# Double precision, unrolled BLAS
double-unrolled: CFLAGS = $(BASE_CFLAGS) $(DOUBLE) $(UNROLLED)
double-unrolled: build

# Compilation rules
$(OBJ): $(SRC)
	$(CC) $(CFLAGS) -c -Wall $(SRC) -o $(OBJ)
	@echo "Compiled: $(SRC) with CFLAGS: $(CFLAGS)"

build: $(OBJ)
	$(CC) $(CFLAGS) $(OBJ) $(LDFLAGS) -o $(TARGET)
	@echo "Build successful: $(TARGET)"
	@rm -f $(OBJ)

# Clean up
clean:
	rm -f $(TARGET)
	@echo "Cleaned up."

# Phony targets
.PHONY: all single-rolled single-unrolled double-rolled double-unrolled clean

