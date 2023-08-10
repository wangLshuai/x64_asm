
bits:bits1 bits3

bits1:bits1.o printb.o
	gcc bits1.o printb.o -o bits1 -no-pie
bits1.o:bits1.asm
	nasm -f elf64 -g -F dwarf bits1.asm -l bits1.lst

bits3:bits3.o printb.o
	gcc bits3.o printb.o -o bits3 -no-pie
bits3.o:bits3.asm
	nasm -f elf64 -g -F dwarf bits3.asm -l bits3.lst
printb.o:printb.c
	gcc -c -g printb.c

.PHONY:clean
clean:
	rm bits1 bits1.o bits1.lst printb.o bits3 bits3.o bits3.lst