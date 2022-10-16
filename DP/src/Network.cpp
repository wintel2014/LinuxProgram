#include <Network.hpp>
#include <ClientOrder.hpp>
namespace Network {
    template<>
    bool TCPRWChannel<ClientOrder>::OnRecvBody(BufferT buf)
    {
        auto pOrder = reinterpret_cast<ClientOrder*>(buf.data());
        LOG_INFO("Recv Order ID=%ld Investor=%s", pOrder->mID, pOrder->mInvestorID);
        return true;
    }
}
