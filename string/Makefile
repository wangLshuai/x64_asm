target:move_strings strings

move_strings:move_strings.o
	gcc move_strings.o -o move_strings -no-pie
move_strings.o:move_strings.asm
	nasm -f elf64 -g -F dwarf move_strings.asm -l move_strings.lst

strings:strings.o
	gcc strings.o -o strings -no-pie
strings.o:strings.asm
	nasm -f elf64 -g -F dwarf strings.asm -l strings.lst

.PHONY:clean
clean:
	rm move_strings strings  *.o *.lst