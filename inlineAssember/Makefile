inline:inline1 inline2

inline1:inline1.c
	gcc inline1.c -g -o inline1 -masm=intel -no-pie
inline2:inline2.c
	gcc inline2.c -g -o inline2 -masm=intel -no-pie

.PHONY:clean
clean:
	rm inline1 inline2