aligned:aligned.o
	gcc aligned.o -o aligned -no-pie
aligned.o:aligned.asm
	nasm -f elf64 -g -F dwarf aligned.asm -l aligned.lst

.PHONY:clean
clean:
	rm aligned aligned.o aligned.lst