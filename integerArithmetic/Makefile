icalc:icalc.o
	gcc icalc.o -o icalc -no-pie
icalc.o:icalc.asm
	nasm -f elf64 -g -F  dwarf icalc.asm -l icalc.lst

.PHONY:clean
clean:
	rm icalc icalc.o icalc.lst