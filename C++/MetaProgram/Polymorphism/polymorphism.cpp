#include <iostream>
#include <type_traits>
#include <functional>
#include <memory>

template<auto &Callable, class Sig = void()>
class BindCaller;

template<auto &Callable, class Ret, class... Args>
class BindCaller<Callable, Ret(Args...)> {
    public:
        template<
            class T,
                  std::enable_if_t<std::is_invocable_r_v<Ret, decltype(Callable), T, Args...> && !std::is_same_v<BindCaller, std::decay_t<T>>, bool> = true
                      >
                      BindCaller(T &&t)
                      : pInstance((void *) std::addressof(t)),
                      pCaller([](void *pObj, Args &&...args) {
                              return std::invoke(Callable,
                                      std::forward<T>(*static_cast<std::remove_reference_t<T>*>(pObj)),
                                      std::forward<Args>(args)...);}
                             )
                      { }

        Ret operator()(Args &&...args) const {
            return pCaller(pInstance, std::forward<Args>(args)...);
        }
    private:
        void *pInstance;
        Ret(*pCaller)(void *, Args &&...);
};

class Binder {
    private:
        static constexpr auto callerAdapter = [](auto &&elem) -> void { elem.process(); };
        BindCaller<callerAdapter> BinderObj;
    public:
        explicit Binder(BindCaller<callerAdapter> a) : BinderObj(a) {}
        void process() const { BinderObj(); }
};

template<typename T>
void process(T&& arg)
{
    Binder(std::forward<T>(arg)).process();  
    std::cout<<"----------------------\n";
}

struct MessageCommon{
    void process() { std::cout << "Common\n"; }
};
struct Message1 : MessageCommon {
    using Base = MessageCommon;
    void process() { 
        Base::process();
        std::cout << "Message1\n"; 
    }
};
struct Message2 : MessageCommon {
    using Base = MessageCommon;
    void process() { 
        Base::process();
        std::cout << "Message2\n"; 
    }
};

int main()
{
    process(MessageCommon{});
    process(Message1{});
    process(Message2{});
}
