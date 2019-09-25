//https://gcc.gnu.org/onlinedocs/gcc/Instrumentation-Options.html
//https://github.com/google/sanitizers/wiki/AddressSanitizer
#include <stdlib.h>
int main() {
  char *x = (char*)malloc(10 * sizeof(char*));
  free(x);
  return x[5];
}
