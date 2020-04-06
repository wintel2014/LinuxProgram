#include <string.h>
#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>


/*
all the page-fault triggered by READ will be pointed to the same special page. i.e READ page-fault can't allocate more physical memory

if (!(flags & FAULT_FLAG_WRITE)) {
    entry = pte_mkspecial(pfn_pte(my_zero_pfn(address),
*/

//static int do_anonymous_page(struct mm_struct *mm, struct vm_area_struct *vma,
//        unsigned long address, pte_t *page_table, pmd_t *pmd,
//        unsigned int flags)
//{
//    struct page *page;
//    spinlock_t *ptl;
//    pte_t entry;
//
//    pte_unmap(page_table);
//
//    /* Check if we need to add a guard page to the stack */
//    if (check_stack_guard_page(vma, address) < 0)
//        return VM_FAULT_SIGBUS;
//
//    /* Use the zero-page for reads */
//    if (!(flags & FAULT_FLAG_WRITE)) {
//        entry = pte_mkspecial(pfn_pte(my_zero_pfn(address),
//                        vma->vm_page_prot));
//        page_table = pte_offset_map_lock(mm, pmd, address, &ptl);
//        if (!pte_none(*page_table))
//            goto unlock;
//        goto setpte;
//    }
//
//    /* Allocate our own private page. */
//    if (unlikely(anon_vma_prepare(vma)))
//        goto oom;
//    page = alloc_zeroed_user_highpage_movable(vma, address);
//    if (!page)

void SumAllPage(size_t& ret, size_t* addr)
{
    constexpr int pageSize = 4096;
    for(auto off=0; off<pageSize/sizeof(ret); off++)
        ret += addr[off];
}

constexpr size_t LEN = 2l*1024*1024*1024;
int main()
{
    char * addr = static_cast<char*> (malloc(LEN));

    size_t data = 0;
    for(auto index=0; index<LEN; index+=4096)
    {
#ifdef ALLOC_PHYSICAL_MEM
        addr[index] = 0;
#endif
        SumAllPage(data, reinterpret_cast<size_t*>(addr+index));
    }

    printf("All the data in %ld bytes, are sum as %ld\n",LEN, data);

    auto fd = open("/proc/self/status", O_RDONLY);
    if(fd<0)
    {
        printf("Failed to open /proc/self/status\n");
        return -1;
    }

    
    char buf[2048];
    memset(buf, sizeof(buf), '\0');
    read(fd, buf, sizeof(buf));
    printf("%s\n", buf);
    while(1)
        usleep(100*1000);
    
}
