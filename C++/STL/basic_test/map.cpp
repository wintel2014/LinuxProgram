#include <map>
#include <iostream>

int main()
{
    {
        const std::map<int, const char*, std::less<int>> m{
        //const std::map<int, const char*> m{
            { 0, "zero" },
            { 1, "one" },
            { 2, "two" },
            { 3, "three" },
            { 4, "four" },
            { 5, "five" },
        };
        for(auto &item:m)
            std::cout << item.first<< " ";  //0 1 2 3 4 5
        std::cout <<'\n';

        auto range = m.equal_range(3);
        std::cout << range.first->first<<" ";
        std::cout << range.second->first<<"\n";

        //Iterator pointing to the first element that is >= than key.  !compare(result, 3)  !(result<3)
        auto iter_l = m.lower_bound(3);
        std::cout <<"lower_bound="<<iter_l->first<<"\n";  //3

        // Iterator pointing to the first element that is > than key.   compare(3, result)  3<result
        auto iter = m.upper_bound(3);
        std::cout <<"upper_bound="<<iter->first<<"\n\n";  //4
    }

    {
        const std::map<int, const char*, std::greater<int>> m{
            { 0, "zero" },
            { 1, "one" },
            { 2, "two" },
            // { 3, "three" },
            { 4, "four" },
            { 5, "five" },
        };
        for(auto &item:m)
            std::cout << item.first<< " "; //5 4 2 1 0
        std::cout <<'\n';

        // the first pointing to the first element that is >= key and the second pointing to the first element > key.
        auto range = m.equal_range(3);
        std::cout << range.first->first<<" ";
        std::cout << range.second->first<<"\n";

        //Iterator pointing to the first element that is >= than key.
        auto iter_l = m.lower_bound(3);
        std::cout <<"lower_bound="<<iter_l->first<<"\n";

        // Iterator pointing to the first element that is > than key.
        auto iter = m.upper_bound(3);
        std::cout <<"upper_bound="<<iter->first<<"\n";
    }

}
