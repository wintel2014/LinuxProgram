#include <boost/mpl/vector.hpp>
#include <boost/mpl/for_each.hpp>
#include <boost/mpl/push_back.hpp>
#include <iostream>
#include <type_traits>

template<int N1, int N2, int ...Num>
struct Max
{
    static constexpr int value = N1>=N2 ? Max<N1, Num...>::value : Max<N2, Num...>::value;
};

template<int N1, int N2>
struct Max<N1, N2>
{
    static constexpr int value = N1>=N2 ? N1:N2;
};

template<int N1, int N2, int ...Num>
struct Min
{
    static constexpr int value = N1<N2 ? Min<N1, Num...>::value : Min<N2, Num...>::value;
};

template<int N1, int N2>
struct Min<N1, N2>
{
    static constexpr int value = N1<N2 ? N1:N2;
};


//Nearest<3,3,2>::value ==>2
template<int Limit, int N1, int N2>
struct Nearest
{
    static constexpr int max = Max<Limit, N1, N2>::value;
    static constexpr int min = Min<Limit, N1, N2>::value;
    //static_assert(max==min? Limit==min : Limit!=min, "Limit is the minimun number");
    static constexpr int value_1 = (Limit==max)? Max<N1,N2>::value : min ;
    static constexpr int value = value_1==Limit ? min : value_1;
};


template<int... Nums>
struct upper_bound;

//find the largest number that < limit in [N1, N2, Nums...]
template<int Limit, int N1, int N2, int... Nums>
struct upper_bound<Limit, N1, N2, Nums...>
{
    static constexpr int bound = Nearest<Limit, N1, N2>::value;
    static constexpr int value = upper_bound<Limit, bound, Nums...>::value;
};

template<int Limit, int N>
struct upper_bound<Limit, N>
{
    static constexpr int value = N;
};

template<size_t N, int Limit, int... Nums>
struct for_each_impl
{
    static constexpr int MaxSofar = upper_bound<Limit, Nums...>::value;
    typedef typename boost::mpl::push_back< typename for_each_impl<N-1, MaxSofar, Nums...>::ResultType, std::integral_constant<int, Limit>>::type ResultType;
};

template<int Limit, int... Nums>
struct for_each_impl<1, Limit, Nums...>
{
    typedef typename boost::mpl::vector<std::integral_constant<int, Limit>> ResultType;
};

struct Disp
{
    
    template <typename T>
    void operator () (T data)
    { std::cout<<data.value<<" ";}
};
template<int...Nums>
void for_each2()
{
    constexpr size_t N = sizeof...(Nums);
    constexpr int Limit = Max<Nums...>::value;

    Disp obj;
    boost::mpl::for_each<typename for_each_impl<N, Limit, Nums...>::ResultType>(obj);
}
int main()
{
    //std::cout<<Nearest<2,3,1>::value<<"\n";
    //std::cout<<Nearest<2,1,3>::value<<"\n";
    //std::cout<<Nearest<3,2,1>::value<<"\n";
    std::cout<<Nearest<3,1,3>::value<<"\n";


    //std::cout<<Nearest<3,2,3>::value<<"\n";
    //std::cout<<upper_bound<3,2,3>::value<<"\n";
   for_each2<3,1,3>();
   std::cout<<"\n";
   // for_each2<3,1,11,13,2,3,4,5,6,7,8>();
   // std::cout<<"\n";
   // for_each2<1,11,13,2,3,4,5,6,7,8>();
   // std::cout<<"\n";
    
}
