#include <unordered_map>
#include <stdio.h>


int main()
{
    std::unordered_map<int, double> map;
    map.emplace(0, 1);
    map.emplace(0, 2);
    auto iter1 = map.begin();
    printf("key=%d value=%lf\n", iter1->first, iter1->second);
    for(int i=1; i<1000; i++)
        map.emplace(i, i*2);
    printf("key=%d value=%lf\n", iter1->first, iter1->second);

    auto iter2 = map.begin();
    printf("key=%d value=%lf\n", iter2->first, iter2->second);

    

}
