#include <boost/fusion/sequence.hpp>
#include <boost/fusion/include/map.hpp>
#include <vector>
#include <memory>
#include <utility>
#include <type_traits>
#include <iostream>
#include <variant>

struct Type1 {};
struct Type2 {};
struct Type3 {};

struct MessageCommon
{
    void process() {std::cout<<"Common\n";}
};
struct Message1 : MessageCommon
{
    using Base = MessageCommon;
    void process() 
    {
        Base::process();
        std::cout<<"Message1\n";
    }
};
struct Message2 : MessageCommon
{
    using Base = MessageCommon;
    void process() 
    {
        Base::process();
        std::cout<<"Message2\n";
    }
};
struct Message3 : MessageCommon
{
    using Base = MessageCommon;
    void process() 
    {
        Base::process();
        std::cout<<"Message3\n";
    }
};

template<typename... Types, typename... Args>
constexpr auto MessageFusionFactory(Args&&... args)
{
  boost::fusion::map<boost::fusion::pair<Types, std::decay_t<Args>>...> m{
                     ( boost::fusion::make_pair<Types>(std::forward<Args>(args)) )...
                  };
  return m;
}

auto M = MessageFusionFactory<Type1, Type2, Type3>(Message1{}, Message2{}, Message3{});
template<typename T>
void process(void* pMsg)
{
    reinterpret_cast<std::decay_t<decltype(boost::fusion::at_key<T>(M))>*>(pMsg)->process();
}

int main()
{
    Message1 M1{};
    process<Type1>(&M1);
}
