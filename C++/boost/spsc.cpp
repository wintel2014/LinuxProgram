#include <boost/lockfree/spsc_queue.hpp>
#include <iostream>
#include <type_traits>

#include <atomic>
#include <thread>

struct Foo
{
    Foo () = default;
    Foo(int i) : mValue{i}
    {
        printf("value=%d %s\n", mValue,  __PRETTY_FUNCTION__);
    }

    ~Foo()
    {
        printf("value=%d %s\n", mValue,  __PRETTY_FUNCTION__);
    }

    int mValue;
};

int producer_count = 0;
std::atomic<int> consumer_count (0);

boost::lockfree::spsc_queue<Foo, boost::lockfree::capacity<1024> > spsc_queue;

static_assert(std::is_standard_layout_v<boost::lockfree::detail::ringbuffer_base<Foo>>);
const int iterations = 10000000;

void producer(void)
{
    for (int i = 0; i != iterations; ++i) {
        int value = ++producer_count;
        while (!spsc_queue.push(value))
            ;
    }
}

std::atomic<bool> done (false);

void consumer(void)
{
    Foo value;
    while (!done) {
        while (spsc_queue.pop(value))
            ++consumer_count;
    }

    while (spsc_queue.pop(value))
        ++consumer_count;
}

int main(int argc, char* argv[])
{
    using namespace std;
    cout << "boost::lockfree::queue is ";
    if (!spsc_queue.is_lock_free())
        cout << "not ";
    cout << "lockfree" << endl;
    //printf("storage size=%ld", sizeof(typename decltype(spsc_queue)::storage_type));

    std::thread producer_thread(producer);//producer
    std::thread consumer_thread(consumer);//consumer

    producer_thread.join();
    done = true;
    consumer_thread.join();

    cout << "produced " << producer_count << " objects." << endl;
    cout << "consumed " << consumer_count << " objects." << endl;
    getchar();
}
