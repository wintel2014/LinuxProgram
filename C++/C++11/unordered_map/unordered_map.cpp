#include <unordered_map>
#include <iostream>

struct Base {
    Base()
    {
        std::cout<<"Empty Constructor\n";
    }
    Base(long i): mData(i) 
    {    };

    Base(const Base& b): mData(b.mData) 
    {    };
    Base(Base&& b): mData(b.mData) 
    {    };

    Base& operator=(const Base& b)
    {
        mData = b.mData;
    }
    Base& operator=(const Base&& b)
    {
        mData = b.mData;
    }

    long mData{1234};
};
int main()
{
    std::unordered_map<int, Base> M{{1,1234l}, {2, 1235l}, {3,1236l}};

    auto B = M.begin();
    auto E = M.end();

    M[4] = 1237l;
    M.emplace(5, 1238l);
    M.insert(std::pair<int, Base>(6, 1239l));
    while(B != E)
    {
        auto ret = B->first;
        B++;
    }
    auto iter = M.find(3);
    if(iter != M.end())
        M.erase(iter);
    return 0;
}
