#pragma once

#include <unistd.h>
#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>
#include <string.h>
#include <sys/ioctl.h>
#include <asm/unistd.h>

#include <cassert>
#include <linux/perf_event.h>
#include <linux/hw_breakpoint.h>
#include <unordered_map>
#include <vector>
#ifndef __cpuid
#include <cpuid.h>
#endif
#include <sys/time.h>

#define BINLOG_TARGET_HOST 1
#define RDPMC_ENABLE  1

inline uint64_t rdtsc() {
    unsigned long rax, rdx;
    asm volatile ( "rdtsc\n" : "=a" (rax), "=d" (rdx));
    return (rdx << 32) + rax;
}
inline uint64_t rdtscp() {
    unsigned int aux;
    unsigned long rax, rdx;
    asm volatile ( "rdtscp\n" : "=a" (rax), "=d" (rdx), "=c" (aux));
    return (rdx << 32) + rax;
}

struct read_format {
    uint64_t nr;
    struct {
        uint64_t value;
        uint64_t id;
    } values[];
};

static long __attribute__((unused)) perf_event_open(struct perf_event_attr *hw_event, pid_t pid,
                            int cpu, int group_fd, unsigned long flags)
{
    int ret = syscall(__NR_perf_event_open, hw_event, pid, cpu, group_fd, flags);
    return ret;
}

using TimeSyncT=std::pair<timeval, size_t>;
namespace performance {
    constexpr size_t __M=1000*1000;
    inline uint64_t rdtscp() {
        unsigned int aux;
        unsigned long rax, rdx;
        asm volatile ( "rdtscp\n" : "=a" (rax), "=d" (rdx), "=c" (aux));
        return (rdx << 32) + rax;
    }
    inline uint64_t rdtsc() {
        unsigned int aux;
        unsigned long rax, rdx;
        asm volatile ( "rdtscp\n" : "=a" (rax), "=d" (rdx), "=c" (aux));
        return (rdx << 32) + rax;
    }
    static timeval operator+(const timeval& lhs, const timeval& rhs)
    {
        timeval tmp;
        tmp.tv_sec = lhs.tv_sec+rhs.tv_sec;
        auto usec = lhs.tv_usec + rhs.tv_usec;
        tmp.tv_sec += usec/__M;
        tmp.tv_usec = usec%__M;
    
        return tmp;
    }
    template<size_t Seconds=3>
    struct TscTimer
    {
    
        TscTimer()
        {
            auto start = rdtsc();
            usleep(Seconds*__M);
            auto gap = rdtsc()-start;
            mCyclesPerUs = ((double)gap/(Seconds*__M));
            printf("tsc=%ld, %lf cycles per us", gap, mCyclesPerUs);
    
            Calibrate();
    
            start = rdtsc();
            usleep(Seconds*__M);
            gap = rdtsc()-start;
            mCyclesPerUs = ((double)gap/(Seconds*__M+mSleepOverhead));
            printf("tsc=%ld, %lf cycles per us after calibration", gap, mCyclesPerUs);
    
            Sync();
        }
    
        void Calibrate()
        {
            int loop = 0;
            size_t gap = 0;
            while(loop++ < 50)
            {
                auto start = rdtsc();
                usleep(10);
                gap += rdtsc()-start;
            }
            mSleepOverhead = gap/mCyclesPerUs/loop-10;
            printf("gap=%ld, mCyclesPerUs=%lf, mSleepOverhead=%ld us", gap, mCyclesPerUs, mSleepOverhead);
    
            struct timeval tv;
            gettimeofday (&tv, nullptr);
            gap = 0;
            for(loop=0; loop<10; loop++)
            {
                auto start = rdtsc();
                start = rdtsc();
                gettimeofday (&tv, nullptr);
                gap += rdtsc()-start;
            }
            mGettimeOverhead = gap/loop/2;
            printf("gettimeofday consume %ld cycles", mGettimeOverhead);
        }
    
        void Sync()
        {
            gettimeofday(&mTimeSync.first, nullptr);
            mTimeSync.second = rdtsc()-mGettimeOverhead;
    
            //Show(mTimeSync.first);
        }
    
        static std::string StringTime(size_t tsc, const TimeSyncT& syncPoint, double MHz)
        {
            timeval nowByTsc{0, (tsc-syncPoint.second)/MHz};
            nowByTsc = nowByTsc+syncPoint.first;
            struct tm targetTime;
            localtime_r(&nowByTsc.tv_sec, &targetTime);
            char strTime[64];
            //strftime(strTime, sizeof(strTime), "%Y-%m-%d %H:%M:%S", &targetTime);
            auto size = strftime(strTime, sizeof(strTime), "%H:%M:%S", &targetTime);
            sprintf(strTime+size, ".%06ld", nowByTsc.tv_usec);
            return strTime;
        }
    
