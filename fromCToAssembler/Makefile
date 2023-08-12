fromc:fromc.o rect.o circle.o sreverse.o asum.o adouble.o
	gcc rect.o circle.o sreverse.o asum.o adouble.o fromc.o -o fromc -no-pie
fromc.o:fromc.c
	gcc -g -O0 -c fromc.c
rect.o:../externFunction/rect.asm
	nasm -f elf64 -g -F dwarf ../externFunction/rect.asm -o rect.o
circle.o:../externFunction/circle.asm
	nasm -f elf64 -g -F dwarf ../externFunction/circle.asm -o circle.o
sreverse.o:sreverse.asm
	nasm -f elf64 -g -F dwarf sreverse.asm -l sreverse.lst
asum.o:asum.asm
	nasm -f elf64 -g -F dwarf asum.asm -l asum.lst
adouble.o:adouble.asm
	nasm -f elf64 -g -F dwarf adouble.asm -l adouble.lst
.PHONY:clean
clean:
	rm fromc *.o *.lst