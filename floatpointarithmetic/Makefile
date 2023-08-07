fcalc:fcalc.o
	gcc fcalc.o -o fcalc -no-pie
fcalc.o:fcalc.asm
	nasm -f elf64 -g -F dwarf fcalc.asm -l fcalc.lst

.PHONY:clean
clean:
	rm fcalc fcalc.o fcalc.lst