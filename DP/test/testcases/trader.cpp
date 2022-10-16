#include <Network.hpp>

int main(int argc, char* argv[])
{

    const char* host = "127.0.0.1";
    const char* port;

    if(argc == 2)
    {
        port = argv[1];
    }
    else if(argc == 3)
    {
        host = argv[1];
        port = argv[2];
    }

    Network::Client client(host, port);
    ClientOrder co;
    strncpy(co.mInvestorID, "Trader-Test-1", sizeof(ClientOrder::mInvestorID));
    for(int index=0; index<3; index++)
    {
        co.mID = index;
        client.Send(&co, sizeof(co));    
    }

    Network::Client AdminCmd(host, "60367");
    DisplayOrder cmd;
    strncpy(cmd.mSymbol, "500130", sizeof(DisplayOrder::mSymbol));
    for(int index=0; index<5; index++)
    {
        AdminCmd.Send(&cmd, sizeof(cmd));    
        co.mID = index;
        client.Send(&co, sizeof(co));    
    }
}
