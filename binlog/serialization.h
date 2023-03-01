#ifndef UBIQ_SERIALIZATION_HH
#define UBIQ_SERIALIZATION_HH

#include <utility>
#include <iostream>
#include <stdio.h>
#include <array>
#include <map>
#include <memory>
#include <utility>
#include <type_traits>
#include <cassert>
#include <unistd.h>
#include <string.h>
#include <boost/type_index/ctti_type_index.hpp>
#include <boost/mpl/vector.hpp>
#include <tuple>
#include <boost/mpl/for_each.hpp>
#include <utility>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include "SPSCQueue.h"
#include <orderexpress.h>
#include <nanolog/ubiqlog_new.h>

#include <sys/types.h>
#include <unistd.h>
#include <sys/syscall.h>
#include <condition_variable>
#include <boost/lockfree/queue.hpp>
#include <thread>
#include <chrono>
#include <ubiq_exception.h>



#define CREATE_EVENT_ID(ID, SEVERITY, FORMAT, CLASS) \
do { \
    static constexpr auto d = custom::Serializer<CLASS>::tag(); \
  __asm__ __volatile( \
            ".pushsection \"EVENTSECTION\",\"wa?\",@progbits" "\n"\
            "0:\n"\
            ".quad 0b, %c1, %c2, %c3, %c4, %c5, %c6, 0"      "\n"\
            ".popsection \n"                       \
            "lea{q} {0b(%%rip), %0 | %0, 0b(%%rip)}" "\n" \
            :"=r" (ID)\
            :"i" (__FILE__), \
             "i" (__FUNCTION__),\
             "i" (SEVERITY),\
             "i" (__LINE__),\
             "i" (FORMAT),\
             "i" (toString(d))\
  );\
} while(0)

struct alignas(64) EventDesc
{
    size_t mEventID;
    char*  mFile;
    char*  mFunc;
    char*  mLevel;
    long   mLineNo;
    char*  mFormat;
    char*  mClassTag;

    void Show()
    {
        printf("Origin EventDesc:\n");
        printf("\t%lx\n",mEventID);
        printf("\t%s\n",mFile);
        printf("\t%s\n",mFunc);
        printf("\t%s\n",mLevel);
        printf("\t%ld\n",mLineNo);
        printf("\t%s\n",mFormat);
        printf("\t%s\n",mClassTag);
    }

    bool operator ==(const EventDesc& rhs)
    {
        return (strcmp(mFile, rhs.mFile)==0) &&
               (strcmp(mFunc, rhs.mFunc)==0) &&
               (strcmp(mLevel, rhs.mLevel)==0) &&
               (mLineNo == rhs.mLineNo)    &&
               (strcmp(mFormat, rhs.mFormat)==0) &&
               (strcmp(mClassTag, rhs.mClassTag)==0);
    }
};
static_assert(sizeof(EventDesc)==64, "Should aligned by 64 bytes");

//The __start_EVENTSECTION only existed in the binary that declares UBI_LITERAL_LOG_INFO
#ifndef EXCLUDE_EVENTSECTION_FROM_RECOVERY 
extern EventDesc __start_EVENTSECTION;
extern EventDesc __stop_EVENTSECTION;
#define INDEX_OF_EVENT(EVENT_ID) (reinterpret_cast<size_t>(EVENT_ID))
#endif

#define INIT_EVENT_SECTION() \
    __attribute__((constructor))void ___DUMP_EVENT_SECTION_TO_BINLOG_INIT()\
    {\
        LiteralLogManagerInstance().ParseEventSection();\
    }\

#define DUMP_EVENT_SECTION()                        \
do{                                                 \
    LiteralLogManagerInstance().ParseEventSection();\
}while(0)

