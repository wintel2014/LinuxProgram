#include <ClientOrder.hpp>
#include <Network.hpp>
int main(int argc, char* argv[])
{
    short port = 60366;
    Network::ServiceManager server(port);

    server.DoConnect<Network::TCPRWChannel>();

    server.Run();
    return 0;
}
