#include <cstddef>
#include <sys/epoll.h>
#include <errno.h>
#include <functional>
#include <chrono>
#include <thread>
#include <utility>
#include "util.hpp"
#include <boost/lockfree/spsc_queue.hpp>
#include <unistd.h>
#include <sys/syscall.h>
#define gettid() syscall(__NR_gettid)

struct Config
{
  static constexpr unsigned CORE_NUM = CORES;
  static constexpr unsigned THREADS_NUM = CORE_NUM*2;
  static constexpr unsigned MAX_CONCURRENT_CONNECTIONS = 10*1000;
  static constexpr unsigned CONCURRENT_CONNECTIONS_PER_THREAD = MAX_CONCURRENT_CONNECTIONS/(THREADS_NUM-1);
  static constexpr unsigned DEFAULT_PORT = 33445;
  
};

inline unsigned long readTsc()
{
    register unsigned long tsc __asm__("%rax");
    __asm__ volatile("rdtsc;\n shl $0x20, %%rdx;\n or %%rdx,%%rax": "=a"(tsc):: "%rcx", "%rdx");
    return tsc;
}

class HTTPDispatcher {
  public:
    using event_queue_t = boost::lockfree::spsc_queue<int, boost::lockfree::capacity<Config::CONCURRENT_CONNECTIONS_PER_THREAD>, 
		                                                  boost::lockfree::fixed_sized<true>>;
  
    HTTPDispatcher() = default;

    void initialize(unsigned port_ = Config::DEFAULT_PORT)
    {
      int index = 0;
      for(auto& queue:mEventQueues)
      {
        mEventQueuesRef[index++] = &queue;
      }

      mListenFD = do_listen(port_);
      printf("Thread-%ld Listen on %d\n",gettid(), port_);
      mPollFD = do_epoll_create();
    
    	struct epoll_event event;
	    event.data.fd = mListenFD;
    	event.events = EPOLLIN | EPOLLET;
      
      if (epoll_ctl(mPollFD, EPOLL_CTL_ADD, mListenFD, &event) < 0)
      {
        throw FSException();
      }      
    } 

    void run()
    {
      while(1)
      {
        auto nReady = epoll_wait(mPollFD, mEventLists, sizeof(mEventLists)/sizeof(mEventLists[0]), -1);
        if (nReady < 0)
        {
          if(errno==EINTR)
				    continue;

          printf("Failed to epoll_wait!\n");
          return;
        }
        for(int i=0; i<nReady; i++)
        {
          auto currentFD = mEventLists[i].data.fd;
          if (currentFD == mListenFD)
          {
            onConnect();
          }
          else if (mEventLists[i].events & EPOLLIN)
          {
            dispatch(currentFD);  
          }
        }
      }
    }
    
    void onConnect()
    {
      struct sockaddr_in peerAddr;
      socklen_t addrLen = sizeof(peerAddr);
      memset(&peerAddr, 0, addrLen);
      auto clientFD = accept(mListenFD, reinterpret_cast<sockaddr*>(&peerAddr), &addrLen);
      if (clientFD < 0)
      {
        printf("Failed to connect to client!!!!\n");
        return ;
      }
      #ifndef NDEBUG 
      printf("Thread-%ld[%ld] fd=%d: ip=%s port=%d\n",gettid(), readTsc(), clientFD, inet_ntoa(peerAddr.sin_addr),ntohs(peerAddr.sin_port));
      #endif
      setNonblock(clientFD);
      epoll_event event{EPOLLIN|EPOLLET, {0}};
      event.data.fd = clientFD;
      epoll_ctl(mPollFD, EPOLL_CTL_ADD, clientFD, &event);
    }

    void dispatch(int fd_)
    {
#if NO_RE_REQUEST
      if(fd_ not in mEventQueues)
      {  
        //Choose the least read_available queues
        std::sort(mEventQueuesRef.begin(), mEventQueuesRef.end(), [](event_queue_t* lhs, event_queue_t*rhs)
                                                                {return lhs->read_available()<rhs->read_available();});
        int index = 0;
        auto targetQueue = mEventQueuesRef[0];
        //All queues are full ? then try it again and again
        while(! targetQueue -> push(fd_))
        {
          targetQueue = mEventQueuesRef[index++ % mEventQueues.size()];
        }
      }
#else
      auto targetQueue = mEventQueuesRef[fd_ % mEventQueues.size()];
      while(! targetQueue -> push(fd_))
        ;
#endif
    }