#if BINLOG_TARGET_HOST
#define UBI_LITERAL_LOG_INFO(FORMAT, TYPE, ...)                      \
do {                                                        \
    size_t EventID, nextHead;                               \
    CREATE_EVENT_ID(EventID, "INFO", FORMAT, TYPE);         \
    LogEntry& logRaw = LiteralLogManagerInstance().LogBuffer().get_cell(nextHead);      \
    static size_t index = INDEX_OF_EVENT(EventID);          \
    new(&logRaw) LogEntry(index, gLogInfoTLS.mThreadID);     \
    TYPE& obj = *reinterpret_cast<TYPE*>(logRaw.mBuffer);    \
    new(&obj) TYPE{__VA_ARGS__};                            \
    logRaw.mHead.mBufferLength = sizeof(TYPE);                    \
    LiteralLogManagerInstance().LogBuffer().advance_head(nextHead);                     \
}while(0)

#define UBI_LITERAL_LOG_META(ptr)                      \
do {                                                        \
    LogEntry& logRaw = LiteralLogManagerInstance().LogBuffer().get_cell(nextHead);      \
    new(&logRaw) EventDescDump(*ptr);     \
    LiteralLogManagerInstance().LogBuffer().advance_head(nextHead);                     \
}while(0)

//printf("Decalare EventID=0x%lx index=%lx, EVENTSECTION=%p\n", EventID, index, &__start_EVENTSECTION); 
//The following 2 APIs should be used in pairs
#define UBI_LITERAL_LOG_DECLARE(FORMAT, obj, nextHead)      \
do {                                                        \
    size_t EventID;                                         \
    using TYPE=std::remove_reference_t<decltype(*obj)>;     \
    CREATE_EVENT_ID(EventID, "INFO", FORMAT, TYPE);         \
    LogEntry& logRaw = LiteralLogManagerInstance().LogBuffer().get_cell(nextHead);      \
    static size_t index = INDEX_OF_EVENT(EventID);          \
    new(&logRaw) LogEntry(index, gLogInfoTLS.mThreadID);     \
    obj = reinterpret_cast<TYPE*>(logRaw.mBuffer);    \
    logRaw.mHead.mBufferLength = sizeof(TYPE);               \
}while(0)


#define UBI_LITERAL_LOG_COMMIT(nextHead)                     \
do {                                                        \
    LiteralLogManagerInstance().LogBuffer().advance_head(nextHead);                     \
}while(0)
#else

#define UBI_LITERAL_LOG_INFO(FORMAT, TYPE, ...)
#define UBI_LITERAL_LOG_DECLARE(FORMAT, obj, nextHead)
#define UBI_LITERAL_LOG_COMMIT(nextHead)
#define DUMP_EVENT_SECTION()
#endif

namespace Common {
    template<typename>
    struct Type;

    template<>
    struct Type<char>
    {
        static constexpr char value_type[3]{"C|"};
    };
    template<>
    struct Type<int>
    {
        static constexpr char value_type[3]{"I|"};
    };
    template<>
    struct Type<double>
    {
        static constexpr char value_type[3]{"D|"};
    };
    template<>
    struct Type<long>
    {
        static constexpr char value_type[3] {"L|"};
    };

    template<size_t N>
    struct Type<char[N]>
    {
        static constexpr char value_type[4] {"CA|"};
    };
}

namespace literal{

    template <size_t N>
    using CharArray = const char (&)[N];
    template <size_t N>
    struct literalString
    {
        const char mData[N] {0};
        operator std::string() {return std::string(mData);}
    };

    constexpr size_t const_len(const char* ptr)
    {
        return (ptr[0]=='\0') ? 0 : const_len(ptr+1)+1;
    }

    template<size_t N>
    constexpr CharArray<N> toString(const literalString<N>& str) {return str.mData;}
        //total_len("12", "345") => 6, so array[6]="12345"
        template <typename... Arrays>
        constexpr size_t total_len()
        {
            auto size = ((sizeof(Arrays)-1)+...);
            return size+1;
        }

        template<size_t N, std::size_t... I>
        constexpr literalString<N> toLiteralString(const char(&src)[N], std::index_sequence<I...>)
        {
            return literalString<N>{{src[I]...}};
        }
        template<size_t N, std::size_t... I>
        constexpr literalString<N> toLiteralString(const char*src, std::index_sequence<I...>)
        {
            return literalString<N>{{src[I]...}};
        }

