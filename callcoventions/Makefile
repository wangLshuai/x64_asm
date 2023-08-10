function:function5 function6

function5:function5.o
	gcc function5.o -o function5 -no-pie
function5.o:function5.asm
	nasm -f elf64 -g -F dwarf function5.asm -l function5.lst

function6:function6.o
	gcc function6.o -o function6 -no-pie
function6.o:function6.asm
	nasm -f elf64 -g -F dwarf function6.asm -l function6.lst

.PHONY:clean
clean:
	rm function5 function5.o function5.lst function6 function6.o function6.lst