#include <boost/preprocessor/variadic/to_seq.hpp>
#include <boost/preprocessor/seq/for_each.hpp>
#include <stddef.h>
#include <stdio.h>

typedef char C_Array[17];
#define FIELDS \
  (char,      mChar,      0),\
  (C_Array,   mCharArray, 0),\
  (short,     mShort,     1),\
  (int,       mInt,       2),\
  (long,      mLong,      3),\
  (long long, mLL,        4),\
  (float,     mF,       5.0),\
  (double,    mD,       6.0)

template <typename Type, typename MemType, MemType Type::*MemPtr>
constexpr size_t OffsetFunc(Type &&obj)
{
    return (char*)&(obj.*MemPtr) - (char*)&obj;
}

#define DeclareMemVar(r, data, ele) BOOST_PP_TUPLE_ELEM(0, ele) BOOST_PP_TUPLE_ELEM(1, ele) {r+BOOST_PP_TUPLE_ELEM(2, ele)};

struct Foo
{
  BOOST_PP_SEQ_FOR_EACH(DeclareMemVar, NA, BOOST_PP_VARIADIC_TO_SEQ(FIELDS));
};

#define OFFSET(STRUCT, MEMBER) OffsetFunc<STRUCT, decltype(STRUCT::MEMBER), &STRUCT::MEMBER>(STRUCT())
#define STRING_IMPL(a) #a
#define STRING(a) STRING_IMPL(a)
#define ShowMemOffset(r, data, ele) \
  printf("%-12s:%2ld [%2ld]\n", STRING(BOOST_PP_TUPLE_ELEM(1, ele)), \
      OFFSET(Foo, BOOST_PP_TUPLE_ELEM(1, ele)),\
     sizeof(BOOST_PP_TUPLE_ELEM(0, ele))\
    );

/*
Itanium ABI prohibits, for historical reasons, using the tail padding of a base subobject of POD type. but C++11 doesn't have such a prohibition.
GCC follows the Itanium ABI for C++, which prevents the tail-padding of a POD being used for storage of derived class data members.
Adding a user-provided consturctor means that Base is no longer POD, so the restriction is no longer applied
*/
struct Base
{
  //Base() {}; //will break POD
  //Base() = default; 
  long mL;
  //private:  //will break POD
    char mC;
};
struct D1 : public Base
{
  char mC_in_D1;
};
struct D2
{
  Base mB;
  char mC_in_D2;
};

int main()
{
  BOOST_PP_SEQ_FOR_EACH(ShowMemOffset, NA, BOOST_PP_VARIADIC_TO_SEQ(FIELDS));
  printf("\n");
  printf("mC_in_D1=%ld mC_in_D2=%ld\n", OFFSET(D1, mC_in_D1), OFFSET(D2, mC_in_D2));
}

/* BOOST_PP_TUPLE_ELEM internals
#define GET_TUPLE_ELEM(N, SEQ) GET_TUPLE_ELEM_##N SEQ

#define GET_TUPLE_ELEM_0(a, ...) a
#define GET_TUPLE_ELEM_1(a, b, ...) b
#define GET_TUPLE_ELEM_2(a, b, c ...) c

#define SEQ (char, mChar, 0)
GET_TUPLE_ELEM(0, SEQ); ==> char
*/
