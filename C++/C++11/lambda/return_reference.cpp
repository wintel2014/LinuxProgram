#include <functional>
#include <iostream>

/*
1. lambda::operator()() const is "const member function" by default
2.  lambda::operator()() const : return_type is value by default. if reference is required, trailing-return-type is needed
*/ 
int main() {
    int x = 42;
   
    // 使用按值捕获
    /*
        (gdb) ptype valueCapture
        type = struct <lambda()> {
            int __x;
        }
    */
    auto valueCapture = [x]()mutable-> const int&{
        x = 10; 
        return x;
    };

    const int& m = valueCapture();
    std::cout <<&m <<"--"<<&valueCapture <<'\n';

    
    auto valueCapture2 = [x]()mutable {
        x = 10; 
        return x;
    };
    const int& m2 = valueCapture2();
    std::cout <<&m2<<"--"<<&valueCapture2 <<'\n';


    // x is located in std::function f_instance
    std::function<const int&()> f_instance( [x] ()-> const int& {return x;}
                                 );
    const int& m3 = f_instance();
    std::cout <<&m3<<"--"<<&f<<"\n";

    /*
        (gdb) ptype valueCapture
        type = struct <lambda()> {
            int &__x;
        }
    */

    auto referenceCapture = [&x](){
        x = 10; 
        return x;
    };

    return 0;
}

