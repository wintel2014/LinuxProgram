#include <stdio.h>
#include <time.h>
#include <vector>
#include <algorithm>

inline unsigned long rdtscp()
{
    unsigned int aux;
    unsigned long rax, rdx;
    asm volatile ("rdtscp\n" : "=a"(rax), "=d"(rdx), "=c"(aux));
    return (rdx<<32)|rax;
}


struct alignas(64) Foo {
    int mNext;
    int value;
};

int main(int argc, char* argv[])
{
    if(argc!=2)
    {
        printf("Please input the cacheline count\n");
        exit(-1);
    }
    int eleCnt = atoi(argv[1]);
    std::vector<std::pair<int, int>> IndexMap(eleCnt);
    int index=0;
    srandom(time(nullptr));
    for(auto &iter : IndexMap)
    {
        iter.first = random();
        iter.second = index++;
    }

    std::sort(IndexMap.begin(), IndexMap.end(), [](auto&lhs, auto&rhs){return lhs.first>rhs.first;});
    IndexMap.emplace_back(0,0);

/*
下图为例，pool[6] 是一个内存池。依次从该内存池中allocate memory，返回值为index
Head=4， pool[4] =1
         pool[1] =X
        ........

        ------
        |    |
        v
      ____________
     |_|_|_|1|_|_|
            ^
            |
Head=4 -----


Head->Pool[4]->Pool[1]->Pool[X]...->Pool[Last] 中不会出现环路(内存不会重复分配)。
最后，将Pool[Last]=Head, 将会形成一条环路。从而根据链表，可以随机访问所有内存池
*/
    std::vector<Foo> DataSet(eleCnt);
    auto Head = IndexMap[0].second;
    auto currentIndex = Head;
    for(int i=1; i<IndexMap.size()-1; i++)
    {
        DataSet[currentIndex].mNext = IndexMap[i].second; //Allocate Memrory randomly
        currentIndex = IndexMap[i].second;
    }
    DataSet[currentIndex].mNext = Head;
#ifdef DEBUG
    for(auto& iter:DataSet)
    {
        printf("%d\n", iter.mNext)
    }
    //sort -nu
#endif
    constexpr int loop = 10*1024*1024;
    auto Current = DataSet[0].mNext;
    volatile Foo* pCacheLine = &DataSet[0];
    bool isPrint = true;
    while(1)
    {
        auto start = rdtscp();
        for(auto i=0; i<loop; i++)
            Current = pCacheLine[Current].mNext;

        if(isPrint)
            printf("%8.02lf cycles[%10.03lfKB]\n", (rdtscp()-start)/(loop*1.0), 64*eleCnt/1024.0);
    }
}
