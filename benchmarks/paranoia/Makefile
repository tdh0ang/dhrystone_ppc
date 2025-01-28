CC = ../../toolchain/toolchain/bin/powerpc-buildroot-linux-uclibcspe-gcc
CFLAGS = -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -mabi=spe -mfloat-gprs=double -Wa,-me500x2 -O2 -g0
LDFLAGS = -lm

# Target binary
TARGET = paranoia

# Source and object files
SRC = paranoia.c
OBJ = paranoia.o

# Default target
all: $(TARGET)

# Rule to compile the object file
$(OBJ): $(SRC)
	$(CC) -c -Wall $(SRC) -o $(OBJ)
	@echo "Compiled: $(SRC)"

# Rule to build the executable
$(TARGET): $(OBJ)
	$(CC) $(CFLAGS) $(OBJ) $(LDFLAGS) -o $(TARGET)
	@echo "Build successful: $(TARGET)"
	@rm -f $(OBJ)

# Clean up
clean:
	rm -f $(TARGET)
	@echo "Cleaned up."

# Add a phony target for clean to prevent conflicts with files named 'clean'
.PHONY: all clean
