file:file.o
	gcc file.o -o file -no-pie
file.o:file.asm
	nasm -f elf64 -g -F dwarf file.asm -l file.lst

.PHONY:clean
clean:
	rm file file.o file.lst