        template <typename... Args>
        constexpr auto concat(const Args&... args)
        {
            constexpr auto size = total_len<Args ...>();
            char NewArray[size] = {0};
            auto NewArrayPtr = NewArray;
            const char* srcArray[] = {args...};

            size_t ArrayLen[] = {sizeof(args)...};
            for(size_t i=0; i<sizeof...(args); i++)
            {
                auto src = srcArray[i];
                for(size_t j=0; j<ArrayLen[i]&&src[j]; ++j)
                    *NewArrayPtr++ = src[j];
            }
            return toLiteralString(NewArray, std::make_index_sequence<size-1>{});
        }
}


template<typename Head, typename... Left>
struct MaxSize
{
    static constexpr size_t value = std::max(sizeof(Head), MaxSize<Left...>::value);
};
template<typename Arg>
struct MaxSize<Arg>
{
    static constexpr size_t value = sizeof(Arg);
};


struct Demo
{
    int A;
    double B;
    long C;
};

struct LogEntryHead
{
    size_t    mEventID;
    size_t    mBufferLength; //payload's length
    size_t    mTsc;
    long      mTID;
};
struct LogEntry
{
    static unsigned long rdtscp() {
        unsigned int aux;
        unsigned long rax, rdx;
        //asm volatile ( "rdtscp\n" : "=a" (rax), "=d" (rdx), "=c" (aux));
        asm volatile ( "rdtsc\n" : "=a" (rax), "=d" (rdx), "=c" (aux));
        return (rdx << 32) + rax;
    }
    LogEntry() = default;
    LogEntry(size_t EventID, long ThreadID)
    {
        mHead.mEventID = EventID;
        mHead.mTsc = rdtscp();
        mHead.mTID = ThreadID;
    }

    LogEntryHead mHead;
    //unsigned mPayloadSize;
    char mBuffer[256];
    long TID() {return mHead.mTID;};
    short bufferLength() {return mHead.mBufferLength;}
    size_t entryLength() {return sizeof(LogEntryHead)+mHead.mBufferLength;}
};
//static_assert(sizeof(LogEntry)<=256, "Buffer should be less than the TBPortal Max Unit size");
struct LogInfoPerThread
{
    static constexpr size_t ENTRY_SIZE = 4096;
    using SPSCQueueT = SPSCQueue<LogEntry, ENTRY_SIZE>;
    SPSCQueueT mLogBuffer;
    long mThreadID{syscall(SYS_gettid)};
    bool mRegistered{false};

    bool empty()
    {
        return mLogBuffer.empty();
    }
    bool isRegistered()
    {
        return mRegistered;
    }
    void Register()
    {
        mRegistered = true;
    }
};

namespace custom {
    template <typename>
    struct Serializer;
    struct Deserializer
    {
      virtual void Translate2String(char*dest, char*src) = 0;
    };
    template <typename T>
    struct StructDeserializer;

    template<typename T>
    constexpr const char* TYPE_NAME()
    {
        return boost::typeindex::ctti_type_index::type_id_with_cvr<T>().name();
    }

    #define TYPE_NAME_ARRAY(DATA_TYPE) \
     literal::toLiteralString<literal::const_len(custom::TYPE_NAME<DATA_TYPE>())+1>(custom::TYPE_NAME<DATA_TYPE>(), std::make_index_sequence<literal::const_len(custom::TYPE_NAME<DATA_TYPE>())+1>{}).mData

    #define DECLARE_BINLOG_CLASS(TYPE)                  \
        template <>                                     \
        struct Serializer<TYPE>        \
        {                                               \
            static constexpr auto tag()                 \
            {                                           \
                constexpr auto d = literal::concat(     \
                          TYPE_NAME_ARRAY(TYPE)         \
                        );                              \
                return d;                               \
            }                                           \
        };                              

    #define DEFINE_EMPTY_TRANSLATE_FUN(TYPE)                            \
    template <>                                                         \
    struct StructDeserializer<TYPE> : public Deserializer \
    {                                                                   \
      void Translate2String(char*dest, char*src) final                  \
      { }                                                               \
    }; 

