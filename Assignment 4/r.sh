#/bin/bash

#Program name "Random Array Sorter"
#Author: Hunter Tran
#Author section: 240-03
#Author CWID: 886474907
#Author email: huntertran@csu.fullerton.edu
#This file is the script file that accompanies the "Random Array Sorter" program.
#Prepare for execution in normal mode (not gdb mode).

#Delete some un-needed files
rm *.o
rm *.out

echo "Assemble the source file executive.asm"
nasm -f elf64 -l executive.lis -o executive.o executive.asm

echo "Assemble the source file fill_random_array.asm"
nasm -f elf64 -l fill_random_array.lis -o fill_random_array.o fill_random_array.asm

echo "Assemble the source file normalize_array.asm"
nasm -f elf64 -l normalize_array.lis -o normalize_array.o normalize_array.asm

echo "Assemble the source file show_array.asm"
nasm -f elf64 -l show_array.lis -o show_array.o show_array.asm

echo "Assemble the source file isnan.asm"
nasm -f elf64 -l isnan.lis -o isnan.o isnan.asm

echo "Compile the source file sort.cpp"
g++  -m64 -Wall -fno-pie -no-pie -o sort.o -std=c++17 -c sort.cpp

echo "Compile the source file main.c"
gcc  -m64 -Wall -no-pie -o main.o -std=c2x -c main.c

echo "Link the object modules to create an executable file"
g++  -m64 -no-pie -o assignment4.out main.o executive.o fill_random_array.o normalize_array.o show_array.o isnan.o sort.o -std=c2x -Wall -z noexecstack 

echo "Execute the Assignment 4 program"
chmod +x assignment4.out
./assignment4.out

echo "This bash script will now terminate."
