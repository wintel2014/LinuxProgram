test:test.c mov.o
	gcc $^ -o $@ -g3
mov.o:mov.S
	gcc -c $< -o $@ -g3

clean:
	rm -f  mov.o test