        static void Show(const timeval& tv)
        {
            struct tm localNow;
            localtime_r(&tv.tv_sec, &localNow);
            char strTime[32];
            strftime(strTime, sizeof(strTime), "%Y-%m-%d %H:%M:%S", &localNow);
            printf("%s.%s", strTime, std::to_string(tv.tv_usec).c_str());
        }

        void Now()
        {
            timeval nowByTsc{0, (rdtsc()-mTimeSync.second)/mCyclesPerUs};
            nowByTsc = nowByTsc+mTimeSync.first;
            Show(nowByTsc);
        }
        double mCyclesPerUs;
        size_t mSleepOverhead{0};
        size_t mGettimeOverhead{0};
        TimeSyncT mTimeSync;
    };

    inline auto& GetTscTimerInsance()
    {
        static TscTimer<5> timer;
        return timer;
    }


    //#define gettid() syscall(SYS_gettid)
    class PerfEvents
    {
    public:
        PerfEvents() 
        {
            mIndexMap.reserve(128);
        }
        template<uint32_t EVENT_TYPE, uint32_t EVENT_CONFIG, bool isGroupLeader>
        void open()
        {
        #if RDPMC_ENABLE>0
            uint64_t id;
            struct perf_event_attr pea;
            memset(&pea, 0, sizeof(struct perf_event_attr));
            pea.type = EVENT_TYPE;
            pea.size = sizeof(struct perf_event_attr);
            pea.config = EVENT_CONFIG;
            pea.disabled = 1;
            pea.exclude_kernel = 1;
            pea.exclude_hv = 1;
            pea.read_format = PERF_FORMAT_GROUP | PERF_FORMAT_ID;
            int fd = -1;
            if
#if __cplusplus >= 201703L
               constexpr
#endif
            (isGroupLeader)
            {
                mGroupFD = perf_event_open(&pea, gettid(), -1, -1, 0);
                fd = mGroupFD;
            }
            else
            {
                fd = perf_event_open(&pea, gettid(), -1, mGroupFD, 0);
            }
            if (fd == -1)
            {
                perror("Failed to perf_event_open");
                exit(EXIT_FAILURE);
            }

            if (ioctl(fd, PERF_EVENT_IOC_ID, &id)<0)
            {
                perror("Failed to ioctl");
                exit(EXIT_FAILURE);
            }
            mFDs.emplace_back(fd);
            mIDs.emplace_back(id);
        #else
            fprintf(stderr, "Can't support perf_evet on AMD server so far. please remove the function caller\n");
            exit(-1);
        #endif
        }
    
        bool matchEvent()
        {
            char buf[4096];
            int ret = read(mGroupFD, buf, sizeof(buf));
            if(ret < 0)
            {
                printf("Failed to read PMU event");
                return false;
            } 
    
            struct read_format* rf = (struct read_format*) buf;
            std::unordered_map<uint64_t, int> tmpMap;
            for(int index=0; index<mIDs.size(); index++)
            {
                auto event_id = mIDs[index];
                tmpMap[event_id] = index; //index of mIDs
            }
    
            for (uint64_t ind = 0; ind < rf->nr; ind++) 
            {
                mIndexMap[ tmpMap[rf->values[ind].id] ] = ind;
            } 
            
            readEvent(buf);
            return true;
        }
        
        template <size_t N>
        void readEvent(char (&buf)[N] )
        {
            read(mGroupFD, buf, sizeof(buf));
            struct read_format* rf = (struct read_format*) buf;
            for (auto ind = 0; ind < mIDs.size(); ind++) 
            {
                printf("%ld ", rf->values[mIndexMap[ind]].value);
            } 
            printf("\n");
        }
        int enable()
        {
            return ioctl(mGroupFD, PERF_EVENT_IOC_ENABLE, PERF_IOC_FLAG_GROUP);
        }
        
        int reset() 
        {
            return ioctl(mGroupFD, PERF_EVENT_IOC_RESET, PERF_IOC_FLAG_GROUP);
        }
    
        int disable()
        {
            return ioctl(mGroupFD, PERF_EVENT_IOC_DISABLE, PERF_IOC_FLAG_GROUP);
        }
        
        ~PerfEvents()
        {
            for(auto iter:mFDs)
                close(iter);
        }
    
        static void PMUInfo()
        {
            auto leaf_pmc = 0x0A;
            unsigned int EAX, EBX, ECX, EDX;
            auto ret = __get_cpuid (leaf_pmc, &EAX, &EBX, &ECX, &EDX);
            assert(ret==1);
            printf("PMU version=%d; %d GP counter/logical processor", EAX&0xFF, (EAX>>8)&0xFF);
        }
    
