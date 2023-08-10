macro:macro.o
	gcc macro.o -o macro -no-pie
macro.o:macro.asm
	nasm -f elf64 -g -F dwarf macro.asm -l macro.lst

.PHONY:clean
clean:
	rm macro macro.o macro.lst