#! /bin/bash

CC="../../toolchain/toolchain/bin/powerpc-buildroot-linux-uclibcspe-gcc"
FLAGS="-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -mabi=spe -mfloat-gprs=double -Wa,-me500x2 -O2 -g0"

$CC -c -Wall paranoia.c
if [ $? -ne 0 ]; then
  echo "Compile error."
  exit
fi

$CC $FLAGS paranoia.o -lm -o paranoia
if [ $? -ne 0 ]; then
  echo "Load error."
  exit
fi

rm paranoia.o

echo "Normal end of execution."
