cpu:cpu.o
	gcc cpu.o -o cpu -no-pie
cpu.o:cpu.asm
	nasm -f elf64 -g -F dwarf cpu.asm -l cpu.lst

.PHONY:clean
clean:
	rm cpu *.o *.lst