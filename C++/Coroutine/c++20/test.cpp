//原文链接：https://blog.csdn.net/johnnymartin/article/details/118639569
#include<iostream>
#include<coroutine>
struct future_type{
    struct promise_type;
    using co_handle_type = std::coroutine_handle<promise_type>;

    struct promise_type{
        promise_type(){
            std::cout<<"promise_type constructor"<<std::endl;
        }
        ~promise_type(){
            std::cout<<"promise_type destructor"<<std::endl;
        }
        auto get_return_object(){
            std::cout<<"get_return_object"<<std::endl;
            return co_handle_type::from_promise(*this);
        }
        auto initial_suspend(){
            std::cout<<"initial_suspend"<<std::endl;
            return std::suspend_always();
        }
        auto final_suspend() noexcept(true) {
            std::cout<<"final_suspend"<<std::endl;
            return std::suspend_always();
        }
        void return_void(){
            std::cout<<"return_void"<<std::endl;
        }
        void unhandled_exception(){
            std::cout<<"unhandled_exception"<<std::endl;
            std::terminate();
        }
    };

    future_type(co_handle_type co_handle){
        std::cout<<"future_type constructor"<<std::endl;
        co_handle_ = co_handle;
    }
    ~future_type(){
        std::cout<<"future_type destructor"<<std::endl;
        co_handle_.destroy();
    }
    //future_type(const future_type&) = delete;
    //future_type(future_type&&) = delete;

    bool resume(){
        if(!co_handle_.done()){
            co_handle_.resume();
        }
        return !co_handle_.done();
    }
    private:
    co_handle_type co_handle_;
};

future_type three_step_coroutine(){
    std::cout<<"three_step_coroutine begin"<<std::endl;
    co_await std::suspend_always();
    std::cout<<"three_step_coroutine running"<<std::endl;
    co_await std::suspend_always();
    std::cout<<"three_step_coroutine end"<<std::endl;
}
int main(){
    future_type ret = three_step_coroutine(); 
    std::cout<<"=======calling first resume======"<<std::endl;
    ret.resume();
    std::cout<<"=======calling second resume====="<<std::endl;
    ret.resume();
    std::cout<<"=======calling third resume======"<<std::endl;
    ret.resume();
    std::cout<<"=======main end======"<<std::endl;

    return 0;
}
