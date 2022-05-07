APPs := observer_pattern MemoryRingBuffer ConcurrentMemoryRingBuffer
all : $(APPs)

CPPFLAGS= -g3 -O3 -DNDEBUG -std=c++17
observer_pattern : observer_pattern.cpp
	g++ $(CPPFLAGS) $^  -o $@

MemoryRingBuffer:MemoryRingBuffer.cpp
	g++ $(CPPFLAGS) $^  -o $@
ConcurrentMemoryRingBuffer:ConcurrentMemoryRingBuffer.cpp
	g++ $(CPPFLAGS) -DBENCHMARK_LATENCY $^  -o $@ -lpthread

clean:
	rm -f $(APPs)
