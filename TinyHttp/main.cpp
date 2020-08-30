#include <stdio.h>
#include <thread>
#include <vector>
#include "HTTP_impl.hpp"

int main(int argc, char* argv[])
{
  int port = Config::DEFAULT_PORT;
  if(argc == 2)
    port = atoi(argv[1]);

  HTTPDispatcherInstance.initialize(port); 
  
  std::array<HTTPService, Config::THREADS_NUM> HTTPServiceObjects;
  HTTPDispatcherInstance.allocateEventQueueForThread(HTTPServiceObjects);


  std::vector<std::thread> HTTPServiceThreads;
  for(auto& iter:HTTPServiceObjects)
  {
    HTTPServiceThreads.emplace_back(std::thread(&HTTPService::run, &iter));
  }

  HTTPDispatcherInstance.run();
  printf("Return from main thread\n");

  for(auto& iter:HTTPServiceThreads)
  {
    iter.join();
  }

  return 0;
}
