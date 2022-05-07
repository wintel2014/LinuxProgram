all : MemoryRingBuffer2 ConcurrentMemoryRingBuffer2
MemoryRingBuffer2: MemoryRingBuffer2.cpp bitop.hpp
	g++ $< -march=skylake  -o $@ -std=c++17  -g3 -O3 -I.
ConcurrentMemoryRingBuffer2: ConcurrentMemoryRingBuffer2.cpp bitop.hpp
	g++ $< -march=skylake  -o $@ -std=c++17  -g3 -O3 -I. -lpthread
clean:
	rm -f MemoryRingBuffer2 ConcurrentMemoryRingBuffer2 
