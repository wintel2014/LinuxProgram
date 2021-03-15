#include <iostream>
#include <type_traits>
template <size_t N>
using place_index_t = std::integral_constant<size_t, N>;

template <typename T, typename First, typename... Args>
struct Index
{
  static constexpr size_t value = Index<T, Args...>::value+1;
};
template<typename T, typename... Args>
struct Index<T, T, Args...>
{
  static constexpr size_t value = 0;
};


template <typename First, typename... Args>
union VariadicUnion
{
  constexpr VariadicUnion() = default;

  template <size_t N, typename... ValueT>
  constexpr VariadicUnion(place_index_t<N> index, ValueT&&... args) : left_(place_index_t<N-1>{},std::forward<ValueT>(args)...)
  {}

  template <typename... ValueT>
  constexpr VariadicUnion(place_index_t<0> index, ValueT&&... args) : first_(std::forward<ValueT>(args)...)
  { }

  template <typename ValueT>
  constexpr VariadicUnion(ValueT&& arg) : left_(place_index_t<Index<ValueT, First, Args...>::value-1>{}, std::forward<ValueT>(arg))
  { }

  constexpr VariadicUnion(First&& arg) : first_(std::forward<First>(arg))
  { }

  First first_{};
  VariadicUnion<Args...> left_;
};

template<typename First>
union VariadicUnion<First>
{
  constexpr VariadicUnion(place_index_t<0>, First&& arg) : first_(std::forward<First>(arg))
  { }
  constexpr VariadicUnion(First&& arg) : first_(std::forward<First>(arg))
  { }
  First first_{};
};

template <typename... Args>
struct Variant
{
  template<typename ValueT>
  Variant(ValueT&& v) : storage_(std::forward<ValueT>(v)), index_(Index<ValueT, Args...>::value) {}

  VariadicUnion<Args...> storage_;
  size_t index_{-1};
};

int main()
{
  VariadicUnion<char, int, float, double, long> U1{place_index_t<2>{}, 1};
  std::cout<<sizeof(U1)<<"\n";
  VariadicUnion<char, int, float, double, long> U2{'a'};
  VariadicUnion<char, int, float, double, long> U3{13l};
  std::cout<<Index<float, char, int, float, double, long>::value<<"\n";


  Variant<char, int, float, double, long> V1('a');
  Variant<char, int, float, double, long> V2(123l);
  Variant<char, int, float, double, long> V3(1.3);
}