    #define DECLARE_BUILTIN_TYPE(TYPE, OUTPUTFORMAT)                \
        DECLARE_BINLOG_CLASS(TYPE);                                 \
        template <>                                                 \
        struct StructDeserializer<TYPE> : public Deserializer       \
        {                                                           \
          void Translate2String(char*dest, char*src) final          \
          {                                                         \
            auto pData = reinterpret_cast<TYPE*>(src);              \
            sprintf(dest, OUTPUTFORMAT, *pData);                    \
          }                                                         \
        };      

    DECLARE_BUILTIN_TYPE(char, "%c")
    DECLARE_BUILTIN_TYPE(int, "%d")
    DECLARE_BUILTIN_TYPE(double, "%lf")
    DECLARE_BUILTIN_TYPE(long, "%ld")
    DECLARE_BUILTIN_TYPE(size_t, "%lu")
    #define SUPPORT_BUILTIN_TYPES char,int,double,long,size_t

    template <>
    struct Serializer<Demo>
    {
        static constexpr auto tag()
        {
            constexpr auto d = literal::concat(
                    "A|", Common::Type<decltype(Demo::A)>::value_type,
                    "B|", Common::Type<decltype(Demo::B)>::value_type,
                    "C|", Common::Type<decltype(Demo::C)>::value_type,
                    TYPE_NAME_ARRAY(Demo)
                    );
            return d;
        }
    };
    template <>
    struct StructDeserializer<Demo> : public Deserializer
    {
      void Translate2String(char*dest, char*src) final
      {
        auto pData = reinterpret_cast<Demo*>(src);
        sprintf(dest, "A=%d, B=%lf, C=%ld", pData->A, pData->B, pData->C);
      }
    };
}

struct EventDescDump
{
    static constexpr size_t DESCDUMP_BIT_FLAG = 1ul<<63;
    static constexpr size_t END_EVENT_ID = std::numeric_limits<size_t>::max();
    size_t mEventID{std::numeric_limits<size_t>::max()};
    char mFile[128];
    char mFunc[128];
    char mLevel[32];
    long mLineNo;
    char mFormat[128];
    char mClassTag[128];

    bool isEnd() { return mEventID == END_EVENT_ID;}
    size_t index() {
        return mEventID&(~DESCDUMP_BIT_FLAG);
    }
    EventDescDump() = default;
    EventDescDump(const EventDesc& event)
    {
        mEventID = DESCDUMP_BIT_FLAG|event.mEventID;
        strcpy(mFile, event.mFile);
        strcpy(mFunc, event.mFunc);
        strcpy(mLevel, event.mLevel);
        mLineNo = event.mLineNo;
        strcpy(mFormat, event.mFormat);
        strcpy(mClassTag, event.mClassTag);
    }

    void Show()
    {
        printf("Dump EventDesc:\n");
        printf("\t%lx\n",mEventID);
        printf("\t%s\n",mFile);
        printf("\t%s\n",mFunc);
        printf("\t%s\n",mLevel);
        printf("\t%ld\n",mLineNo);
        printf("\t%s\n",mFormat);
        printf("\t%s\n",mClassTag);
    }
};

inline bool isEventDesc(void* ptr)
{
    return (*reinterpret_cast<size_t*>(ptr)& EventDescDump::DESCDUMP_BIT_FLAG);
}

template<bool AppendMode=false>
int OpenFile(const char* fileName)
{
    int flags = O_CREAT|O_RDWR;
    if (AppendMode)
    {
        flags |= O_APPEND;
    }
    auto fd = open(fileName, flags, S_IRUSR|S_IWUSR|S_IRGRP|S_IROTH);
    assert(fd>0);
    return fd;
}

inline void write2File(int fd, void* buffer, size_t len)
{
    while(len)
    {
        auto count = write(fd, buffer, len);
        if(count>0)
            len-=count;
        else
        {
            perror("Write Error:");
            assert(count>0);
        }
    }
}

