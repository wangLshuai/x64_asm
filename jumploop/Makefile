target:jump jumploop betterloop

jump: jump.o
	gcc jump.o -o jump -no-pie
jump.o: jump.asm
	nasm -f elf64 -g -F dwarf jump.asm -l jump.lst

jumploop:jumploop.o
	gcc jumploop.o -o jumploop -no-pie
jumploop.o:jumploop.asm
	nasm -f elf64 -g -F dwarf jumploop.asm -l jumploop.lst

betterloop:betterloop.o
	gcc betterloop.o -o betterloop -no-pie
betterloop.o:betterloop.asm
	nasm -f elf64 -g -F dwarf betterloop.asm -l betterloop.lst

.PHONY: clean

clean:
	rm jump jump.lst jump.o jumploop jumploop.o jumploop.lst betterloop betterloop.o betterloop.lst