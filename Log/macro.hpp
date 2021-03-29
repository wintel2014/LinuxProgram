#include <utility>
#include <iostream>
#include <stdio.h>
#include <array>
#include <utility>
/*
https://sourceware.org/binutils/docs/as/Section.html

For ELF targets, the .section directive is used like this:

.section name [, "flags"[, @type[,flag_specific_arguments]]]

flags:
a  section is allocatable
d  section is a GNU_MBIND section
e  section is excluded from executable and shared library.
o  section references a symbol defined in another section (the linked-to section) in the same file.
w  section is writable
?  section is a member of the previously-current section’s group, if any

The optional type argument may contain one of the following constants:

@progbits  section contains data
@nobits  section does not contain data (i.e., section only occupies space)
@note  section contains data which is used by things other than the program
*/
// If no flags are specified, the default flags depend upon the section name.
// If the section name is not recognized, the default will be for the section to have none of the above flags: it will not be allocated in memory, nor writable, nor executable. The section will contain data.

#define STORE_STRING_IN_SECTION(STR, SECTION) \
  __asm__ __volatile(                         \
            ".pushsection \"" SECTION "\",\"a?\",@progbits" "\n"\
            ".quad %c0"                         "\n"\
            ".popsection"                       \
            :                               \
            : "i"(STR)  \
  )

#define CREATE_EVENT(ID, SEVERITY, FORMAT) \
  __asm__ __volatile( \
            ".pushsection \"EVENTSECTION\",\"a?\",@progbits" "\n"\
            "0:\n"\
            ".quad %c1, %c2, %c3, %c4, %c5, 0, 0, 0"      "\n"\
            ".popsection \n"                       \
            "lea{q} {0b(%%rip), %0 | %0, 0b(%%rip)}" "\n" \
            :"=r" (ID)\
            :"i" (__FILE__), \
             "i" (__PRETTY_FUNCTION__),\
             "i" (SEVERITY),\
             "i" (__LINE__),\
             "i" (FORMAT)\
  )
struct EventDesc
{
  char* mFile;
  char* mFunc;
  char* mLevel;
  long  mLineNo;
  char* mFormat;
  long mPadding[3];
};

template<typename>
struct Type;

template<>
struct Type<int>
{
  static constexpr char value_type[3]{"I|"};
};
template<>
struct Type<double>
{
  static constexpr char value_type[3]{"D|"};
};
template<>
struct Type<long>
{
  static constexpr char value_type[4] {"L|"};
};

template <size_t N>
using CharArray = const char (&)[N];
template <size_t N>
struct literalString
{
  const char mData[N] {0};
};

template<size_t N>
constexpr CharArray<N> toString(const literalString<N>& str) {return str.mData;}

namespace literal{

  template<size_t N1, size_t N2>
  constexpr void copy_literal(char(&dest)[N1], const char(&src)[N2], size_t size)
  {
    for(size_t i=0; 1<size; i++)
    {
      dest[i] = src[i];
    }
  }
  //total_len("12", "345") => 6, so array[6]="12345"
  template <typename... Arrays>
  constexpr size_t total_len(Arrays... arrays)
  {
    auto size = ((sizeof(arrays)-1)+...);
    return size+1;
  }

  template<size_t N, std::size_t... I>
  constexpr literalString<N> toLiteralString(const char(&src)[N], std::index_sequence<I...>)
  {
    return literalString<N>{{src[I]...}};
  }

  template <typename... Args>
  constexpr auto concat(const Args&... args)
  {
    constexpr auto size = total_len(args...);
    char NewArray[size] = {0};
    auto NewArrayPtr = NewArray;
    const char* srcArray[] = {args...};

    size_t ArrayLen[] = {sizeof(args)...};
    for(size_t i=0; i<sizeof...(args); i++)
    {
      auto src = srcArray[i];
      for(size_t j=0; j<ArrayLen[i]&&src[j]; ++j)
        *NewArrayPtr++ = src[j];
    }
    return toLiteralString(NewArray, std::make_index_sequence<size-1>{});
  }
}

struct Data
{
  int A;
  double B;
  long C;
};

namespace custom{
  template <typename>
  struct Serializer;

  template <>
  struct Serializer<Data>
  {
    static constexpr auto tag()
    {
      //static auto constexpr d = literal::concat("Data|", "A|", Type<decltype(std::declval<Data>().A)>::value_type);
      constexpr auto d = literal::concat("Data|", "A|", Type<decltype(Data::A)>::value_type,
                                                  "B|", Type<decltype(Data::B)>::value_type,
                                                  "C|", Type<decltype(Data::C)>::value_type
                                                  );
      return d;
    }
  };
}
extern char* __start_LogTypeSection;