inline auto& DeserializerMapInstance()
{
    static std::unordered_map<std::string, std::unique_ptr<custom::Deserializer>> Deserializers;
    return Deserializers;
}

template <typename CallBackT>
void DecodeEntry(LogEntry* pEntry, const CallBackT& getDesc)
{
#if 0
    auto EventID = pEntry->mHead.mEventID;
    const auto pEvent = getDesc(EventID);
    char outBuf[1024]{0};
    auto size = sprintf(outBuf, "%s[%ld]:%ld:%s(%s)@%ld %s\n", pEvent->mFile, pEntry->TID(), pEvent->mLineNo, pEvent->mLevel, 
            pEvent->mFunc, pEntry->mHead.mTsc, pEvent->mFormat);
    size -= sizeof("{0}");
    DeserializerMapInstance()[pEvent->mClassTag]->Translate2String(outBuf+size, pEntry->mBuffer); 
    //std::cout<<outBuf;
    //UBI_LOG_INFO("%s", outBuf);
#endif
}


extern thread_local LogInfoPerThread gLogInfoTLS;
class LiteralLog {
public:
    static constexpr size_t MAX_THREAD = 1;

    //used by writer
    template<typename Head, typename... Args>
    void InitWrite(const std::tuple<Head, Args...>& t, const std::string& filename)
    {
        if(!mFile.empty())
        {
            fprintf(stderr, "Duplicate binlog initialization\n");
            exit(-1);
        }                                                                                                          
        mFile = filename;
        RegisterAllDeserializers(t);
        RegisterLogInfo();
#ifndef EXCLUDE_EVENTSECTION_FROM_RECOVERY 
        ParseEventSection();
#endif
        int fd = -1;
        if ((fd = OpenFile<true>(filename.c_str())) < 0)
        {
            std::string errorMsg = "Failed to open file [ "+filename+"]: ";
            perror(errorMsg.c_str());
            errorMsg +="\nPlease mount the dir from m0/m1, or mkdir temporarily";
            fprintf(stderr, errorMsg.c_str());
            exit(-1);
        }
        close(fd);
        StartCollectLog(filename);
    }

    template<typename Head, typename... Args>
    static void RegisterAllDeserializers(const std::tuple<Head, Args...>& t)
    {
        auto& deserializers = DeserializerMapInstance();
        //the duplicate "tag" is not permitted 
        assert(deserializers.find(custom::Serializer<std::remove_reference_t<Head>>::tag()) == deserializers.end());
        deserializers.emplace(std::make_pair(
                    custom::Serializer<std::remove_reference_t<Head>>::tag(),
                    std::make_unique<custom::StructDeserializer<std::remove_reference_t<Head>>>())
                );
        RegisterAllDeserializers<Args...>(std::tuple<Args...>{});
    }
    template<typename Head>
    static void RegisterAllDeserializers(const std::tuple<Head>& t)
    {
        auto& deserializers = DeserializerMapInstance();
        deserializers.emplace(std::make_pair(
                    custom::Serializer<std::remove_reference_t<Head>>::tag(),
                    std::make_unique<custom::StructDeserializer<std::remove_reference_t<Head>>>())
                );
    }

    //used by reader
    void OpenBinLog(const std::string& filename, const size_t filesize=4*1024l*1024*1024)
    {
        mBinlogFD = open(filename.c_str(), O_RDONLY);
        if (mBinlogFD == -1)
        {
            return;
        }
        if(!mFile.empty())
        {
            fprintf(stderr, "Duplicate binlog filename\n");
            exit(-1);
        }
        mFile = filename;

        struct stat statbuf;
        fstat(mBinlogFD, &statbuf);
        if (statbuf.st_size < sizeof(EventDescDump))
        {
            close(mBinlogFD);
            mBinlogFD = -1;
            return;
        }

        mLogBaseAddr = mmap(NULL, filesize, PROT_READ, MAP_SHARED, mBinlogFD, 0);
        assert(mLogBaseAddr != MAP_FAILED);
        if(mLogBaseAddr==MAP_FAILED || mLogBaseAddr==nullptr)
        {
            fprintf(stderr, "Failed to mmap %s\n", filename.c_str());
            exit(-1);
        }
        mBinLogReady = true;
    }

