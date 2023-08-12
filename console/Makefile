cosnole:console1 console2

console1:console1.o
	gcc console1.o -o console1 -no-pie
console1.o:console1.asm
	nasm -f elf64 -g -F  dwarf console1.asm -l console1.lst

console2:console2.o
	gcc console2.o -o console2 -no-pie
console2.o:console2.asm
	nasm -f elf64 -g -F dwarf console2.asm -l console2.lst

.PHONY:clean
clean:
	rm console1 console1.o console1.lst console2 console2.o console2.lst