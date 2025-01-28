#! /bin/bash
#
gcc -c -Wall paranoia.c
if [ $? -ne 0 ]; then
  echo "Compile error."
  exit
fi
#
gcc paranoia.o -lm
if [ $? -ne 0 ]; then
  echo "Load error."
  exit
fi
#
rm paranoia.o
mv a.out ~/binc/paranoia
#
echo "Normal end of execution."
