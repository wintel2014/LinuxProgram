#include <LOG.hpp>

#include <cstdlib>
#include <cstdio>
#include <memory>
#include <utility>
#include <deque>
#include <boost/asio.hpp>
namespace Network { 
    using tcp = boost::asio::ip::tcp;
    using error_code_t = boost::system::error_code;
    using endpoint = tcp::endpoint;

    class Message
    {
    public:
        static constexpr size_t ALIG_SIZE=16;
        Message(void*buff, size_t s) : mSize(s)
        {
            mData = static_cast<char*> (std::aligned_alloc(ALIG_SIZE, mSize));
            memcpy(mData, buff, s);
        }
    
        Message() : mSize(-1), mData(nullptr)
        {}
    
        ~Message()
        {
            std::free(mData); //OK for nullptr
        #ifndef NDEBUG
            mSize = -1;
            mData = (char*)0xFFFFFFFFFDEADADD;
        #endif
        }
    
        size_t size() { return mSize; }
        char* data() {return mData;}
        const char* data() const {return mData;}
    
    private:
        size_t mSize;
        char*  mData;
    };
    
    class Session : public std::enable_shared_from_this<Session>
    {
    public:
        using BufferT = boost::asio::mutable_buffer;
        virtual bool OnRecvBody(BufferT buf) = 0;
        virtual int  OnRecvHeader() =0;
    
        Session(tcp::socket &&socket) : mSocket(std::move(socket))
        {}
    
        virtual ~Session()
        {
        #ifndef NDEBUG
            LOG_INFO("Descturct seesion @%p\n", this);
        #endif
        }
    
        void Start()
        { DoRecvHeader(); }
    
        void AsyncSend(void* buffer, size_t length)
        {
            bool isSending = !mSendMessage.empty();
            if (buffer && length)
            {
                mSendMessage.emplace_back(buffer, length);
            }
            if (isSending)
            {
                LOG_WARN("There are old message still in sending\n");
                return;
            }
    
            DoSend();
        }
    
    private:
        void DoRecvHeader()
        {
            auto self(shared_from_this());
            boost::asio::async_read (mSocket, boost::asio::buffer(&mHeader, sizeof(mHeader)),
                [this, self] (error_code_t ec, size_t length)
                {
                    if(unlikely(ec))
                    {
                        LOG_ERROR("Failed to recv message header : reason=%s\n", ec.message().c_str());
                        //stop this session ??
                        return;
                    }
                    if(unlikely((mMessageSize=OnRecvHeader()) < 0) )
                    {
                        LOG_ERROR("Can't recognize the protocol code=%d! ignored\n", mHeader);
                        DoRecvHeader(); //DoRecvHeader()
                        return;
                    }
                    DoRecvBody();
                }
            );
        }
    
        void DoRecvBody()
        {
            auto self(shared_from_this());
            boost::asio::async_read(mSocket, boost::asio::buffer(mData, mMessageSize),
                [this, self] (error_code_t ec, size_t length)
                {
                    if(unlikely(ec))
                    {
                        LOG_ERROR("Failed to recv body. reason=%s\n", ec.message().c_str());
                        //stop this session ??
                        return;
                    }
    
                    if(!OnRecvBody(BufferT(mData, mMessageSize)))
                    {
                        LOG_ERROR("Failed to parse payload for protocol code=%d\n", mHeader);
                        //continue to recv
                    }
                    DoRecvHeader();
                }
    
            );
        }
    
        void DoSend()
        {
            auto self(shared_from_this());
            boost::asio::async_write(mSocket, boost::asio::buffer(mSendMessage.front().data(), mSendMessage.front().size()),
                [this, self] (error_code_t ec, size_t length)
                {
                    if(unlikely(ec))
                    {
                        LOG_ERROR("Failed to send message! reason=%s\n", ec.message().c_str());
                        //stop this session ??
                        return ;
                    }
                    LOG_DEBUG("Sent type=%d size=%ld\n", mSendMessage.front().data()[0], mSendMessage.front().size());
                    mSendMessage.pop_front();
                    if(mSendMessage.size() > 0)
                    { DoSend(); }
                }   
            );
        }
    
    protected:
        unsigned short mHeader;
        tcp::socket mSocket;
    
    private:
        int mMessageSize{-1};
        char mData[8*1024];
        std::deque<Message> mSendMessage;
    };

struct TCPRWChannel : public Network::Session
{
public:
    using BufferT = Network::Session::BufferT;
    using tcp = Network::tcp;
    TCPRWChannel (tcp::socket &&s) : Network::Session(std::move(s))
    {}

    virtual int OnRecvHeader() override;
    virtual bool OnRecvBody(BufferT buf) override;
};
    class ServiceManager
    {
    public:
        ServiceManager (short port) : mAcceptor(mIOContext, endpoint(tcp::v4(), port))
        {}
        ServiceManager (const char* IP, short port) : mAcceptor(mIOContext, endpoint(boost::asio::ip::address::from_string(IP), port))
        {}
    
        template<typename T>
        void DoConnect()
        {
            mAcceptor.async_accept (
                [this] (error_code_t ec, tcp::socket socket)
                {
                    if(!ec)
                    {
                        std::make_shared<T>(std::move(socket))->Start();
                    }
                    else
                    {
                    }
                    DoConnect<T>();
                }
            );
        }
    
        void Run()
        {
            mIOContext.run();
        }
    private:
        boost::asio::io_context mIOContext;
        tcp::acceptor mAcceptor;
    };

}
