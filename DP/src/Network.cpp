#include <Network.hpp>
#include <Protocol.hpp>
#include <ClientOrder.hpp>
namespace Network {
    int TCPRWChannel::OnRecvHeader()
    {
        switch (mHeader)
        {
            case ProtocolCode::ORDER:
                return sizeof(ClientOrder);
            default:
                LOG_ERROR("Can't recognize code=%d\n", mHeader);
                return -1;
        }
        return -1;
    }

    bool TCPRWChannel::OnRecvBody(BufferT buf)
    {
        LOG_INFO("Recv data size=%ld\n", buf.size());
        return false;
    }
}
