all:
	nasm boot1.asm -o boot1.bin

run: 
	qemu-system-x86_64 --drive format=raw,file=boot1.bin
