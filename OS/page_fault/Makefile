all:read_zero_pfn madvise
read_zero_pfn: read_zero_pfn.cpp
	g++ $^  -std=c++11 -g3 -o $@

madvise : madvise.cpp
	g++ $^  -DDROP_PM_IMMEDIATELY -std=c++11 -g3 -o $@_DONNEED
	g++ $^  -std=c++11 -g3 -o $@_FREE

clean:
	rm read_zero_pfn
