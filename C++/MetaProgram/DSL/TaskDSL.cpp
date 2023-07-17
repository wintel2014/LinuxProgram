/*************************************************************************
    > File Name: TaskDSL.cpp
    > Author: Netcan
    > Descripton: TaskDSL
    > Blog: https://netcan.github.io/
    > Mail: 1469709759@qq.com
    > Created Time: 2020-08-14 20:57

https://github.com/netcan/recipes.git
https://netcan.github.io/2020/08/30/C-%E5%85%83%E7%BC%96%E7%A8%8B%E4%B9%8B%E4%BB%A3%E7%A0%81%E7%94%9F%E6%88%90%EF%BC%9A%E8%AE%BE%E8%AE%A1%E5%B9%B6%E5%AE%9E%E7%8E%B0%E6%8B%93%E6%89%91%E7%BB%93%E6%9E%84DSL/
************************************************************************/
#include <tuple>
#include <cstdio>
#include "Typelist.hpp"

//////////////////////////////////////////////////////////////////
// TaskDSL Implementation
template<auto J>
struct JobWrapper {
    void operator()() {
        return J();
    }
};

template<typename LINK>
struct Connection {};

template<typename Job1, typename Job2>
struct Connection<auto(*)(Job1) -> auto(*)(Job2) -> void> {
    using FROM = Job1;
    using DST = Job2;
};

template <typename... LINKS>
class Task {
    class JobDescendantsMap {
        template<typename Con>
        struct GetFrom: Return<typename Con::FROM> { };
        template<typename Con>
        struct GetDst: Return<typename Con::DST> { };

        using Connections = Unique_t<TypeList<Connection<LINKS>...>>; // remove same edge
        using FromJobs = Map_t<Connections, GetFrom>;
        using DstJobs = Map_t<Connections, GetDst>;
        using AllJobs = Unique_t<Concat_t<FromJobs, DstJobs>>;

        template<typename J>
        class FindJobDescendants {
            template<typename C> struct Dependency:
                std::is_same<typename GetFrom<C>::type, J> { };
            using JobDescendants = Filter_t<Connections, Dependency>;
        public:
            struct type {
                using Job = J;
                using Descendants = Map_t<JobDescendants, GetDst>;
            };
        };
    public:
        using type = Map_t<AllJobs, FindJobDescendants>;
    };

    // [<Job, Descendants>]
    using JobDescendantsMap_t = typename JobDescendantsMap::type;

    class SortedJobs {
        template<typename DECENDS>
        class FindAllDescendants {
            template<typename ACC, typename Job>
            struct AppendDes {
                template <typename DEP> struct JDepsCond:
                    std::is_same<typename DEP::Job, Job> {};
                using DepsResult = FindBy_t<JobDescendantsMap_t, JDepsCond>; // 从邻接表查找Job的后继节点列表

                using type = Concat_t<typename ACC::template append<Job>,
                      typename FindAllDescendants<typename DepsResult::Descendants>::type>;
            };
        public:
            using type = FoldL_t<DECENDS, TypeList<>, AppendDes>;
        };

        template<typename DEP>
        struct FindJobAllDescendants {
            struct type {
                using Job = typename DEP::Job;
                using AllDescendants =
                    typename FindAllDescendants<typename DEP::Descendants>::type;
            };
        };

        template<typename DEP> struct GetJob: Return<typename DEP::Job> { };

        using JobAllDescendantsMap = Map_t<JobDescendantsMap_t, FindJobAllDescendants>;

        template<typename LHS, typename RHS>
        struct JobCmp: Elem<typename LHS::AllDescendants, typename RHS::Job> { };
    public:
        using type = Map_t<typename Sort<JobAllDescendantsMap, JobCmp>::type, GetJob>;
    };

    template<typename ...Jobs>
    struct Runable { };

    template<auto ...J>
    struct Runable<JobWrapper<J>...> {
        static constexpr void Run() {
            return (JobWrapper<J>{}(),...);
        }
    };

public:
    constexpr void Run() {
        using Jobs = typename SortedJobs::type::template exportTo<Runable>;
        return Jobs::Run();
    }
};

#define __task(...) Task<__VA_ARGS__>{}
#define __job(job) auto(*) (JobWrapper<job>)
#define __link(link) link -> void

//////////////////////////////////////////////////////////////////
// TaskDSL Usecase

void Meat()
{ puts("Source"); }
void Garnish()
{ puts("Garnish"); }
void Plating()
{ puts("Plating"); }
void Servce1()
{ puts("Service1"); }
void Servce2()
{ puts("Service2"); }
/*
task dependencies
    Garnish   Meat
       |       /
       |      /
       |     /
       v    /
    plating 
       /\
      /  \
Service1 Service2

Source
Garnish
Plating
Service1
Service2

*/
int main(int argc, char** argv) {
#if 0
    __task(
        __link(__job(Plating) -> __job(Servce1)),
        __link(__job(Meat)    -> __job(Plating)),
        __link(__job(Plating) -> __job(Servce2)),
        __link(__job(Garnish) -> __job(Plating))).Run();
#else
    /* auto(*) (JobWrapper<Plating>) -> auto(*) (JobWrapper<Servce1>) -> void,
        1. auto(*) (JobWrapper<Servce1>) -> void    :  trail return type
            function ptr &&return type is "void", void (*)  (JobWrapper<Servce1>)
        2. auto(*) (JobWrapper<Plating>) -> void (*)  (JobWrapper<Servce1>)
            return type is "function ptr",  void (* (*)(JobWrapper<Plating>) )(JobWrapper<Servce1>)
    */

    Task<auto(*) (JobWrapper<Plating>) -> auto(*) (JobWrapper<Servce1>) -> void, 
         auto(*) (JobWrapper<Plating>) -> auto(*) (JobWrapper<Servce2>) -> void,
         auto(*) (JobWrapper<Meat>) -> auto(*) (JobWrapper<Plating>) -> void,
         auto(*) (JobWrapper<Garnish>) -> auto(*) (JobWrapper<Plating>) -> void
    >{}.Run();
#endif
    return 0;
}
