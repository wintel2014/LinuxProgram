CFLAGS = -DCORES=4 -O3 -g3 -DNDEBUG
http : main.cpp *.hpp util.o
	g++ $(CFLAGS) $< util.o -pthread -o $@

util.o: util.cpp util.hpp
	g++ $(CFLAGS) -c $< -o $@ 

clean:
	rm -f http util.o
