#include <stdio.h>
#include <iostream>
#include <string>
#include <thread>
#include <mutex>
 
thread_local unsigned int rage = 1; 
std::mutex cout_mutex;
 
void increase_rage(const std::string& thread_name)
{
    ++rage; // modifying outside a lock is okay; this is a thread-local variable
    printf("tls addr: %p\n", &rage);
    std::cout<<"Coredump now\n";
    *(int*)0x777deadaddd = 0;
}
 
int main()
{
    std::thread a(increase_rage, "a"), b(increase_rage, "b");
 
    a.join();
    b.join();
    std::cout << "Rage counter for main: " << rage << '\n';

}
