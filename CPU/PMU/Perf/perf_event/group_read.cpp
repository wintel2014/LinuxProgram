#include <CPUID.hpp>
#include <rdpmc.hpp>
#include <string>
#include <stdio.h>
#include <unistd.h>
#include <linux/perf_event.h>
#include <linux/hw_breakpoint.h>
#include <sys/ioctl.h>
#include <sys/syscall.h>

#include <stdint.h>
#include <inttypes.h>
#include <string.h>

struct PMCValue
{
    uint64_t id;
    uint64_t value[2]{0,0};
    uint32_t count{0};

    void setValue (uint64_t val, bool debug=false)
    {
        if(debug)
            printf("SetPMC:%lx\n", val);
        value[count++&1] = val;
    }

    uint64_t Offset()
    {
        return value[(count+1)&1] - value[count&1];
    }
};
struct PerfEvent 
{
    std::string name;
    uint32_t type;
    uint32_t config;
    int fd{-1};
    PMCValue pmc_value;    
};

constexpr int fixed_pmc_cnt = 3;
PMCValue pmc_values[fixed_pmc_cnt+8];
PMCValue* fixed_pmc_ptr = pmc_values;
PMCValue* general_pmc_ptr = fixed_pmc_ptr+fixed_pmc_cnt;
CPUIDInfo pmc_CPUIDInfo;
auto & pmc_info = *(PMC::EAX*)(&pmc_CPUIDInfo.EAX);
void rdpmc_all()
{
    fixed_pmc_ptr[0].setValue(rdpmc(PMCID::INSTRUCTIONS_RETIRED), true);
    fixed_pmc_ptr[1].setValue(rdpmc(PMCID::UNHALTED_CYCLES_MAY_SCALE), true);
    fixed_pmc_ptr[2].setValue(rdpmc(PMCID::REF_CYCLES), true);
    for(int i=0; i<pmc_info.NumPMCPerCore; i++)
    {
        general_pmc_ptr[i].setValue(rdpmc(i), true);
    }
}
void disp_pmc_all()
{
    for(int i=0; i<3; i++)
        printf("PMC Off:%ld\n", fixed_pmc_ptr[i].Offset());

    for(int i=0; i<pmc_info.NumPMCPerCore; i++)
    {
        if(general_pmc_ptr[i].Offset())
            printf("PMC Off:%ld\n", general_pmc_ptr[i].Offset());
            
    }
}

struct read_format {
    uint64_t nr;            /* The number of events */
    struct {
        uint64_t value;     /* The value of the event */
        uint64_t id;        /* if PERF_FORMAT_ID */
    } values[];
};

bool perf_open(PerfEvent& event, int group_fd=-1, int cpu=-1)
{
  struct perf_event_attr pea;
  memset(&pea, 0, sizeof(struct perf_event_attr));
  pea.type = event.type;
  pea.config = event.config;
  pea.size = sizeof(struct perf_event_attr);
  pea.disabled = 1;
  pea.exclude_kernel = 1;
  pea.exclude_hv = 1;
  pea.read_format = PERF_FORMAT_GROUP | PERF_FORMAT_ID;
  event.fd = syscall(__NR_perf_event_open, &pea, 0, cpu, group_fd, 0);
  ioctl(event.fd, PERF_EVENT_IOC_ID, &event.pmc_value.id);
}
template<size_t N>
void perf_read(int group_fd, PerfEvent(&events)[N])
{
    char buf[4096];
    struct read_format* rf = (struct read_format*)buf;
    rdpmc_all();
    printf("-------------------------------------------------\n");
    read(group_fd, buf, sizeof(buf));
    for(uint64_t i=0; i<rf->nr; i++)
    {
        for(uint64_t j=0; j<N; j++)
            if(rf->values[i].id == events[j].pmc_value.id)
                events[j].pmc_value.setValue(rf->values[i].value);
    }
    for(uint64_t i=0; i<N; i++)
        printf("%s: %ld\n", events[i].name.c_str(), events[i].pmc_value.Offset());

    printf("-------------------------------------------------\n");
    disp_pmc_all();
    printf("\n");
}

void do_something()
{
    int i;
    constexpr uint64_t size = 256*1024*1024;
    char *ptr = (char*)malloc(size);
    for(i=0; i<size; i+=4)
    {
        ptr[i] = (i&0xFF);
    }
    
    free(ptr);
}

#define CACHE_CONFIG(perf_hw_cache_id, perf_hw_cache_op_id, perf_hw_cache_op_result_id)   (perf_hw_cache_id) | (perf_hw_cache_op_id << 8) | (perf_hw_cache_op_result_id << 16)

