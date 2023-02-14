all:
	nasm boot2.asm -o boot2.bin

run: 
	qemu-system-x86_64 --drive format=raw,file=boot2.bin
