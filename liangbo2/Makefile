all : MemoryRingBuffer2 bit_test
MemoryRingBuffer2: MemoryRingBuffer2.cpp
	g++ MemoryRingBuffer2.cpp  -march=skylake -o $@ -std=c++17  -g3 -O3 -I.
bit_test : bit.cpp
	gcc bit.cpp -g3 -march=skylake -o $@
clean:
	rm -f MemoryRingBuffer2 bit_test
