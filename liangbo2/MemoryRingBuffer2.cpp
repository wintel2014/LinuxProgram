#include <MemoryRingBuffer2.hpp>
void BasicTest()
{
   
    MemoryRingBuffer mbr;
    printf("size=%ld\n", mbr.size());
    
    std::vector<void*> slotPtrVec;
    for(int i=0; i<1024*16-4; i++)
    {
        slotPtrVec.push_back(mbr.acquire<sizeof(int)>());
    }
    for(auto iter:slotPtrVec)
    {
        mbr.release<32>(iter);
    }
     printf("After allocate-release torture size=%ld\n\n", mbr.size());

    for(int i=0; i<1024*16-1; i++)
    {
        mbr.acquire<sizeof(int)>();
        //printf("size=%ld\n", mbr.size());
    }
    mbr.acquire<sizeof(int)>();
    printf("exhausted all memory :size=%ld empty=%d\n\n", mbr.size(), mbr.empty());     

      
}

void BasicTest2()
{
   
    MemoryRingBuffer mbr;
    constexpr size_t OBJ_SIZE = 65*64;

    std::vector<void*> slotPtrVec;
    for(int i=0; i<102; i++)
    {
        slotPtrVec.push_back(mbr.acquire<OBJ_SIZE>());
    }
    for(auto iter:slotPtrVec)
    {
        mbr.release<OBJ_SIZE>(iter);
    }
    printf("After allocate-release torture size=%ld\n\n", mbr.size());

    size_t lastSize = mbr.size();
    for(int i=0; i<100; i++)
    {
        mbr.acquire<OBJ_SIZE>();
        size_t currentSize = mbr.size();
        if(lastSize-currentSize!=65)
        {
            fprintf(stderr, "%ld-%ld Failed to allocate 65 slices\n", currentSize, lastSize);
            return;
        }
        lastSize = currentSize;
    }
}

int main()
{
    //BasicTest();
    //BasicTest2();


    MemoryRingBuffer mbr;

    std::vector<void*> slotPtrVec;
    for(int i=0; i<1024*16; i++)
    {
        slotPtrVec.push_back(mbr.acquire<sizeof(int)>());
    }
    for(auto iter:slotPtrVec)
    {
        mbr.release<32>(iter);
    }
    printf("After allocate-release torture size=%ld\n", mbr.size());
    

    //申请1个固定Size的T，并释放
    auto begin = readTsc();
    void* ptr = mbr.acquire<32>();
    printf("Acquire<32>() consumed %ld cycles\n", readTsc()-begin);
    mbr.release<32>(ptr);
    

    //申请1个随机Size的T，并释放
    begin = readTsc();
    ptr = mbr.acquire<65*64>();
    printf("Acquire<65*64>() consumed %ld cycles\n", readTsc()-begin);
    mbr.release<65*64>(ptr);

    begin = readTsc();
    ptr = mbr.acquire<333*64>();
    printf("Acquire<333*64>() consumed %ld cycles\n", readTsc()-begin);
    mbr.release<333*64>(ptr);

    //申请N个固定Size的T，并释放 
    constexpr size_t N=1024*8;
    std::array<void*, N> slotPtrArray;
    memset(&slotPtrArray[0], 0 , N);
    begin = readTsc();
    for(int i=0; i<N/4; i++)
    {
        auto index = i*4;
        slotPtrArray[index] = mbr.acquire<56>();
        slotPtrArray[index+1] = mbr.acquire<56>();
        slotPtrArray[index+2] = mbr.acquire<56>();
        slotPtrArray[index+3] = mbr.acquire<56>();
    }
    printf("N-Acquire<56>() consumed %ld cycles\n", (readTsc()-begin)/N);
    for(auto iter:slotPtrArray)
    {
        mbr.release<56>(iter);
    }
#ifdef DEBUG
    printf("size=%ld\n", mbr.size());
#endif


    //申请N个随机Size的T，并释放
    constexpr size_t N2=128;
    constexpr size_t randomSize = 75*64;
    std::array<void*, N2> slotPtrArray2;
    memset(&slotPtrArray2[0], 0 , N2);
    begin = readTsc();
    for(int i=0; i<N2/4; i++)
    {
        auto index = i*4;
        slotPtrArray2[index]   = mbr.acquire<randomSize>();
        slotPtrArray2[index+1] = mbr.acquire<randomSize>();
        slotPtrArray2[index+2] = mbr.acquire<randomSize>();
        slotPtrArray2[index+3] = mbr.acquire<randomSize>();
    }
    printf("N-Acquire<randomSize>() consumed %ld cycles\n", (readTsc()-begin)/N2);
    for(auto iter:slotPtrArray2)
    {
        mbr.release<randomSize>(iter);
    }
#ifdef DEBUG
    printf("size=%ld\n", mbr.size());
#endif
    //申请随机个数固定Size的T，并释放
    std::vector<unsigned short> randomCnt;
    size_t totalCnt;
    for(int i=0; i<50; i++)
    {
        randomCnt.push_back(random()%128);
        totalCnt += randomCnt.back();
    }
    
    std::vector<void*> slotPtrVec2;
    slotPtrVec2.reserve(totalCnt);
    begin = readTsc();
    for(auto cnt:randomCnt)
    {    
        for(int i=0; i<cnt; i++)
        {
            slotPtrVec2.emplace_back(mbr.acquire<32>());
        }
    }
    printf("Random-Acquire<32>() consumed %ld cycles\n", (readTsc()-begin)/totalCnt);
    for(auto iter:slotPtrVec2)
    {
        mbr.release<randomSize>(iter);
    }

    //申请随机个数随机Size的T，并释放
    slotPtrVec2.clear();
    begin = readTsc();
    for(auto cnt:randomCnt)
    {
    
        for(int i=0; i<cnt; i++)
        {
            if(i&1)
                slotPtrVec2.emplace_back(mbr.acquire<3*64>());
            else
                slotPtrVec2.emplace_back(mbr.acquire<4*64>());
        }
    }
    printf("Random-Acquire<random>() consumed %ld cycles\n", (readTsc()-begin)/totalCnt);
}
