#include <string.h>
#include <sys/mman.h>
#include <stack>
#include <iterator>
#include <iostream>
#include <algorithm>
#include <array>
#include <stdlib.h>
#include <assert.h>
#include <cstdlib>
#include <vector>
#include <bitop.hpp>
//#define DEBUG

template<size_t FIXED_SLICE_CNT=16*1024, size_t SLICE_SIZE=64>
class MemoryRingBuffer
{
public:
    MemoryRingBuffer()
    {
        mStorage = reinterpret_cast<char*>(std::aligned_alloc(64, MEM_TOTAL_BYTES));
        if(!mStorage)
        {
            perror("Failed to allocate memory:");
            exit(-1);
        }
        //printf("this=%p mStorage=%p\n",this, mStorage);
        memset(mStorage, 0, MEM_TOTAL_BYTES);
        memset(mFreeBitMap, 0, sizeof(mFreeBitMap));
    }

    ~MemoryRingBuffer()
    {
        std::free(mStorage);
    }

    template<size_t SIZE>
    void* acquire()
    {
        constexpr auto slices = (SIZE+SLICE_SIZE-1)/SLICE_SIZE; //Round2SliceSIZE<SIZE>();
        auto slot =0;
        if constexpr(slices==1)
            slot = Find();
        else
            slot = Find<slices>();
        if (slot)
        {
            BitmapOP<BITOP::SET>(slot-1, slices);
            return reinterpret_cast<void*>(mStorage+64*slot);
        }

        return nullptr;
    }
    

    template<size_t SIZE>
    void release(void* ptr)
    {
        auto slices = Round2SliceSIZE<SIZE>();
        auto diff = (reinterpret_cast<char*>(ptr) - reinterpret_cast<char*>(mStorage))/64;
        BitmapOP<BITOP::CLEAR>(diff-1, slices);
    }

    bool empty()
    {
        for(auto iter:mFreeBitMap)
        {
            if(ffzll(iter))
                return  false;
        }
        return true;
    }

    size_t size()
    {
        size_t zero_bits = 0;
        for(auto iter:mFreeBitMap)
            zero_bits += BitSetCount(~iter);
        return zero_bits;
    }

    size_t capacity()
    {
        return FIXED_SLICE_CNT;
    }

private:
    template<size_t SIZE>
    constexpr unsigned int Round2SliceSIZE()
    {
        return (SIZE+SLICE_SIZE-1)/SLICE_SIZE;
    }

    //0:No such bit is met requiremnt
    template <size_t SLICES>
    size_t Find() //bit pos count from 1
    {
        size_t * pBM = mFreeBitMap;
        size_t NR = tzcnt(mFreeBitMap[0]);
        size_t data;
        unsigned long BIT=0x1;
        size_t maxSoFar = 0, currentRet = 0;
        if(NR<SLICES)
        {
            for(int bit=0; bit<FIXED_SLICE_CNT; bit++)
            {
                auto shift = bit%64;
                if(shift==0)
                {
                    data = pBM[bit/64];
                }
                if((BIT<<shift) & data)
                {
                    currentRet = 0;
                }
                else
                {
                    maxSoFar = std::max(++currentRet, maxSoFar);
                    if(maxSoFar == SLICES)
                        return (bit+1-SLICES)+1; //bit pos count from 1
                }
            }
        }
        else
        {
            return 1;
        }
        return 0;
    }

    //return the first zero bit (0 means non-zero bit found)
    size_t Find() 
    {
        size_t NR=0;
        size_t ret = 0;
        for(size_t i=0; i<BITMAP_CNT; i++)
        {
            NR=ffzll(mFreeBitMap[i]);
            if(NR)
            {
                ret = i*64+NR;
                return ret;
            }
        }
        return 0;
    }

    enum BITOP
    {
        SET = 0,
        CLEAR
    };

    //....XXXXXXX XXXXXXXXXXXX XXXXXXXXX
    //0...30...63 64.......127 128...132
    //NR=30, bits=(64-30)+64+(132-128)=102   [30, 132)
    //leftOddBits=34 rightOddBits=4  bytes=(102-34)/64=1 
    template<BITOP op>
    void BitmapOP(size_t NR, size_t bits)
    {
        auto const endBit = NR+bits; //[NR, endbit) should be set
        auto pos = 0;
        auto bytes = 0;

        //process left odd bits        
        pos = NR/64;
        auto const leftEndBit = (NR/64+1)*64;
        for(auto i=NR; i<std::min(endBit,leftEndBit); i++)
        {
            auto bit = i&0x3F;
            if constexpr (op == BITOP::SET)
                set_bit(bit, mFreeBitMap+pos);
            else
                clear_bit(bit, mFreeBitMap+pos);
        }
        if(endBit<=leftEndBit) //In same "Long"
            return ;
        
        //continuos "long" bits
        pos++;
        bytes = endBit/64 - pos;
        for(auto i=pos; i<pos+bytes; i++)
        {
            if constexpr (op == BITOP::SET)
                mFreeBitMap[i] = 0xFFFFFFFFFFFFFFFFl;
            else
                mFreeBitMap[i] = 0x00;
        }

        //process right odd bits 
        pos += bytes;
        auto rightOddBits = endBit&0x3F;
        for(auto bit=0; bit<rightOddBits; bit++)
        {
            if constexpr (op == BITOP::SET)
                set_bit(bit, mFreeBitMap+pos);
            else
                clear_bit(bit, mFreeBitMap+pos);
        }
    }

    static constexpr unsigned long MEM_TOTAL_BYTES=FIXED_SLICE_CNT*SLICE_SIZE;
    static constexpr size_t BITMAP_CNT = FIXED_SLICE_CNT/sizeof(size_t)/8;

private:
    char* mStorage;
    size_t mFreeBitMap[BITMAP_CNT];  //0:Free 1:Allocated
};
