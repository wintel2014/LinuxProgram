//https://www.kernel.org/doc/html/latest/admin-guide/mm/transhuge.html
//In certain cases when hugepages are enabled system wide, application may end up allocating more memory resources. 
//An application may mmap a large region but only touch 1 byte of it, in that case a 2M page might be allocated instead of a 4k page for no good. This is why it’s possible to disable hugepages system-wide and to only have them inside MADV_HUGEPAGE madvise regions.

#include "../../Utils/readTsc.hpp"
#include <vector>
#include <iostream>

#include <unistd.h>
#include <stdlib.h>
#include <string.h>
#include <stdio.h>
#include <sys/mman.h>
#include <errno.h>

/*
Only vma range > HPAGE_PMD_MASK, it's possible to try THP on v3.6

https://elixir.bootlin.com/linux/v3.6/source/mm/huge_memory.c#L699

int do_huge_pmd_anonymous_page(struct mm_struct *mm, struct vm_area_struct *vma,
			       unsigned long address, pmd_t *pmd,
			       unsigned int flags)
{
	struct page *page;
	unsigned long haddr = address & HPAGE_PMD_MASK;
	pte_t *pte;

	if (haddr >= vma->vm_start && haddr + HPAGE_PMD_SIZE <= vma->vm_end) {
        .......
		page = alloc_hugepage_vma(transparent_hugepage_defrag(vma),
					  vma, haddr, numa_node_id(), 0);
		if (unlikely(!page)) {
			count_vm_event(THP_FAULT_FALLBACK); // cat /proc/vmstat  | grep thp
			goto out;
		}
		count_vm_event(THP_FAULT_ALLOC);


V5.3
https://elixir.bootlin.com/linux/v5.3/source/include/linux/huge_mm.h#L126
static inline bool transhuge_vma_suitable(struct vm_area_struct *vma,
		unsigned long haddr)
{
	//Don't have to check pgoff for anonymous vma 
	if (!vma_is_anonymous(vma)) {
		if (((vma->vm_start >> PAGE_SHIFT) & HPAGE_CACHE_INDEX_MASK) !=
			(vma->vm_pgoff & HPAGE_CACHE_INDEX_MASK))
			return false;
	}

	if (haddr < vma->vm_start || haddr + HPAGE_PMD_SIZE > vma->vm_end)
		return false;
	return true;
}
*/


int main(int argc, char* argv[])
{
    if(argc <2)
    {
        printf("Input Page count\n");
        return -1;
    }
    
    size_t pages = atoi(argv[1]);
    size_t LEN = pages*4096;
    std::vector<long> durationVec(pages, 0);

    char* addr  = static_cast<char*>(mmap(nullptr, LEN, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, 0, 0));
    if (addr == MAP_FAILED)
    {
        printf("Failed to mmap:%s\n", strerror(errno));
        return -1;
    }

#ifdef USE_THP
    if(madvise(addr, LEN, MADV_HUGEPAGE) <0)
#else
    if(madvise(addr, LEN, MADV_NOHUGEPAGE) <0)
#endif
    {
        printf("Failed to madvise:%s\n", strerror(errno));
        return -1;
    }

    for(auto off=0; off<LEN; off+=4096)
    {
        auto start = readTsc();
        addr[off] = 1; 
        durationVec[off/4096] = readTsc()-start;
    }

    size_t sum = 0;
    bool isTHB = false;
    for(auto &iter : durationVec)
    {
        if(iter > 1000000)
            isTHB = true;
    }
    if (isTHB)
    {
        auto currentAddr = addr;
        for(auto &iter : durationVec)
        {
#if 0
            //The previous page adjacent to the new page has been allocated as normal page, there is no way to combine them together as an HUGE Page
            //Only the address in the same 2M vma range can be tried with huge page when page fault.
            printf("%p:", currentAddr);
#endif
            currentAddr += 4096;
            sum += iter;
            std::cout<<iter<<" ";
        }
        printf("\nBegin Addr:%p ", addr);
        std::cout<<"Total cycles:"<<sum<<" Average:"<<sum/pages<<"\n";
    }
#if 0
    printf("sleep 5 seconds\n");
    usleep(5*1000*1000);
#endif
}
