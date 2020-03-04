main:
	g++ -fpic -c static.cpp -std=c++14
	ar crs libstatic.a static.o
	g++ -shared -fpic dynamic.cpp -o libdynamic.so -L. -lstatic -std=c++14
	g++ -c main.cpp
	g++ -Wl,-rpath=./ -L. main.o -ldynamic -lstatic -o main1
	g++ -Wl,-rpath=./ -L. main.o -lstatic -ldynamic -o main2
	g++ -L. -ldynamic -lstatic main.o -o main

clean:
	rm main1 main2 *.o *.so