    //MUST be called in Work function thread
    void RegisterLogInfo()
    {
        if (!mLogInfoAllThreads.push(&gLogInfoTLS))
        {
            UBI_LOG_ERROR("Can't push LogInfoTLS to queue. is it the queue full?");
            ubiqthrow("Can't push LogInfoTLS to queue.", -1);
        }
        gLogInfoTLS.Register();
    }

    LogInfoPerThread::SPSCQueueT& LogBuffer()
    {
        if(!gLogInfoTLS.isRegistered())
        {
            RegisterLogInfo();
        }
        return gLogInfoTLS.mLogBuffer;
    }

#ifndef EXCLUDE_EVENTSECTION_FROM_RECOVERY 
    static EventDesc* GetDesc(size_t eventID_)
    {
        return reinterpret_cast<EventDesc*>(eventID_);
    }
#else
    static EventDesc* GetDesc(size_t eventID_)
    {
        return nullptr;
    }
#endif

    void LogDump2File(const char* binlogFile)
    {
        using namespace std::chrono_literals;
        //collect Logss in another process
        auto fd = OpenFile<true>(binlogFile);
        if(fd < 0)
        {
            UBI_LOG_ERROR("Failed to open file: %s", binlogFile);
            perror("Failed to open binlogfile:");
            ubiqthrow("Failed to open binlogfile", -1);
        }
        pthread_setname_np(pthread_self(), "BinlogDumper");
        while(1)
        {
            mLogInfoAllThreads.consume_all( [fd](LogInfoPerThread* logQueuePerThread){
                {
                    auto pEntry = logQueuePerThread->mLogBuffer.front();

                    if(!pEntry)
                    {
                        return ;
                    }
                    if(isEventDesc(pEntry))
                    {
                        //FixME!!! Too tricky here. 
                        static_assert(sizeof(EventDescDump)-sizeof(LogEntry)>0 && (sizeof(EventDescDump)/sizeof(LogEntry)==1));
                        write2File(fd, pEntry, sizeof(*pEntry));
                        logQueuePerThread->mLogBuffer.pop();

                        while (!(pEntry = logQueuePerThread->mLogBuffer.front()))
                            ;
                        write2File(fd, reinterpret_cast<char*>(pEntry), sizeof(EventDescDump)-sizeof(*pEntry));
                    }
                    else
                    {
                        write2File(fd, pEntry, pEntry->entryLength());
                        DecodeEntry(pEntry, GetDesc);
                    }
                    logQueuePerThread->mLogBuffer.pop();
                }
            });
            if(mLogInfoAllThreads.empty())
            {
                std::this_thread::sleep_for(5ms);
            }
        }
    }

    char*  LogRead()
    {
        mCurEntry = nullptr;
        mCurTag = nullptr;
        struct stat statbuf;
        fstat(mBinlogFD, &statbuf);
        if (mCurBinLogSize + 8 > statbuf.st_size ) {
            return nullptr;
        }

        auto p_event_desc = reinterpret_cast<EventDescDump*>(static_cast<char *>(mLogBaseAddr) + mCurBinLogSize);
        while (isEventDesc(p_event_desc))
        {
            mEventDescMap[p_event_desc->index()] = p_event_desc;
            mCurBinLogSize += sizeof(EventDescDump);
            p_event_desc = reinterpret_cast<EventDescDump*>(static_cast<char *>(mLogBaseAddr) + mCurBinLogSize);
        }

        if (mCurBinLogSize + sizeof(LogEntryHead) > statbuf.st_size) {
            return nullptr;
        }
        LogEntryHead *entry_head = (LogEntryHead *)(static_cast<char *>(mLogBaseAddr) + mCurBinLogSize);
        if (mCurBinLogSize + sizeof(LogEntryHead) + entry_head->mBufferLength > statbuf.st_size) {
            return nullptr;
        }

        mCurEntry = (LogEntry *)(static_cast<char *>(mLogBaseAddr) + mCurBinLogSize);
        auto iter = mEventDescMap.find(mCurEntry->mHead.mEventID);
        if(iter != mEventDescMap.end()) {
            mCurTag = iter->second->mClassTag;
        }

        // mBuffer有效长度mBufferLength
        mCurBinLogSize += sizeof(LogEntryHead) + entry_head->mBufferLength;

        return mCurEntry->mBuffer;
    }

