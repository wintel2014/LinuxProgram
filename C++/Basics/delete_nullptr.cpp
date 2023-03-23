/*
If expression evaluates to a null pointer value, no destructors are called, and the deallocation function may or may not be called (it's unspecified), 
but the default deallocation functions are guaranteed to do nothing when passed a null pointer.

If expression evaluates to a pointer to a base class subobject of the object that was allocated with new, 
the destructor of the base class must be virtual, otherwise the behavior is undefined.
*/

#include <stdio.h>
struct FOO{
    ~FOO() {printf("%p\n", this);}
};


int main()
{
    FOO *foo{};

    delete foo; 
    delete foo; 

    foo = new FOO();
    delete foo; 
}
