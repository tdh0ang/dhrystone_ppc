# Variables
SPLIT_SCRIPT = ./dhry-c
PATCH_DIR = patches
FILES_TO_PATCH = dhry_1.c dhry.h
PATCHES = $(PATCH_DIR)/0001-cmdline-nruns.patch $(PATCH_DIR)/0002-HZ.patch $(PATCH_DIR)/0003-exit.patch $(PATCH_DIR)/0004-headers.patch $(PATCH_DIR)/0005-prototypes.patch

# Compiler and flags
CC = /home/tdhoang/Documents/Tools/buildroot-2024.02.10/output/host/bin/powerpc-buildroot-linux-uclibcspe-gcc
CFLAGS = -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -mabi=spe -mfloat-gprs=double -Wa,-me500x2 -O2 -g0 -DNO_PROTOTYPES=1 -DHZ=100
LDFLAGS = -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -mabi=spe -mfloat-gprs=double -Wa,-me500x2 -O2 -g0 -o dhrystone $(BUILD_DIR)/dhry_1.o $(BUILD_DIR)/dhry_2.o -lm

# Build directory
BUILD_DIR = build

# Source directory
SRC_DIR = src

# Target to split, patch, and compile
all: split patch compile

# Target to split the files
split:
	@echo "Splitting files..."
	$(SPLIT_SCRIPT)

# Target to apply patches
patch: $(FILES_TO_PATCH)
	@echo "Applying patches..."
	for patch in $(PATCHES); do \
		patch -p1 < $$patch; \
	done

# Target to compile the source files
compile: dhry_1.c dhry_2.c dhry.h
	@echo "Compiling..."
	@mkdir -p $(BUILD_DIR)
	@mkdir -p $(SRC_DIR)
	$(CC) $(CFLAGS) -c -o $(BUILD_DIR)/dhry_1.o dhry_1.c
	$(CC) $(CFLAGS) -c -o $(BUILD_DIR)/dhry_2.o dhry_2.c
	$(CC) $(LDFLAGS)
	@mv -t build/ dhry_1.c.orig dhry_c.dif 
	@mv -t src/ *.c *.h

# Clean target to remove generated files in the build directory
clean:
	@echo "Cleaning up build..."
	rm -rf $(BUILD_DIR)

cleanall: 
	@echo "Cleaning all..."
	rm -r dhrystone RATIONALE README_C submit.frm VARIATIONS build/ src/
