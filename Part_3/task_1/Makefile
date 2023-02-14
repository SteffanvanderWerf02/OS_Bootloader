all:
	nasm -f elf32 boot4.asm -o boot4.o
	i386-elf-_g++ x86_64-elf-g++ -m64 kmain.cpp boot4.o -o kernel.bin -nostdlib -ffreestanding -std=c++11 -mno-red-zone -fno-exceptions -nostdlib -fno-rtti -Wall -Wextra -Werror -T linker.ld
run: 
	qemu-system-x86_64 -fda kernel.bin