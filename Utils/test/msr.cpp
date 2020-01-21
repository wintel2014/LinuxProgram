#include "../msr.hpp"
#define VARIANT_ID_BYTE 18
#define VARIANT_ID_MASK 7

#define MSR_IA32_PLATFORM_ID 0x17

int main(int, char*[])
{
    msr_t platform_id = rdmsr(MSR_IA32_PLATFORM_ID);
}
