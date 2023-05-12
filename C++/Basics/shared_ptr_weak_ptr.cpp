#include <iostream>
#include <memory>

void observe(std::weak_ptr<int> weak) 
{
    if (auto observe = weak.lock()) {
        if (observe)
            std::cout << "\tobserve() able to lock weak_ptr<>, value=" << *observe << "\n";
    } else {
        if (!observe)
            std::cout << "\tobserve() unable to lock weak_ptr<>\n";
    }
}

class Best : public std::enable_shared_from_this<Best>
{
public:
    std::shared_ptr<Best> getptr() {
        return shared_from_this();
    }
    // No public constructor, only a factory function,
    // so there's no way to have getptr return nullptr.
    [[nodiscard]] static std::shared_ptr<Best> create() {
        // Not using std::make_shared<Best> because the c'tor is private.
        return std::shared_ptr<Best>(new Best());
    }
private:
    Best() = default;
};

int main()
{
    std::weak_ptr<int> weak;
    std::cout << "weak_ptr<> not yet initialized\n";
    observe(weak);

    std::shared_ptr<double> tmp {new double{12345}};

    std::shared_ptr<Best> best0 = Best::create();
    std::shared_ptr<Best> best1 = best0->getptr();

    {
        auto shared = std::make_shared<int>(42);
        weak = shared;
        std::cout << "weak_ptr<> initialized with shared_ptr.\n";
        observe(weak);
    }

    std::cout << "shared_ptr<> has been destructed due to scope exit.\n";
    observe(weak);
}
