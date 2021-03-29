#include "macro.hpp"
int test()
{
  static constexpr auto d = custom::Serializer<Data>::tag();
  STORE_STRING_IN_SECTION(toString(d), "LogTypeSection");

  auto addr =  &__start_LogTypeSection;
  printf("%p %p\n", *addr, __start_LogTypeSection);
  std::cout<<*addr<<"\n";

  long eventID1 = 123;
  long eventID2 = 123;
  CREATE_EVENT(eventID1, "DEBUG", "DATA::A is {0};");
  CREATE_EVENT(eventID2, "DEBUG", "DATA::B is {0};");

  printf("%lx %lx %ld\n", eventID1, eventID2, eventID2-eventID1);
  return 0;
}
