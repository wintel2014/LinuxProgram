test : main.cpp libbar.so libfoo.a libfoo.so
	g++ main.cpp  -lbar -lfoo -L. -Wl,-rpath=. -o test

libbar.so: bar.cpp bar.hpp
	 g++ -shared -fPIC -o libbar.so bar.cpp 

libfoo.a: foo.cpp foo.hpp
	g++ -c foo.cpp
	ar crv libfoo.a foo.o
libfoo.so: foo.cpp foo.hpp
	g++ -shared -fPIC -o $@ $<

clean:
	rm *.o *.so *.a

