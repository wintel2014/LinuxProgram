/*
If expression evaluates to a null pointer value, no destructors are called, and the deallocation function may or may not be called (it's unspecified), 
but the default deallocation functions are guaranteed to do nothing when passed a null pointer.

If expression evaluates to a pointer to a base class subobject of the object that was allocated with new, 
the destructor of the base class must be virtual, otherwise the behavior is undefined.



The malloc() function allocates size bytes and returns a pointer to the allocated memory.  The memory is not initialized.  
If size is 0, then malloc() returns either NULL, or a unique pointer value that can later be successfully passed to free().

The  free()  function  frees the memory space pointed to by ptr, which must have been returned by a previous call to malloc(), calloc(), or realloc().
Otherwise, or if free(ptr) has already been called before, undefined behavior occurs.  If ptr is NULL, no operation is performed.

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
