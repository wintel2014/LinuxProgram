#include "../../Utils/affinity.hpp"
#include <vector>
#include <thread>
#include <stdio.h>
#include <sys/mman.h>

volatile char* c = (char*) mmap(nullptr, 7, PROT_READ|PROT_WRITE|PROT_EXEC, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0);

/*
  main thread          modify thread
mov    $0x0,%eax     <-------
ret
*/
int main()
{

  c[0] = 0b11000111; //0xc7 mov
  c[1] = 0b11000000; //0xc0
  //c[2] = ImmediateNumber
  c[6] = 0b11000011; //ret

  auto t = std::thread([](){
                            SetAffinity(0);
                            while(1)
                            {
                              //for(volatile int i=0; i<100; i++);
                              c[2]++;
                            }}
           );
  SetAffinity(1);
  std::vector<unsigned char> v;
  while(1)
  {
    v.clear();
    for(int i=0; i<32; i++)
      v.push_back(((unsigned char(*)(void))c) ());

    for(auto iter:v)
      printf("%d ", iter);
    printf("\n");
  }
  t.join();
}
