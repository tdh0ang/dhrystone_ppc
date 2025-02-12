# Compiler and flags
CC = ../../toolchain/toolchain/bin/powerpc-buildroot-linux-uclibcspe-gcc
CFLAGS = -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -mabi=spe -mfloat-gprs=double -Wa,-me500x2 -O2 -g0
LDFLAGS = -lm

# Find all C source files in the current directory
SRC = $(wildcard *.c)

# Replace .c with .o to define the object files
OBJ = $(SRC:.c=.o)

# Replace .c with the target binary name (without extension)
TARGETS = $(SRC:.c=)

# Default target (build all binaries)
all: $(TARGETS)

# Rule to compile the object files
%.o: %.c
	$(CC) -c $(CFLAGS) $< -o $@
	@echo "Compiled: $<"

# Rule to build the executables from object files
%: %.o
	$(CC) $(CFLAGS) $< $(LDFLAGS) -o $@
	@echo "Build successful: $@"
	@rm -f $<

# Clean up
clean:
	rm -f $(OBJ) $(TARGETS)
	@echo "Cleaned up."

# Add a phony target for clean to prevent conflicts with files named 'clean'
.PHONY: all clean

