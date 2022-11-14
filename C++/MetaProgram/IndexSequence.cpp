#include <tuple>
#include <utility>
#include <iostream>
template <typename Tuple, typename Func, size_t ... N>
void func_call_tuple(const Tuple& t, Func&& func, std::index_sequence<N...>) {
    static_cast<void>(std::initializer_list<int>{(func(std::get<N>(t)), 0)...});
}

template <typename ... Args, typename Func>
void travel_tuple(const std::tuple<Args...>& t, Func&& func) {
    func_call_tuple(t, std::forward<Func>(func), std::index_sequence_for<Args...>{});
}

int main() {
    auto t = std::make_tuple(1, 4.56, "string");
    travel_tuple(t, [](auto&& item) {
        std::cout << item << ",";
    });
    std::cout<<"\n";
}
