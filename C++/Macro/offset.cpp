#include <boost/preprocessor/variadic/to_seq.hpp>
#include <boost/preprocessor/seq/for_each.hpp>
#include <boost/preprocessor/stringize.hpp>
#include <stddef.h>
#include <stdio.h>
/*
BOOST_PP_SEQ_FOR_EACH(macro, data, seq)
r: 
data: Auxiliary data passed to macro.
seq: The seq for which macro will be invoked on each element.

If seq is (a)(b)(c), 
it expands to the sequence:  macro(r, data, a) macro(r, data, b) macro(r, data, c)

#define SEQ (x)(y)(z)(a)(b)(c)
#define MACRO(r, data, elem)  r,
printf("%d %d %d %d %d %d %d\n",  BOOST_PP_SEQ_FOR_EACH(MACRO, _, SEQ) 0); //2 3 4 5 6 7 0


BOOST_PP_SEQ_ENUM(seq) expands to a comma-separated list of the elements in seq.
For example, BOOST_PP_SEQ_ENUM((x)(y)(z)) expands to  x, y, z

BOOST_PP_VARIADIC_TO_SEQ(a, b, c) // expands to (a)(b)(c)

#define TUPLE (a, b, c, d)
BOOST_PP_TUPLE_ELEM(0, TUPLE)  //a
*/

template <int HEAD, int...LEFT>
constexpr int MAX_V()
{
    if constexpr(sizeof...(LEFT) == 0)
        return HEAD;
    else
        return HEAD > MAX_V<LEFT...>() ? HEAD : MAX_V<LEFT...>();
}

typedef char C_Array[17];
#define FIELDS \
  (char,      mChar,      0,    8),\
  (C_Array,   mCharArray,'a',  18),\
  (short,     mShort,     1,    8),\
  (int,       mInt,       2,    8),\
  (long,      mLong,      3,    8),\
  (long long, mLL,        4,    8),\
  (float,     mF,       5.0,    8),\
  (double,    mD,       6.0,    12)
//  type     name    init val   output width


#define DECLARE_PRINT_FIELD_BY_WIDTH_COMMON(MEMBER, WIDTH)\
template <typename T>\
struct BOOST_PP_CAT (PRINT_FIELD_BY_WITDH_, MEMBER)\
{\
    template <typename Arg>\
    static void Print(Arg arg)\
    {PrintF(arg, width);}\
    static void Print()\
    {printf("%*s", width, BOOST_PP_STRINGIZE(MEMBER));}\
    static constexpr int width=MAX_V<WIDTH, sizeof(BOOST_PP_STRINGIZE(MEMBER))>();\
};
#define DECLARE_PRINT_FIELDS_STURCT_TEMPLATE(r, data, type) DECLARE_PRINT_FIELD_BY_WIDTH_COMMON(BOOST_PP_TUPLE_ELEM(1, type), BOOST_PP_TUPLE_ELEM(3, type))
#define DECLARE_PRINT_STRUCT_TEMPLATES(FIELDS) BOOST_PP_SEQ_FOR_EACH(DECLARE_PRINT_FIELDS_STURCT_TEMPLATE, NA, BOOST_PP_VARIADIC_TO_SEQ(FIELDS));


template <typename Type, typename MemType, MemType Type::*MemPtr>
constexpr size_t OffsetFunc(Type &&obj)
{
    return (char*)&(obj.*MemPtr) - (char*)&obj;
}

#define DeclareMemVar(r, data, ele) BOOST_PP_TUPLE_ELEM(0, ele) BOOST_PP_TUPLE_ELEM(1, ele) {BOOST_PP_TUPLE_ELEM(2, ele)};

struct Foo
{
  BOOST_PP_SEQ_FOR_EACH(DeclareMemVar, NA, BOOST_PP_VARIADIC_TO_SEQ(FIELDS));
};

void PrintF(char value, int WIDTH)
{printf("%*d", WIDTH, value);}
void PrintF(short value, int WIDTH)
{printf("%*d", WIDTH, value);}
void PrintF(int value, int WIDTH)
{printf("%*d", WIDTH, value);}
void PrintF(long value, int WIDTH)
{printf("%*ld", WIDTH, value);}
void PrintF(long long value, int WIDTH)
{printf("%*lld", WIDTH, value);}
void PrintF(float value, int WIDTH)
{printf("%*f", WIDTH, value);}
void PrintF(double value, int WIDTH)
{printf("%*lf", WIDTH, value);}
void PrintF(const char* value, int WIDTH)
{printf("%*s", WIDTH, value);}