    void DecodeCurEntry()
    {
        if (mCurEntry == nullptr) {
            return;
        }
        auto iter = mEventDescMap.find(mCurEntry->mHead.mEventID);
        if(iter == mEventDescMap.end()) {
            return;
        }
        const auto pEvent = iter->second;
        char outBuf[1024]{0};
        auto size = sprintf(outBuf, "%s[%ld]:%ld:%s(%s)@%ld %s\n",
                pEvent->mFile, mCurEntry->TID(), pEvent->mLineNo, pEvent->mLevel,
                pEvent->mFunc, mCurEntry->mHead.mTsc, pEvent->mFormat);
        size -= sizeof("{0}\n");
        DeserializerMapInstance()[pEvent->mClassTag]->Translate2String(outBuf+size, mCurEntry->mBuffer);
        printf("%s:%s\n", __FUNCTION__, outBuf);
    }

    void StartCollectLog(const std::string& fileName)
    {
        std::thread LogDumpThread([this, fileName](){LogDump2File(fileName.c_str());});
        LogDumpThread.detach();
    }

    size_t GetCurBinLogSize() const { return mCurBinLogSize; }
    void SetCurBinLogSize(size_t size) { mCurBinLogSize = size; }
    bool GetBinLogReady() const { return mBinLogReady; }

    const char* GetCurTag() const { return mCurTag; }

