all : MemoryRingBuffer2 ConcurrentMemoryRingBuffer2 bit_test 
MemoryRingBuffer2: MemoryRingBuffer2.cpp bitop.hpp
	g++ $< -march=skylake  -o $@ -std=c++17  -g3 -O3 -I.
ConcurrentMemoryRingBuffer2: ConcurrentMemoryRingBuffer2.cpp bitop.hpp
	g++ $< -march=skylake  -o $@ -std=c++17  -g3 -O3 -I. -lpthread
bit_test : bit.cpp
	gcc bit.cpp -g3 -march=skylake -o $@
clean:
	rm -f MemoryRingBuffer2 ConcurrentMemoryRingBuffer2 bit_test
