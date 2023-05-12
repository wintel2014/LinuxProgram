#include <memory>
int main()
{
    auto ptr = new char;
    delete(ptr);

    * ptr = 'a';

}