    std::string FileName()
    {
        return mFile;
    }
    void ResetFileName()
    {
        mFile.clear();
    }
#ifndef EXCLUDE_EVENTSECTION_FROM_RECOVERY 
    void ParseEventSection()
    {
        //bool ret = CheckEventID(&__start_EVENTSECTION, &__stop_EVENTSECTION, binlogFile);

        //The event must be put at file header
        auto fd = OpenFile(mFile.c_str());
        for(auto iter=&__start_EVENTSECTION; iter!=&__stop_EVENTSECTION; iter++)
        {
            iter->Show();
            assert(DeserializerMapInstance().find(iter->mClassTag) != DeserializerMapInstance().end());
            EventDescDump temp(*iter);


            //FixME!!! Too tricky here. 
            size_t nextHead;
            auto& logRaw = LogBuffer().get_cell(nextHead);
            memcpy(&logRaw, &temp, sizeof(logRaw));
            LogBuffer().advance_head(nextHead);

            auto& logRaw2 = LogBuffer().get_cell(nextHead);
            memcpy(&logRaw2, reinterpret_cast<char*>(&temp)+sizeof(logRaw), sizeof(EventDescDump)-sizeof(logRaw));
            LogBuffer().advance_head(nextHead);
        }
        EventDescDump end;
        write2File(fd, &end, sizeof(end));
        close(fd);
    };

private:
    //when LogAPP restart during trading hours and restart by new binay
    //the EventID maybe changed. Then "recoveryApp" can't find the right EventDest with new eventID
    //i.e the eventID should keep consistency when LogApp restart.
    //Fix it by relative eventID or new links ??
    static bool CheckEventID(const EventDesc* start, const EventDesc* end, const char* binlogFile)
    {
        static auto fd = open(binlogFile, O_RDONLY);
        if(fd < 0)
        {
            std::cout << "Fresh start without binlog\n";
            return true;
        }

        //binlog file is already existed. will check whether the EventID is consistent
        struct stat statbuf;
        fstat(fd, &statbuf);
        if(statbuf.st_size == 0)
        {
            std::cout<<"Empty binlog file\n";
            return true;
        }

        auto mmapCleanup =[size=statbuf.st_size](void* ptr){
                                if(ptr!=MAP_FAILED)
                                {
                                    munmap(ptr, size);
                                }
                                close(fd);
                              };
        std::unique_ptr<void, decltype(mmapCleanup)> ptrFileMap(mmap(NULL, statbuf.st_size, PROT_READ, MAP_SHARED, fd, 0),
                        mmapCleanup);

        void *ptr = ptrFileMap.get();
        if(ptr==MAP_FAILED)
        {
            perror("Failed to map binlog file");
            return false;
        }
        assert(ptr!=MAP_FAILED);

        //Load event from binlog file
        std::map<size_t, EventDescDump*> mEventDescMapFromLogFile;
        EventDescDump* pEventDesc = (EventDescDump*)ptr;
        while(!pEventDesc->isEnd())
        {
            auto iter = pEventDesc++;
            mEventDescMapFromLogFile[iter->index()] = iter;
        }

        for(auto newDesc=start; newDesc!=end; newDesc++)
        {
            if (mEventDescMapFromLogFile.find(INDEX_OF_EVENT(newDesc->mEventID)) == mEventDescMapFromLogFile.end())
            {
                std::cout<<"EventID:"<<newDesc->mEventID << '['<<INDEX_OF_EVENT(newDesc->mEventID)<<']'<< " (" << newDesc->mClassTag <<") can't find in old binay log\n";
                return false;
            }
        }

        return true;
    }
#endif
private:
    template <size_t MAX_THREAD_SUPPORTED=128>
    class LogInfoContainer{
    public:
        bool push(LogInfoPerThread* pTLS)
        {
            if((mSize.load()&0xFFFF) == mCapacity)
            {
                return false;
            }
            //TODO The barrier should be implemented against mArray
            mArray[mSize.fetch_add(CommitingCount, std::memory_order_relaxed)&0xFFFF] = pTLS;
            mSize.fetch_add(-1*(CommitingCount-1), std::memory_order_release);
            return true;
        }
        template <typename Functor>
        void consume_all(Functor const &f)
        {
            long currentSize= 0;
            while( (currentSize=mSize.load(std::memory_order_acquire)) && (currentSize&CommitingCountMask)!=0 )
                ;
            currentSize = currentSize&SizeMask;
            for(long index=0; index<currentSize; index++)
            {
                f(mArray[index]);
            }
        }
        bool empty()
        {
            long currentSize= 0;
            while( (currentSize=mSize.load(std::memory_order_acquire)) && (currentSize&CommitingCountMask)!= 0 )
                ;
            currentSize = currentSize&SizeMask;
            bool ret = true;
            for(long index=0; index<currentSize; index++)
            {
               ret = ret & mArray[index]->empty();
            }
            return ret;
        }
    private:
        std::array<LogInfoPerThread*, MAX_THREAD_SUPPORTED> mArray;
        static constexpr long CommitingCount {(0x1l<<32)|(0x1)};
        static constexpr long CommitingCountMask {(0xFFFFFFFFl)<<32};
        static constexpr long SizeMask {(0xFFFFFFFFl)};
        //mSize consists of 2 parts. the 32 most significant bits are used to indicate that is during committing,
        //i.e not finshed yet
        std::atomic<long> mSize {0};
        static constexpr size_t mCapacity {MAX_THREAD_SUPPORTED};
    };
private:
    bool mBinLogReady{false};
    int  mBinlogFD{-1};
    void* mLogBaseAddr{nullptr};
    std::string mFile;
    size_t mCurBinLogSize{0};
    LogEntry* mCurEntry;
    char* mCurTag;

    //LogEntry mCurEntryMulti;
    //std::unordered_map<std::string, LogRecoverMulti> mLogRecoverMap;

    LogInfoContainer<> mLogInfoAllThreads;
    std::map<size_t, EventDescDump*> mEventDescMap;
};

inline LiteralLog& LiteralLogManagerInstance()
{
    static LiteralLog logInstance;
    return logInstance;
}
#endif
