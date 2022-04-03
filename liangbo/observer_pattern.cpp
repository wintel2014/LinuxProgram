#include <thread>
#include <stdio.h>
#include <atomic>
#include <thread>
#include <mutex>
#include <vector>
#include <memory>
constexpr int CACHE_LINE_SIZE=64;

class spinlock 
{
public:
    spinlock() = default;
    spinlock(const spinlock&) = delete; 
    spinlock(spinlock&&) = delete; 
    spinlock& operator=(const spinlock&) = delete;
    spinlock& operator=(spinlock&&) = delete;

    void lock() 
    {  
        while (flag.test_and_set(std::memory_order_acquire)) 
        {
            asm volatile ("pause");
        }
    }
    void unlock() 
    { 
        flag.clear(std::memory_order_release);
    }
private:
    alignas(CACHE_LINE_SIZE) std::atomic_flag flag;
};

class Observer;
class Observable
{
public:
    Observable ()
    { mObservers.reserve(128); }
    void notifyObservers();
    void AddObserversNoLock(const std::shared_ptr<Observer>& observerPtr);

private:
    std::vector<std::shared_ptr<Observer>> mObservers;
    spinlock mLock;
};

class Observer: public std::enable_shared_from_this<Observer>
{
public:
    Observer () 
    {
       mObservables.reserve(128);
       mDeepModeIndex.reserve(128);
    }

    virtual void update(const Observable* ptr)
    {
        printf("Observer[%p]::update notified by %p\n", this, ptr);
    }

    void deep_update()  //通知所有被订阅的Observable，如其继承了Observer，则触发其虚函数update()
    {
        std::lock_guard<spinlock> l_(mLock);
        for(auto& index : mDeepModeIndex)
        {
            mObservables[index].second->update(mObservables[index].first.get());
        }
    }

    template <typename ObservableT>
    void subscribe(std::shared_ptr<ObservableT>& ptr)  //Same object may be subscribed in multiple threads
    {
        //static_assert(!std::is_base_of_v<decltype(*this), ObservableT>, "Only PURE Observer can subscribe observable");
        std::lock_guard<spinlock> l_(mLock);

        if(std::is_base_of_v<Observer, ObservableT>)
        {
            mDeepModeIndex.emplace_back(mObservables.size());
            mObservables.emplace_back(ptr, static_cast<Observer*>(ptr.get()));
        }
        else
        {
            mObservables.emplace_back(ptr, nullptr);
        }
        ptr->AddObserversNoLock(shared_from_this());
    }
private:
    std::vector<std::pair<std::shared_ptr<Observable>, Observer*>> mObservables;
    std::vector<size_t> mDeepModeIndex;
    spinlock mLock;
};


void Observable::notifyObservers()  //通知所有订阅的Observers，并触发Observer的虚函数update()
{
    std::lock_guard<spinlock> l_(mLock);
    for(auto& ObserverPtr:mObservers)
    {
        ObserverPtr->update(this);
    }
}
void Observable::AddObserversNoLock(const std::shared_ptr<Observer>& observerPtr)
{
    mObservers.push_back(observerPtr);
}


class Message : public Observable, public Observer
{

};

class User : public Observer
{

};

int main()
{
    auto msg1 = std::make_shared<Message>();
    auto msg2 = std::make_shared<Message>();
    auto user1 = std::make_shared<User>();
    auto user2 = std::make_shared<User>();
    auto user3 = std::make_shared<User>();

    user1->subscribe(msg1);
    user2->subscribe(msg1);
    user3->subscribe(msg1);
    user1->subscribe(msg2);
    user2->subscribe(msg2);
    user3->subscribe(msg2);

    printf("\n===========================msg1 notify==============================\n");
    msg1->notifyObservers();
    printf("=================================================================\n");

    printf("\n===========================msg2 notify==============================\n");
    msg2->notifyObservers();
    printf("=================================================================\n");

    printf("\n===========================deep_update==============================\n");
    user1->deep_update();
    printf("===========================deep_update==============================\n");
    
    return 0;
}
