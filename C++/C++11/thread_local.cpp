#include <iostream>
#include <string>
#include <thread>
#include <mutex>
#include <stdio.h> 
#include <vector>
struct Buffer
{
    Buffer() {printf("Buffer Constructor\n"); }

    char mData[1024*1024];
};

thread_local unsigned int rage = 1; 
std::mutex cout_mutex;
 
void increase_rage(const std::string& thread_name)
{
    thread_local Buffer buf;
    ++rage; // modifying outside a lock is okay; this is a thread-local variable
    std::lock_guard<std::mutex> lock(cout_mutex);
    std::cout << "Rage counter for " << thread_name << ": " << rage << '\n';
}
 
int main()
{
    std::thread a(increase_rage, "a"), b(increase_rage, "b");
    std::thread c(increase_rage, "a"), d(increase_rage, "b");
 
 
    a.join();
    b.join();
    c.join();
    d.join();
}
