function4:function4.o circle.o rect.o
	gcc circle.o rect.o function4.o -o function4 -no-pie
function4.o:function4.asm
	nasm -f elf64 -g -F dwarf function4.asm -l function4.lst
circle.o:circle.asm
	nasm -f elf64 -g -F dwarf circle.asm -l circle.lst
rect.o:rect.asm
	nasm -f elf64 -g -F dwarf rect.asm -l rect.lst

.PHONY:clean
clean:
	rm function4 function4.o function4.lst circle.o circle.lst rect.o rect.lst