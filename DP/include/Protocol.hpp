#pragma once
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

struct DisplayOrder
{
    short mType{ProtocolCode::DISPLAY_ORDER};
    char mSymbol[16];
}__attribute__((packed));