int main(int argc, char* argv[])
{
    auto cpu = 3;
    if(argc == 2)
        cpu = atoi(argv[1]);
    SetAffinity(cpu);

    pmc_CPUIDInfo = PMC::Parse();

    PerfEvent events[] = {
        {.name = "INSTRUCTIONS",  .type =PERF_TYPE_HARDWARE, .config=PERF_COUNT_HW_INSTRUCTIONS},
        //{.name = "CPU_SCALING_CYCLES",  .type =PERF_TYPE_HARDWARE, .config=PERF_COUNT_HW_CPU_CYCLES},
        {.name = "CPU_REF_CYCLES",  .type =PERF_TYPE_HARDWARE, .config=PERF_COUNT_HW_REF_CPU_CYCLES},
        {.name = "CACHE_REF",  .type =PERF_TYPE_HARDWARE, .config=PERF_COUNT_HW_CACHE_REFERENCES},
        {.name = "CACHE_MISSES",  .type =PERF_TYPE_HARDWARE, .config=PERF_COUNT_HW_CACHE_MISSES},


        //{.name = "CPU_ITLB_MISS",  .type =PERF_TYPE_HW_CACHE, .config=CACHE_CONFIG(PERF_COUNT_HW_CACHE_ITLB,PERF_COUNT_HW_CACHE_OP_READ,PERF_COUNT_HW_CACHE_RESULT_MISS)},
        //{.name = "CPU_DTLB_MISS",  .type =PERF_TYPE_HW_CACHE, .config=CACHE_CONFIG(PERF_COUNT_HW_CACHE_DTLB,PERF_COUNT_HW_CACHE_OP_WRITE,PERF_COUNT_HW_CACHE_RESULT_MISS) },
        {.name = "CACHE_NODE_WR",  .type =PERF_TYPE_HW_CACHE, .config=CACHE_CONFIG(PERF_COUNT_HW_CACHE_NODE,PERF_COUNT_HW_CACHE_OP_WRITE,PERF_COUNT_HW_CACHE_RESULT_ACCESS) },
        {.name = "CACHE_NODE_RD",  .type =PERF_TYPE_HW_CACHE, .config=CACHE_CONFIG(PERF_COUNT_HW_CACHE_NODE,PERF_COUNT_HW_CACHE_OP_READ,PERF_COUNT_HW_CACHE_RESULT_ACCESS) },

        //{.name = "CPU_L1D_ACCESS",  .type =PERF_TYPE_HW_CACHE, .config=CACHE_CONFIG(PERF_COUNT_HW_CACHE_L1D,PERF_COUNT_HW_CACHE_OP_WRITE,PERF_COUNT_HW_CACHE_RESULT_ACCESS) },
        //{.name = "CPU_L1I_MISS",  .type =PERF_TYPE_HW_CACHE, .config=CACHE_CONFIG(PERF_COUNT_HW_CACHE_L1I,PERF_COUNT_HW_CACHE_OP_READ,PERF_COUNT_HW_CACHE_RESULT_MISS) },

       //{.name = "CPU_L1D_PREFETCH",  .type =PERF_TYPE_HW_CACHE, .config=CACHE_CONFIG(PERF_COUNT_HW_CACHE_L1D,PERF_COUNT_HW_CACHE_OP_PREFETCH,PERF_COUNT_HW_CACHE_RESULT_ACCESS) },
        //{.name = "CACHE_NODE_READ",  .type =PERF_TYPE_HW_CACHE, .config=CACHE_CONFIG(PERF_COUNT_HW_CACHE_NODE,PERF_COUNT_HW_CACHE_OP_READ,PERF_COUNT_HW_CACHE_RESULT_ACCESS) },
    };

    perf_open(events[0]);
    auto group_fd = events[0].fd;
    for(uint64_t i=1; i<sizeof(events)/sizeof(PerfEvent); i++)
        perf_open(events[i], group_fd);

    ioctl(group_fd, PERF_EVENT_IOC_RESET, PERF_IOC_FLAG_GROUP);
    ioctl(group_fd, PERF_EVENT_IOC_ENABLE, PERF_IOC_FLAG_GROUP);


    rdpmc_all();
    //for(int i=0; i<25; i++)
    while (1)
    {
        perf_read(group_fd, events);
        do_something();
    }
    
    ioctl(group_fd, PERF_EVENT_IOC_DISABLE, PERF_IOC_FLAG_GROUP);
    for(uint64_t i=1; i<sizeof(events)/sizeof(PerfEvent); i++)
        close(events[i].fd);
    return 0;
}

