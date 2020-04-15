#include <cassert>

template<typename T, size_t Capacity>
class OrderPool
{
public:
    OrderPool():mSize(0)
    {
        for(size_t i=0; i<Capacity; i++)
        {
            FreeSlots[i] = mData+i;
            mData[i] = T(); //prefault
        }
    }

    T* allocate()
    {
        if(full()) return nullptr;

        T* obj = FreeSlots[mSize++];
        return obj;
    }

    T* deallocate(T* const ptr)
    {
        assert(ptr >= mData);
        assert(ptr < mData+Capacity);

        FreeSlots[--mSize] = ptr;
    }

    bool full() {return mSize == Capacity; };
    
    constexpr static size_t capacity = Capacity;
private:
    T mData[Capacity];
    T* FreeSlots[Capacity];
    size_t mSize; //Obj is free >= FreeSlots+mSize
};
