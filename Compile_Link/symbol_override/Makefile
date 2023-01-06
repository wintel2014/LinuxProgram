CFLAGS := -g3
test: main.o t2.o
	gcc -shared -fPIC -o libfoo.so foo.c -g3
	gcc -o test main.o t2.o -L. -lfoo -Wl,--rpath=./ -no-pie -g3
 
main.o: main.c
t2.o: t2.c
 
.PHONY:clean
clean:
	rm -f *.o *.so test*
