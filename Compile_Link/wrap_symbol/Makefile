main:main.o malloc.o
	g++ -Wl,--wrap=malloc -o main main.o -lc malloc.o 

malloc.o:malloc.cpp
	g++ -c malloc.cpp -g3

main.o:main.cpp
	g++ -c main.cpp -g3
