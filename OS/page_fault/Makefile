all:read_zero_pfn madvise GrabPage
read_zero_pfn: read_zero_pfn.cpp
	g++ $^  -std=c++11 -g3 -o $@

madvise : madvise.cpp
	g++ $^  -DDROP_PM_IMMEDIATELY -std=c++11 -g3 -o $@_DONNEED
	g++ $^  -std=c++11 -g3 -o $@_FREE

GrabPage:GrabPage.cpp
	g++ $< -o $@_NO_THP
	g++ -DUSE_THP $< -o $@_THP

test:GrabPage
	@echo 3 | sudo tee  /proc/sys/vm/drop_caches
	@echo "madvise" | sudo tee  /sys/kernel/mm/transparent_hugepage/enabled
	./GrabPage_NO_THP 2048

	cat /proc/vmstat  | grep thp_ | grep -v ' 0'
	./GrabPage_THP 8192
	cat /proc/vmstat  | grep thp_ | grep -v ' 0'

clean:
	rm -f read_zero_pfn GrabPage_* madvise_*