    template<typename T, size_t N>
    void allocateEventQueueForThread(std::array<T, N>& container)
    {
      static_assert(N==sizeof(mEventQueues)/sizeof(mEventQueues[0]), "Each thread should be allocated 1 queue");
      for(auto i=0; i<mEventQueues.size(); i++)
      {
        container[i].setQueue(&mEventQueues[i]);
      }
    }

    int getPollFD() { return mPollFD; } 
  private:
    int mPollFD;
    int mListenFD;

    std::array<event_queue_t, Config::THREADS_NUM> mEventQueues;
    std::array<event_queue_t*, Config::THREADS_NUM> mEventQueuesRef;
    epoll_event mEventLists[Config::MAX_CONCURRENT_CONNECTIONS/10];
};

template<unsigned int N>
struct LightString
{
  char mStart[N];
  unsigned int mSize{0}; //payload size, '\0' is not included
  static constexpr unsigned int mCapacity = N;
  char* c_str() {mStart[mSize]='\0'; return mStart;}

  char& operator [](unsigned int pos_) 
  {
    assert(pos_ < mSize);
    return mStart[pos_];
  }
};

struct LightStringRef
{
  char* mStart{nullptr};
  unsigned int mSize{0}; //payload size, '\0' is not included
  char* c_str() {mStart[mSize]='\0'; return mStart;}
  char& operator [](unsigned int pos_) 
  {
    assert(pos_ < mSize);
    return mStart[pos_];
  }

  char* setTerminate() { mStart[mSize] = '\0';}
  template<size_t N>
  bool operator==(const char (&array)[N])
  {
    return (N-1==mSize && (strncmp(array, mStart, N)==0));
  }
};

static HTTPDispatcher HTTPDispatcherInstance;
class HTTPService
{
  public:
    HTTPService() = default;
    void setQueue (HTTPDispatcher::event_queue_t* pQueue)
    {
      mEventQueue = pQueue;
    }

    void run()
    {
        using namespace std::placeholders;
        while (!mStop) {
          if (0 == mEventQueue->consume_all(std::bind(&HTTPService::onRecv,this,_1)))
            __asm volatile ("pause" ::: "memory");
        }
        mEventQueue->consume_all(std::bind(&HTTPService::onRecv,this,_1));
    }

    void onRecv(int fd_)
    {
      #ifndef NDEBUG
      printf("Thread-%ld[%ld]: Recv from fd[%d]\n", gettid(), readTsc(), fd_);
      #endif
      
      LightString<2048> recvBuffer;
      int ret=readLine(fd_, recvBuffer.mStart, recvBuffer.mCapacity);
      if(ret >0)
      {
        recvBuffer.mSize = ret;
        processRequest(recvBuffer, fd_);
      }
      shutdown(fd_, SHUT_RDWR);
      close(fd_);
      epoll_ctl(HTTPDispatcherInstance.getPollFD(), EPOLL_CTL_DEL, fd_, nullptr);
    }
    
    template<unsigned N>
    void processRequest(LightString<N>& recvBuffer_, int outFD_)
    {
      static constexpr char ServicesType[] = "/time";
      LightStringRef URI;
      for(auto i=0; i<recvBuffer_.mSize; i++)
      {
        if(' ' == recvBuffer_[i])
        {
          if(!URI.mStart)
            URI.mStart = &recvBuffer_[i+1];
          else
          {
            URI.mSize = &recvBuffer_[i] - URI.mStart;
            break;
          }
        }
      }

      char outBuf[2048];
      URI.setTerminate();
      char buffer[64];
      strcpy(buffer, "Service is not supported");
      if(URI == ServicesType)
      {
        struct tm* tm_info;
        auto timer = time(nullptr);
        tm_info = localtime(&timer);
        strftime(buffer, 26, "%Y-%m-%d %H:%M:%S", tm_info);
        //printf("Thread-%ld: Time:--%s--\n", gettid(), buffer);

      }
      sprintf(outBuf,  "HTTP/1.1 200 OK\r\n"
             "Content-Type: text/html\r\n\r\n"
             "<html><head><style>"
             "body{font-family: monospace; font-size: 16px;}"
             "td {padding: 2.5px 6px;}"
             "</style></head><body><table>\r\n"
             "<tr><td><a href=\"LocalTime\">%s</a></td></tr>"
             "</table></body></html>\r\n", buffer);
      #ifndef NDEBUG
      printf("Thread-%ld[%ld]: send to fd[%d]\n", gettid(), readTsc(), outFD_);
      #endif
      writen(outFD_, outBuf, strlen(outBuf));
    }
  private:
    HTTPDispatcher::event_queue_t* mEventQueue;
    bool mStop {false};
};
