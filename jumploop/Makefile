jump: jump.o
	gcc jump.o -o jump -no-pie
jump.o: jump.asm
	nasm -f elf64 -g -F dwarf jump.asm -l jump.lst

.PHONY: clean

clean:
	rm jump jump.lst jump.o