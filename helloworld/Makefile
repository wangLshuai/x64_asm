hello: hello.o
	gcc hello.o -o hello
hello.o: hello.asm
	nasm -f elf64 -g -F dwarf hello.asm -l hello.lst

.PHONY: clean

clean:
	rm hello hello.lst hello.o