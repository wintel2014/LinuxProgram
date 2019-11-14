#include <mutex>
#include <atomic>
#include <thread>

class Singleton {
  public:
    //Singleton() = delete;
    static Singleton* getInstance();
  private:
    Singleton() {};
    static std::atomic<Singleton*> mInstance;
    static std::mutex mMutex;

};


std::atomic<Singleton*> Singleton::mInstance;
std::mutex Singleton::mMutex;

Singleton* Singleton::getInstance() {
    Singleton* tmp = mInstance.load(std::memory_order_acquire); 
    if (tmp == nullptr) {
        std::lock_guard<std::mutex> lock(mMutex);
        tmp = mInstance.load(std::memory_order_relaxed);
        if (tmp == nullptr) {
            tmp = new Singleton;
            mInstance.store(tmp, std::memory_order_release);
        }
    }
    return tmp;
}

int main()
{
    auto st = Singleton::getInstance();
}
