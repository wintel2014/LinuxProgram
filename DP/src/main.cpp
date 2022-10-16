#include <ClientOrder.hpp>
#include <Network.hpp>
int main(int argc, char* argv[])
{
    std::thread OrderRecvThread ( [] () {
            short port = 60366;
            Network::ServiceManager server(port);
            server.DoConnect<Network::TCPRWChannel<ClientOrder>>();
            server.Run();
        }
    );
    std::thread CMDRecvThread ( [] () {
            short port = 60367;
            Network::ServiceManager server(port);
            server.DoConnect<Network::TCPRWChannel<>>();
            server.Run();
        }
    );

    OrderRecvThread.join();
    CMDRecvThread.join();
    return 0;
}
