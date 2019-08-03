#include <iostream>
#include <boost/mpl/vector.hpp>
#include <boost/mpl/for_each.hpp>
#include <boost/mpl/at.hpp>
#include <boost/mpl/copy_if.hpp>
#include <boost/mpl/transform.hpp>
#include <iostream>
#include <type_traits>

struct Config1 
{
    static void Name() { std::cout<<"Config1\n";}
};
struct Config2 
{
    static void Name() { std::cout<<"Config2\n";}
};
struct Config3
{
    static void Name() { std::cout<<"Config3\n";}
};

class Print 
{
public:
    template <typename T>
    void operator()(T t)
    {
        t.Name();
    }
};

enum Column
{
    Config=0,
    First,
    Second,
    Third,
    Fourth
};
struct ConfigMatrix 
{
    //typedef boost::mpl::bool_<true> Y;
    //typedef boost::mpl::bool_<false> N;

    typedef std::true_type  Y;
    typedef std::true_type  N;

    typedef boost::mpl::vector<
        boost::mpl::vector<Config1,  Y, Y, Y>,
        boost::mpl::vector<Config2,  N, Y, Y>,
        boost::mpl::vector<Config3,  N, N, Y>
    > type ;
};

template <Column Index, typename Matrix>
struct ConfigFilter
{

    template<Column index>
    struct FilterByIndex
    {
        template<typename Configs>
        struct apply
        {
            typedef typename boost::mpl::at_c<Configs, index>::type type;
        };
    };

    typedef typename boost::mpl::copy_if<typename Matrix::type, FilterByIndex<Index>, boost::mpl::back_inserter<boost::mpl::vector<>> >::type FilteredConfig;

    typedef typename boost::mpl::transform<FilteredConfig, FilterByIndex<Column::Config>>::type type;
};

int main()
{
    typedef typename ConfigFilter<Column::First, ConfigMatrix>::type  Configs1;
    boost::mpl::for_each<Configs1>(Print());

    typedef typename ConfigFilter<Column::Second, ConfigMatrix>::type  Configs2;
    boost::mpl::for_each<Configs2>(Print());

    typedef typename ConfigFilter<Column::Third, ConfigMatrix>::type  Configs3;
    boost::mpl::for_each<Configs3>(Print());
    return 0;
}
