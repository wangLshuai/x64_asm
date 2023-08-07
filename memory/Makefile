memory:memory.o
	gcc memory.o -o memory -no-pie
memory.o:memory.asm
	nasm -f elf64 -g -F dwarf memory.asm -l memory.lst

.PHONY:clean
clean:
	rm memory.lst memory.o memory