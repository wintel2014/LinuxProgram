
/*
Protocol
The first "short" represents the data's purpose
such as
order, cmd

*/
enum ProtocolCode : short
{
    ORDER = 0,
    DISPLAY_ORDER=1,
};

