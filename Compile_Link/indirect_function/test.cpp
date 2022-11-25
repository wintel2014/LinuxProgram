/*
https://www.agner.org/optimize/blog/read.php?i=167
https://gcc.gnu.org/onlinedocs/gcc/Function-Attributes.html
*/


// Example of Gnu indirect function
#include <stdio.h>
#include <time.h>

// Define different versions of my function
int myfunc1() {
   return 1;
}

int myfunc2() {
   return 2;
}

// Prototype for the common entry point
extern "C" int myfunc();
__asm__ (".type myfunc, @gnu_indirect_function");

// Make the dispatcher function. This returns a pointer to the desired function version
typeof(myfunc) * myfunc_dispatch (void) __asm__ ("myfunc");
typeof(myfunc) * myfunc_dispatch (void)  {

   if (time(0) & 1) {
      // If time is odd at first call, use version 1
      return &myfunc1;
   }
   else {
      // else use version 2
      return &myfunc2;
   }
}

int main() {
   // Test the call to myfunc
   printf("\nCalled function number %i\n", myfunc());
   return 0;
}
