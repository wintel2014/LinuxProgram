typedef struct msr_struct
{
    unsigned int lo;
    unsigned int hi;
} msr_t;

static inline __attribute__((always_inline)) msr_t rdmsr(unsigned index)
{
    msr_t result;
    __asm__ __volatile__ (
            "rdmsr"
            : "=a" (result.lo), "=d" (result.hi)
            : "c" (index)
            );
    return result;
}

static inline __attribute__((always_inline)) void wrmsr(unsigned index, msr_t msr)
{
    __asm__ __volatile__ (
            "wrmsr"
            : /* No outputs */
            : "c" (index), "a" (msr.lo), "d" (msr.hi)
            );
}
