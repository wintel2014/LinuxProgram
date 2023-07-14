//https://stackoverflow.com/questions/23999573/convert-a-number-to-a-string-literal-with-constexpr/24000041#24000041
//http://mrpt.ual.es/reference/2.0.0/structmrpt_1_1typemeta_1_1num__to__string.html

#include <stdio.h>
namespace detail
{
    template<unsigned... digits>
    struct to_chars { static const char value[]; };

    template<unsigned... digits>
    constexpr char to_chars<digits...>::value[] = {('0' + digits)..., 0};

    template<unsigned rem, unsigned... digits>
    struct explode : explode<rem / 10, rem % 10, digits...> {};

    template<unsigned... digits>
    struct explode<0, digits...> : to_chars<digits...> {};
}

template<unsigned num>
struct num_to_string : detail::explode<num> {};

int main()
{
    printf("%s\n", num_to_string<1234567>::value);
}
