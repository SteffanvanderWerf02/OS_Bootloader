all:
	nasm hello.asm -o hello.bin

run: 
	qemu-system-x86_64 --drive format=raw,file=hello.bin
