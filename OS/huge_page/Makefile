hugepage:  hugepage.cpp
	g++ $^ -o $@_THP -g3 -DUSE_THP
	g++ $^ -o $@_HUGETLB -g3 

HUGEPAGE_RESERVED_TOTOAL=$(shell cat /proc/sys/vm/nr_hugepages)
HUGEPAGE_USED=$(shell echo ${HUGEPAGE_RESERVED_TOTOAL}-4 | bc)

CPU_MHZ=$(shell $${PWD}/CPU_MHZ.sh)
run:hugepage
	cat /sys/kernel/mm/transparent_hugepage/enabled
	@echo "=======================HUGETLB======================="
	./hugepage_HUGETLB ${HUGEPAGE_USED}
	@echo "=======================THP======================="
	./hugepage_THP ${HUGEPAGE_USED}


perf:perf.cpp
	g++ $^ -o $@_NO_HUGEPAGE -DNO_HUGEPAGE
	g++ $^ -o $@_HUGEPAGE
	./$@_NO_HUGEPAGE ${HUGEPAGE_RESERVED_TOTOAL} ${CPU_MHZ}
	./$@_HUGEPAGE ${HUGEPAGE_RESERVED_TOTOAL} ${CPU_MHZ}

clean:
	rm -f perf_HUGEPAGE perf_NO_HUGEPAGE hugepage_HUGETLB hugepage_THP
