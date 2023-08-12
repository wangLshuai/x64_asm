cmdline:cmdline.o
	gcc cmdline.o -o cmdline -no-pie
cmdline.o:cmdline.asm
	nasm -f elf64 -g -F dwarf cmdline.asm -l cmdline.lst

.PHONY:clean
clean:
	rm cmdline cmdline.o cmdline.lst