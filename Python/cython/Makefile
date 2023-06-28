#  -2                             Compile based on Python-2 syntax and code semantics.
#  -3                             Compile based on Python-3 syntax and code semantics.

test: main.py mymodule.so
	./main.py

mymodule.so : mymodule.o
	gcc mymodule.o -fPIC -shared -o mymodule.so

mymodule.o : mymodule.c
	g++ -c mymodule.c -I/usr/include/python3.8/ -lpython3.8 -fPIC

mymodule.c : mymodule.pyx
	cython -3 $^

clean:
	rm -f mymodule.o.* mymodule.c mymodule.o mymodule.so
