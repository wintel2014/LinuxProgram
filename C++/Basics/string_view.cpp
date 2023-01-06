#include <algorithm>
#include <vector>
#include <string_view>
#include <string>
#include <iostream>
std::vector<std::string> split(const std::string& str, const std::string& delims = " ")
{
    std::vector<std::string> output;
    auto first = std::cbegin(str);

    while (first != std::cend(str))
    {
        const auto second = std::find_first_of(first, std::cend(str), 
                  std::cbegin(delims), std::cend(delims));

        if (first != second)
            output.emplace_back(first, second);

        if (second == std::cend(str))
            break;

        first = std::next(second);
    }

    return output;
}

std::vector<std::string_view> splitSV(std::string_view strv, std::string_view delims = " ")
{
    std::vector<std::string_view> output;
    size_t first = 0;

    while (first < strv.size())
    {
        const auto second = strv.find_first_of(delims, first);

        if (first != second)
            output.emplace_back(strv.substr(first, second-first));

        if (second == std::string_view::npos)
            break;

        first = second + 1;
    }

    return output;
}


int main()
{
    std::string src="123 ABC 456 DEF 789 GHK";

    std::string_view str_v = src;
    auto ret1 = split(src);
    auto ret2 = splitSV(src);

    for(auto& item : ret1)
        std::cout<<item<<"-";
    std::cout<<"\n";

    for(auto& item : ret2)
        std::cout<<item<<"-";
    std::cout<<"\n";

}

