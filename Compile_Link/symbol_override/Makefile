CFLAGS := -g3
all: test libfoodlopen.so
test: main.o t2.o libfoo.so
	gcc -o test main.o t2.o -L. -lfoo -Wl,--rpath=./ -no-pie -g3 -ldl

libfoo.so: foo.c
	gcc -shared -fPIC -o libfoo.so foo.c -g3
libfoodlopen.so: foodlopen.c
	gcc -shared -fPIC -o libfoodlopen.so $^ -g3
 
main.o: main.c
t2.o: t2.c
 
debug:
	nm -aC libfoo.so  | grep ' b'
	nm -aC libfoodlopen.so  | grep ' b'
	nm -aC  test | grep ' b'

.PHONY:clean
clean:
	rm -f *.o *.so test*
