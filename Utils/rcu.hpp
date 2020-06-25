#include <thread>
#include <atomic>
#include <vector>
#include <algorithm>
#include <mutex>

//Should defined in *.cpp
extern std::atomic<unsigned long> GlobalVersion;
extern thread_local std::atomic<unsigned long> CurrentVersionPerThread; //Keep the GlobalVersion for each thread, after read, reset to NoRCURead
extern std::vector<std::atomic<unsigned long> *> ContainerOfVersion;

/*
       Writer                         Reader1                                   Reader2                                 Reader3                             Release


    GlobalVersion=1
    
                               CurrentVersionPerThread = 
    tmp = new A()                   GlobalVersion //1

 

    *tmp = *gblPtr              
                        <------    Ptr = gblPtr //gblPtr version1


    func(temp)


    gblPtr = tmp
                                                                

                                                                                                                      CurrentVersionPerThread = 
                        <------------------------------------------------------------------------------------------     GlobalVersion //1
                                CurrentVersionPerThread =
                                    NoRCURead //0
                                                                                                                      Ptr = gblPtr //gblPtr version1 or version2!!!
    GlobalVersion+=1                                                                                                               //reorder is permited for Writer
          <------------------------------------------------------------- CurrentVersionPerThread = 
                                                                            GlobalVersion //2
                                                                         Ptr = gblPtr   
                                                                                                                      CurrentVersionPerThread = NoRCURead
                                                                         CurrentVersionPerThread = NoRCURead                                             <----------gblPtr[version1]
                                                                                                                                                          can be safely free now.       
                                                                                                
*/

void RegisterVersion()
{
    static std::mutex lock;
    std::lock_guard<std::mutex> _l(lock);
    ContainerOfVersion.push_back(&CurrentVersionPerThread);
}

enum RCUType
{
    Reader = 0,
    Writer
};

constexpr unsigned long NoRCURead = 0;
template<RCUType>
class RCU;

template<>
class RCU<RCUType::Reader>
{
public:
    void lock()
    {
        CurrentVersionPerThread.store(GlobalVersion.load(std::memory_order_acquire), std::memory_order_release);
        //printf("Reader lock: current=%ld ", CurrentVersionPerThread.load(std::memory_order_relaxed));
    }

    void unlock()
    {
        CurrentVersionPerThread.store(NoRCURead, std::memory_order_release);
        //CurrentVersionPerThread.fetch_add(1);
        //printf("Reader unlock: current=%ld \n", CurrentVersionPerThread.load(std::memory_order_relaxed));
    }
};


template<>
class RCU<RCUType::Writer>
{
public:
    void wait()
    {
        const auto tmp = GlobalVersion.fetch_add(1);
        while(1)
        {
            unsigned long LeastVersion = tmp+1;
            for(auto pVersion:ContainerOfVersion)
            {
                auto version = pVersion->load(std::memory_order_acquire);
                if(version != NoRCURead)//Only cares about the read-flying thread
                    LeastVersion = std::min(LeastVersion, version);
            }
            if (LeastVersion>tmp)
            {
                //printf("LeastVersion=%lu ", LeastVersion);
                break;
            }
        }
        
    }
};