DECLARE_PRINT_STRUCT_TEMPLATES(FIELDS);

//specification output
template<>
struct PRINT_FIELD_BY_WITDH_mF<Foo> 
{
    template <typename Arg>
    static void Print(Arg arg)
    {printf("%*.03f", width, arg);}
    static void Print()
    {printf("%*s", width, "mF");}
    static constexpr int width=10;
};
void PrintEachMemberFormat(Foo& data)
{
    //PRINT_FIELD_BY_WITDH_mChar<Foo>::Print();
    #define PRINT_HEADER(r, classType, elem) BOOST_PP_CAT(PRINT_FIELD_BY_WITDH_, BOOST_PP_TUPLE_ELEM(1, elem))<classType>::Print();
    #define PRINT_VALUE(r, classType, elem) BOOST_PP_CAT(PRINT_FIELD_BY_WITDH_, BOOST_PP_TUPLE_ELEM(1, elem))<classType>::Print(data.BOOST_PP_TUPLE_ELEM(1, elem));
    BOOST_PP_SEQ_FOR_EACH(PRINT_HEADER, Foo, BOOST_PP_VARIADIC_TO_SEQ(FIELDS));
    printf("\n");
    BOOST_PP_SEQ_FOR_EACH(PRINT_VALUE,  Foo, BOOST_PP_VARIADIC_TO_SEQ(FIELDS));
    //PRINT_FIELD_BY_WITDH_mChar<Foo>::Print(data.mChar);
    printf("\n");
}

#define FIELDS2 \
    (int,   mInt),\
    (union, {long mU_Long; double mU_Double;}),\
    (int,   mD:1),\
    (long,  mLong)

#define DECLARE_FIELD_WIDTH_COMMON(MEMBER, WIDTH)\
tempalte <typename T>\
struct MAY_BIT_FIELD_WIDTH_##MEMBER\
{\
private:\
    template <typename U>\
    static auto Check(int)->decltype(&U::MEMBER, std::array<char, WIDTH>{});\
    \
    template<typename U> \
    static auto Check(...)->std:array<char, WIDTH>{};\
    \
public:\
    enum {value = sizeof(decltype(Check<T>(0)))};\
};
#define DECLARE_FIELD_WIDTH_CLASS_SPECIFICATION(CLASS, MEMBER, WIDTH)\
template <>\
struct MAY_BIT_FIELD_WIDTH_##MEMBER<CLASS>\
{\
private:\
    template <typename U>\
    static auto Check(int)->decltype(&U::MEMBER, std::array<char, WIDTH>{});\
    \
    template<typename U> \
    static auto Check(...)->std:array<char, WIDTH>{};\
    \
public:\
    enum {value = sizeof(decltype(Check<CLASS>(0)))};\
}


#define DeclareMemVar_NO_INIT(r, data, ele) BOOST_PP_TUPLE_ELEM(0, ele) BOOST_PP_TUPLE_ELEM(1, ele) ;
struct Foo2
{
  BOOST_PP_SEQ_FOR_EACH(DeclareMemVar_NO_INIT, NA, BOOST_PP_VARIADIC_TO_SEQ(FIELDS2));
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
    Foo foo;
    printf("member : %d %d %d %d\n", foo.mChar, foo.mCharArray[0], foo.mShort-1, foo.mInt-2);
    printf("\n");
    printf("mC_in_D1=%ld mC_in_D2=%ld\n", OFFSET(D1, mC_in_D1), OFFSET(D2, mC_in_D2));
    PrintEachMemberFormat(foo);
}

/* BOOST_PP_TUPLE_ELEM internals
#define GET_TUPLE_ELEM(N, SEQ) GET_TUPLE_ELEM_##N SEQ

#define GET_TUPLE_ELEM_0(a, ...) a
#define GET_TUPLE_ELEM_1(a, b, ...) b
#define GET_TUPLE_ELEM_2(a, b, c ...) c

#define SEQ (char, mChar, 0)
GET_TUPLE_ELEM(0, SEQ); ==> char
*/
