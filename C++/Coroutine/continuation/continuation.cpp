#include <immintrin.h>
#include <iostream>
#include <boost/context/all.hpp>
namespace ctx = boost::context;

/*
callcc() expects a context-function with signature 'continuation(continuation && c)'. The parameter c represents the current continuation from which this continuation was resumed (e.g. that has called callcc()).
On return the context-function of the current continuation has to specify an continuation to which the execution control is transferred after termination of the current continuation.
*/
int main()
{
  ctx::continuation source = ctx::callcc(
      [](ctx::continuation&& cc) //represents the current continuation from which this continuation was resumed 
      {
        int count = 0;
        while(true)
        {
          cc = cc.resume();
          std::cout<< count++ <<"\n";
        }
        return std::move(cc);
      }
  );

  for(int i=0; i<10; i++)
  {
    source = source.resume();
  }
}
