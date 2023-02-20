#include <vector>
#include <algorithm>
using namespace std;

#include<stdio.h>
int main()
{
    std::vector<int> value(17, 123);
    printf("size=%ld\n", value.size());

    std::sort(value.begin(), value.end(), 
            [](int lhs, int rhs){return lhs >= rhs;}
    );

    return 0;
}


/*
intro sort（内省式排序），是STL sort所采用的排序算法，它是quick sort，heap sort， insertion sort的结合。
intro sort在大部分情况下与median-of-3 qucik sort的做法相同，但是当分割行为（partitioning）有使效率恶化为O(N2)倾向时，能够自我检测，转而使用heap sort，并在适当情况下使用insertion sort。

compare 函数需要保证
       compare(a, a) == false
       com(a,b)==true,                   则comp(b,a)==false
传递性 comp(a,b)==true, comp(b,c)==true, 则comp(a,c)==true

__unguarded_XXX : 不对边界进行检查，对于已经排好的序列，查找合适的位置时，会使用comp函数，如果违背了上述规则，有可能导致数据overflow

1899   template<typename _RandomAccessIterator, typename _Compare>
1900     _RandomAccessIterator
1901     __unguarded_partition(_RandomAccessIterator __first,
1902               _RandomAccessIterator __last,
1903               _RandomAccessIterator __pivot, _Compare __comp)
1904     {
1905       while (true)
1906     {
1907       while (__comp(__first, __pivot))
1908         ++__first;
1909       --__last;
1910       while (__comp(__pivot, __last))
1911         --__last;
1912       if (!(__first < __last))
1913         return __first;
1914       std::iter_swap(__first, __last);
1915       ++__first;
1916     }
1917     }

1943     template<typename _RandomAccessIterator, typename _Size, typename _Compare>
1944         void
1945         __introsort_loop(_RandomAccessIterator __first,
1946                 _RandomAccessIterator __last,
1947                 _Size __depth_limit, _Compare __comp)
1948         {
1949             while (__last - __first > int(_S_threshold))
1950             {
1951                 if (__depth_limit == 0)
1952                 {
1953                     std::__partial_sort(__first, __last, __last, __comp);
1954                     return;
1955                 }
1956                 --__depth_limit;
1957                 _RandomAccessIterator __cut = std::__unguarded_partition_pivot(__first, __last, __comp);
1959                 std::__introsort_loop(__cut, __last, __depth_limit, __comp);
1960                 __last = __cut;
1961             }
1962         }

1966     template<typename _RandomAccessIterator, typename _Compare>
         inline void __sort(_RandomAccessIterator __first, _RandomAccessIterator __last, _Compare __comp)
1970         {
1971             if (__first != __last)
1972             {
1973                 std::__introsort_loop(__first, __last,
1974                         std::__lg(__last - __first) * 2,
1975                         __comp);
1976                 std::__final_insertion_sort(__first, __last, __comp);
1977             }
1978         }


4891   template<typename _RandomAccessIterator, typename _Compare>
4892     inline void
4893     sort(_RandomAccessIterator __first, _RandomAccessIterator __last,
4894      _Compare __comp)
4895     {
4905       std::__sort(__first, __last, __gnu_cxx::__ops::__iter_comp_iter(__comp));
4906     }




#0  std::__unguarded_partition<__gnu_cxx::__normal_iterator<int*, std::vector<int> >, __gnu_cxx::__ops::_Iter_comp_iter<main()::<lambda(int, int)> > >(__gnu_cxx::__normal_iterator<int*, std::vector<int, std::allocator<int> > >, __gnu_cxx::__normal_iterator<int*, std::vector<int, std::allocator<int> > >, __gnu_cxx::__normal_iterator<int*, std::vector<int, std::allocator<int> > >, __gnu_cxx::__ops::_Iter_comp_iter<main()::<lambda(int, int)> >) (__first=..., __last=..., __pivot=..., __comp=...) at /usr/include/c++/9/bits/stl_algo.h:1913
#1  0x000000000040168a in std::__unguarded_partition_pivot<__gnu_cxx::__normal_iterator<int*, std::vector<int> >, __gnu_cxx::__ops::_Iter_comp_iter<main()::<lambda(int, int)> > >(__gnu_cxx::__normal_iterator<int*, std::vector<int, std::allocator<int> > >, __gnu_cxx::__normal_iterator<int*, std::vector<int, std::allocator<int> > >, __gnu_cxx::__ops::_Iter_comp_iter<main()::<lambda(int, int)> >) (__first=..., __last=..., __comp=...) at /usr/include/c++/9/bits/stl_algo.h:1928

#2  0x00000000004014c2 in std::__introsort_loop<__gnu_cxx::__normal_iterator<int*, std::vector<int> >, long int, __gnu_cxx::__ops::_Iter_comp_iter<main()::<lambda(int, int)> > >(__gnu_cxx::__normal_iterator<int*, std::vector<int, std::allocator<int>> >, __gnu_cxx::__normal_iterator<int*, std::vector<int, std::allocator<int> > >, long, __gnu_cxx::__ops::_Iter_comp_iter<main()::<lambda(int, int)> >) (__first=..., __last=..., __depth_limit=7, __comp=...) at /usr/include/c++/9/bits/stl_algo.h:1958
#3  0x0000000000401406 in std::__sort<__gnu_cxx::__normal_iterator<int*, std::vector<int> >, __gnu_cxx::__ops::_Iter_comp_iter<main()::<lambda(int, int)> > >(__gnu_cxx::__normal_iterator<int*, std::vector<int, std::allocator<int> > >, __gnu_cxx::__normal_iterator<int*, std::vector<int, std::allocator<int> > >, __gnu_cxx::__ops::_Iter_comp_iter<main()::<lambda(int, int)> >) (__first=..., __last=..., __comp=...) at /usr/include/c++/9/bits/stl_algo.h:1973
#4  0x000000000040135d in std::sort<__gnu_cxx::__normal_iterator<int*, std::vector<int> >, main()::<lambda(int, int)> >(__gnu_cxx::__normal_iterator<int*, std::vector<int, std::allocator<int> > >, __gnu_cxx::__normal_iterator<int*, std::vector<int, std::allocator<int> > >, <lambda(int, int)>) (__first=..., __last=..., __comp=...) at /usr/include/c++/9/bits/stl_algo.h:4905
#5  0x00000000004012c9 in main () at sort.cpp:11

*/
