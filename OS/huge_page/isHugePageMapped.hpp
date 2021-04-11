#pragma once
#include <string.h>
#include <iostream>
#include <fstream>
#include <sstream>
#include <string>
#include <array>
#include <stdio.h>
//echo always | sudo tee  /sys/kernel/mm/transparent_hugepage/enabled
/*
cat /proc/self/smaps
        7fba7da75000-7fba7da76000 rw-p 00000000 00:00 0
        Size:                  4 kB
        KernelPageSize:        4 kB
        MMUPageSize:           4 kB
        Rss:                   4 kB
        Pss:                   4 kB
        Shared_Clean:          0 kB
        Shared_Dirty:          0 kB
        Private_Clean:         0 kB
        Private_Dirty:         4 kB
        Referenced:            4 kB
        Anonymous:             4 kB
        LazyFree:              0 kB
        AnonHugePages:         0 kB
        ShmemPmdMapped:        0 kB
        FilePmdMapped:         0 kB
        Shared_Hugetlb:        0 kB
        Private_Hugetlb:       0 kB
        Swap:                  0 kB
        SwapPss:               0 kB
        Locked:                0 kB
        THPeligible:		0
        VmFlags: rd wr mr mw me ac sd
*/
inline bool isHugePageMapping(const void* start, const void* end)
{
    std::string CurrentSmapsFile ="/proc/self/smaps";
    std::ifstream smapsStream(CurrentSmapsFile);
    if(!smapsStream.is_open())
    {
        printf("Failed to open %s\n", CurrentSmapsFile.c_str());
        return false;
    }

    std::array<char, 32> rangeL;
    std::array<char, 32> rangeR;
    std::array<char, 2048> line;

    const std::string anonHPField("AnonHugePages");
    const std::string endField("VmFlags");
    //starts from the 1st line for each segment -> fba7da75000-7fba7da76000 rw-p 00000000 00:00 0
    while ( smapsStream.getline(&line[0], sizeof(line)) )
    {
        std::istringstream vmBuf(&line[0]);
        vmBuf.getline(&rangeL[0], sizeof(rangeL), '-');
        vmBuf.getline(&rangeR[0], sizeof(rangeR), ' ');
        auto rangeLPtr= reinterpret_cast<void*>(std::stoull(&rangeL[0], 0, 16));
        auto rangeRPtr= reinterpret_cast<void*>(std::stoull(&rangeR[0], 0, 16));
        std::array<char, 128> FieldName;
        std::array<char, 128> value;
        size_t AnonHugePagesSize = 0;
        //HugePage is allocated from THP or hugetlb

        //Parse the lines until "VmFlags" existed.
        while(smapsStream.getline(&line[0], sizeof(line)))
        {
            std::istringstream inbuf(&line[0]);
            inbuf.getline(&FieldName[0], sizeof(FieldName), ':');
            {
                if (anonHPField == &FieldName[0])
                {
                    inbuf.getline(&value[0], sizeof(value), 'k');
                    AnonHugePagesSize = std::stoull(&value[0],0,16);
                    if(rangeLPtr<=start && end<=rangeRPtr)
                    {
                        if(AnonHugePagesSize >0)
                        {
                            printf("%p %p AnonHugePages %ld kB\n", rangeLPtr, rangeRPtr, AnonHugePagesSize);
                            return true;
                        }
                    }
                }
                if(endField == &FieldName[0])
                {
                    inbuf.getline(&value [0], sizeof(value));
                    if(rangeLPtr<=start && end<=rangeRPtr)
                    {
                        if(std:: string(&value[0]).find(" ht") != std::string::npos)
                        {
                            printf("%p %p AnonHugePages %s\n", rangeLPtr, rangeRPtr, &line[0]);
                            return true;
                        }
                    }
                    break;
                }
            }
        }
    }
    return false;
}