    private:
        std::vector<int> mIndexMap; //read_format id->index 
        int mGroupFD;
        std::vector<int> mFDs;
        std::vector<uint64_t> mIDs;
    };
    
    inline auto& perfEventsInstance()
    {
        //static PerfEvents eventsInstance;
        static thread_local PerfEvents eventsInstance;
        return eventsInstance;
    }
    
    inline void PerfEventInit()
    {
    #if RDPMC_ENABLE>0
        //perfEventsInstance().open<PERF_TYPE_HARDWARE, PERF_COUNT_HW_REF_CPU_CYCLES, true>();
        perfEventsInstance().open<PERF_TYPE_HARDWARE, PERF_COUNT_HW_CPU_CYCLES,    true>();
        perfEventsInstance().open<PERF_TYPE_HARDWARE, PERF_COUNT_HW_INSTRUCTIONS,   false>();
        perfEventsInstance().open<PERF_TYPE_HARDWARE, PERF_COUNT_HW_CACHE_MISSES,   false>();
        perfEventsInstance().open<PERF_TYPE_HARDWARE, PERF_COUNT_HW_BRANCH_MISSES,   false>();

        perfEventsInstance().open<PERF_TYPE_HARDWARE, PERF_COUNT_HW_CACHE_REFERENCES,   false>();
        perfEventsInstance().open<PERF_TYPE_HARDWARE, PERF_COUNT_HW_BRANCH_INSTRUCTIONS,   false>();
        //perfEventsInstance().open<PERF_TYPE_HARDWARE, PERF_COUNT_HW_STALLED_CYCLES_FRONTEND,   false>(); //Not reported by rdpmc ?
        //perfEventsInstance().open<PERF_TYPE_HARDWARE, PERF_COUNT_HW_STALLED_CYCLES_BACKEND,   false>();
        //perfEventsInstance().open<PERF_TYPE_SOFTWARE, PERF_COUNT_SW_PAGE_FAULTS_MIN,false>();
        perfEventsInstance().enable();
        perfEventsInstance().reset();
    #endif
    }

#if BINLOG_TARGET_HOST
    inline long readPMC(int index){
    #if RDPMC_ENABLE>0
        unsigned int eax=0, edx=0;
        int ecx=index; 
        __asm __volatile("rdpmc" : "=a"(eax), "=d"(edx) : "c"(ecx));
        return ((long long)eax) | (((long long)edx) << 32);
    #else
        return 0;
    #endif
    }

    inline long getRefCycles(){
        //unsigned int eax=0, edx=0;
        int ecx=(1<<30)+2; 
        return readPMC(ecx);
    }

    inline long getCycles(){
        //unsigned int eax=0, edx=0;
        int ecx=(1<<30)+1; 
        return readPMC(ecx);
    }

    inline long getInstructions(){
        //unsigned int eax=0, edx=0;
        int ecx=(1<<30)+0; 
        return readPMC(ecx);
    }
#endif

    inline double CPUCyclesPerus()
    {
        static double CyclesPerus = GetTscTimerInsance().mCyclesPerUs;
        return CyclesPerus;
    }

    template<std::size_t N>
    constexpr const char* baseNameImpl(const char(&str)[N], std::size_t pos)
    {
        return pos==0 ? str : (str[pos] == '/') ? str+pos+1 : baseNameImpl(str, --pos);
    }

    template<std::size_t N>
    constexpr const char* baseName(const char(&str)[N])
    {
        return baseNameImpl(str, N-1);
    }
    struct CPUInfo
    {
        static double CyclesPerUS;  //performance::CPUCyclesPerus();
    };

#define CPU_CYCLES_PER_US performance::CPUInfo::CyclesPerUS
    class LatencyRecord
    {
        public:
            LatencyRecord() : mInfo("") {}
            LatencyRecord(const char* info) : mStart(rdtsc()), mInfo(info) {}
            void updateEnd() {mEnd = rdtsc();}
            size_t cycles() const {return mEnd-mStart;}
            const char* info() const {return mInfo;}

        private:
            size_t mStart;
            size_t mEnd;
            const char*mInfo;
    };

    inline auto& LatencyRecordsInstance()
    {
        //FIXME find it out why 2 instances are generated in same thread in macli API
        static thread_local std::vector<LatencyRecord> LatencyRecords;
        return LatencyRecords;
    }
#if __cplusplus > 201402L
    class LatencyRecordGuard
    {
        public:
            LatencyRecordGuard(const char* info) : mRef(performance::LatencyRecordsInstance().emplace_back(info))
            {
            }
            ~LatencyRecordGuard() {mRef.updateEnd();}
        private:
           std::decay_t<decltype(LatencyRecordsInstance())>::reference mRef;
    };
#else
    class LatencyRecordGuard
    {
        public:
            LatencyRecordGuard(const char* info)
            {
                performance::LatencyRecordsInstance().emplace_back(info);
                mIndex = std::distance(performance::LatencyRecordsInstance().begin(),std::vector<performance::LatencyRecord>::iterator(&performance::LatencyRecordsInstance().back()));
            }
            ~LatencyRecordGuard() {performance::LatencyRecordsInstance()[mIndex].updateEnd();}
        private:
           long mIndex{-1};
    };
#endif

}

