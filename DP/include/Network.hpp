#pragma once

#include <LOG.hpp>
#include <Protocol.hpp>
#include <ClientOrder.hpp>

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
    
    template<bool DirectToRecvBody = false>
    class Session : public std::enable_shared_from_this<Session<DirectToRecvBody>>
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
            LOG_INFO("Descturct seesion @%p", this);
        #endif
        }
    
        void Start()
        {
            if constexpr (DirectToRecvBody)
                DoRecvBody();
            else
                DoRecvHeader(); 
        }
    
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
            auto self(this->template shared_from_this());
            boost::asio::async_read (mSocket, boost::asio::buffer(&mHeader, sizeof(mHeader)),
                [this, self] (error_code_t ec, size_t length)
                {
                    if(likely(!ec))
                    {
                        if(unlikely((mMessageSize=OnRecvHeader()) < 0) )
                        {
                            LOG_ERROR("Can't recognize the protocol code=%d! ignored the left communications!!!\n", mHeader);
                            //DoRecvHeader();
                            return;
                        }
                        DoRecvBody();
                    }
                    else
                    {
                        if(ec.value() != boost::asio::error::misc_errors::eof)
                        {
                            LOG_ERROR("Failed to recv message header : reason=%s\n", ec.message().c_str());
                            //stop this session ??
                            return;
                        }
                    }
                }
            );
        }
    
        void DoRecvBody()
        {
            auto self(this-> template shared_from_this());
            boost::asio::async_read(mSocket, boost::asio::buffer(mData, mMessageSize),
                [this, self] (error_code_t ec, size_t length)
                {
                    if(likely(!ec))
                    {
                        if(!OnRecvBody(BufferT(mData, mMessageSize)))
                        {
                            LOG_ERROR("Failed to parse payload for protocol code=%d\n", mHeader);
                            //continue to recv
                        }
                    }
                    else
                    {
                        if(ec.value() != boost::asio::error::misc_errors::eof)
                        {
                            LOG_ERROR("Failed to recv body. reason=%s\n", ec.message().c_str());
                            //stop this session ??
                            //return;
                            //throw ec;
                        }
                    }
                    if constexpr (DirectToRecvBody)
                        DoRecvBody();
                    else
                        DoRecvHeader(); 
    
                }
    
            );
        }
    
        void DoSend()
        {
            auto self(this->template shared_from_this());
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
        int mMessageSize{-1};
        tcp::socket mSocket;
    
    private:
        char mData[8*1024];
        std::deque<Message> mSendMessage;
    };

template<typename T=bool>
struct TCPRWChannel : public Network::Session<std::is_same_v<T, ClientOrder>>
{
public:
    using Base = Network::Session<std::is_same_v<T, ClientOrder>>;
    using BufferT =typename Base::BufferT;
    using tcp = Network::tcp;
    TCPRWChannel (tcp::socket &&s) : Base(std::move(s))
    {
        Base::mMessageSize = sizeof(T);
    }

    virtual int OnRecvHeader() override
    {
        switch (Base::mHeader)
        {
            case ProtocolCode::DISPLAY_ORDER:
                return sizeof(DisplayOrder)-sizeof(DisplayOrder::mType);
            default:
                LOG_ERROR("Can't recognize code=%d", Base::mHeader);
                return -1;
        }
        return -1;
    }
    virtual bool OnRecvBody(BufferT buf) override
    {
        bool ret = false;
        if(Base::mHeader)
        {
            auto pDispOrder = reinterpret_cast<DisplayOrder*>((char*)buf.data()-sizeof(DisplayOrder::mType));
            ret = true;
        }
        LOG_INFO("Recv data size=%ld", buf.size());
        return ret;
    }
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


class Client {
public:
    Client (const char* host, const char* service)
    {
        tcp::resolver resolver(mIOContext);
        boost::asio::connect(mSocket, resolver.resolve(host, service));
    }

    Client(const char* host, short port)
    {
        tcp::resolver resolver(mIOContext);
        boost::asio::connect(mSocket, resolver.resolve(host, std::to_string(port)));
    }

    size_t Send(const void* data, size_t length)
    {
        try {
            return boost::asio::write(mSocket, boost::asio::buffer(data, length));
        }catch (boost::system::system_error &ec) {
            LOG_ERROR("Failed to send: %s\n", ec.what());
            return -1;
        }
    } 

    size_t Recv(void* reply, size_t length)
    {
        try {
            return boost::asio::read(mSocket, boost::asio::buffer(reply, length));
        }catch (boost::system::system_error &ec) {
            LOG_ERROR("Failed to send: %s\n", ec.what());
            return -1;
        }

    }
private:
    boost::asio::io_context mIOContext;
    tcp::socket mSocket{mIOContext};
};
}