#ifdef ENABLE_LATENCY_MEASURE
#define STR_IMPL(x) #x
#define STR(x) STR_IMPL(x)
#define LOCATION __FILE__ ":" STR(__LINE__)
#define CONCAT_LOCATION(INFO) performance::baseName(LOCATION " " INFO)


#define RESERVE_LATENCY_RECORDS_NUM(N) performance::LatencyRecordsInstance().reserve(N)

#if __cplusplus > 201402L
//refine it by retrun ref
#define PUSH_BACK_LATENCY_RECORD(Info) \
    (performance::LatencyRecordsInstance().emplace_back(CONCAT_LOCATION(Info)), std::distance(performance::LatencyRecordsInstance().begin(), \
    std::vector<performance::LatencyRecord>::iterator(&performance::LatencyRecordsInstance().back())) )
#else
#define PUSH_BACK_LATENCY_RECORD(Info) \
    (performance::LatencyRecordsInstance().emplace_back(CONCAT_LOCATION(Info)), std::distance(performance::LatencyRecordsInstance().begin(), \
    std::vector<performance::LatencyRecord>::iterator(&performance::LatencyRecordsInstance().back())) )
#endif
#define UPDATE_RECORD_WITH_TSC(index)  { performance::LatencyRecordsInstance()[index].updateEnd(); }


#define LOG_LATENCY_INFO(FORMAT, ...) printf("LatencyProfile: " FORMAT, ##__VA_ARGS__)
//        LOG_LATENCY_INFO("There are %ld records", performance::LatencyRecordsInstance().size())
#define SHOW_LATENCY_RECORDS()                                                                        \
    do {                                                                                              \
        for(const auto& iter : performance::LatencyRecordsInstance())                                 \
        {                                                                                             \
            LOG_LATENCY_INFO("%s -> consumed %.2lf us", iter.info(), iter.cycles()/CPU_CYCLES_PER_US);\
        }                                                                                             \
        performance::LatencyRecordsInstance().clear();                                                \
    }while(0)

#define LATENCY_RECORD_GUARD(Info) performance::LatencyRecordGuard ___lrg_record(CONCAT_LOCATION(Info))

#else//ENABLE_LATENCY_MEASURE

#define RESERVE_LATENCY_RECORDS_NUM(N) 
#define PUSH_BACK_LATENCY_RECORD(Info) 0
#define LOG_LATENCY_INFO(FORMAT, ...)
#define UPDATE_RECORD_WITH_TSC(index) 
#define SHOW_LATENCY_RECORDS()
#define LATENCY_RECORD_GUARD(Info) 

#endif

inline void instruction_bench_for_LOG()
{
#if NABLE_RDPMC_IN_LINUX
//echo 2 | sudo tee /sys/devices/cpu/rdpmc 
//PerfEventInit
    auto start = performance::getInstructions();
    auto tsc1 = rdtsc();
    printf("%s","test");
    auto end = performance::getInstructions();
    LOG_LATENCY_INFO("%ld instructions are consumed(%lf us)", end-start, (rdtsc()-tsc1)/CPU_CYCLES_PER_US);

    start = performance::getInstructions();
    tsc1 = rdtsc();
    printf("%s %s","test", "test");
    end = performance::getInstructions();
    LOG_LATENCY_INFO("%ld instructions are consumed(%lf us)", end-start, (rdtsc()-tsc1)/CPU_CYCLES_PER_US);

    start = performance::getInstructions();
    tsc1 = rdtsc();
    printf("%s %lf","test", 1.123456);
    end = performance::getInstructions();
    LOG_LATENCY_INFO("%ld instructions are consumed(%lf us)", end-start, (rdtsc()-tsc1)/CPU_CYCLES_PER_US);

    start = performance::getInstructions();
    tsc1 = rdtsc();
    printf("%s %lf %d","test", 1.123456, 0x12345678);
    end = performance::getInstructions();
    LOG_LATENCY_INFO("%ld instructions are consumed(%lf us)", end-start, (rdtsc()-tsc1)/CPU_CYCLES_PER_US);

    start = performance::getInstructions();
    tsc1 = rdtsc();
    printf("%s %.32lf %d","test", 1.123456, 0x12345678);
    end = performance::getInstructions();
    LOG_LATENCY_INFO("%ld instructions are consumed(%lf us)", end-start, (rdtsc()-tsc1)/CPU_CYCLES_PER_US);
#endif
}
