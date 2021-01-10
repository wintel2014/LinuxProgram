CORE=3
GLOBAL_CTRL_IND=0x38F

FIXED_CTR_CTRL_IND=0x38D
FIXED_CTR0_IND0=0x309
FIXED_CTR0_IND1=0x30a
FIXED_CTR0_IND2=0x30b

PERF_EVT_SEL_IND0=0x186
PERF_EVT_SEL_IND1=0x187
PERF_EVT_SEL_IND2=0x188
PERF_EVT_SEL_IND3=0x189
PERF_EVT_SEL_IND4=0x18a
PERF_EVT_SEL_IND5=0x18b
PERF_EVT_SEL_IND6=0x18c
PERF_EVT_SEL_IND7=0x18d
GENERAL_EVT_CTR0=0xC1

GLOBAL_CTR_CTRL_VALUE=$(sudo rdmsr -p $CORE -d $GLOBAL_CTRL_IND)
FIXED_CTR_CTRL_VALUE=$(sudo rdmsr -p $CORE -d $FIXED_CTR_CTRL_IND)


printf "%-15s: %X\n" GLOBAL_CTR_CTRL $GLOBAL_CTR_CTRL_VALUE
printf "%-15s: %X %12X %12X %12X\n" FIXED_CTR_CTRL $FIXED_CTR_CTRL_VALUE $(sudo rdmsr -p $CORE -d $FIXED_CTR0_IND0) $(sudo rdmsr -p $CORE -d $FIXED_CTR0_IND1) $(sudo rdmsr -p $CORE -d $FIXED_CTR0_IND2)

printf "%-15s: %X %X\n" PERF_EVT_SEL0 $(sudo rdmsr -p $CORE -d $PERF_EVT_SEL_IND0) $(sudo rdmsr -p $CORE -d 0xC1)
printf "%-15s: %X %X\n" PERF_EVT_SEL1 $(sudo rdmsr -p $CORE -d $PERF_EVT_SEL_IND1) $(sudo rdmsr -p $CORE -d 0xC2)
printf "%-15s: %X %X\n" PERF_EVT_SEL2 $(sudo rdmsr -p $CORE -d $PERF_EVT_SEL_IND2) $(sudo rdmsr -p $CORE -d 0xC3)
printf "%-15s: %X %X\n" PERF_EVT_SEL3 $(sudo rdmsr -p $CORE -d $PERF_EVT_SEL_IND3) $(sudo rdmsr -p $CORE -d 0xC4)
printf "%-15s: %X %X\n" PERF_EVT_SEL4 $(sudo rdmsr -p $CORE -d $PERF_EVT_SEL_IND4) $(sudo rdmsr -p $CORE -d 0xC5)
printf "%-15s: %X %X\n" PERF_EVT_SEL5 $(sudo rdmsr -p $CORE -d $PERF_EVT_SEL_IND5) $(sudo rdmsr -p $CORE -d 0xC6)
printf "%-15s: %X %X\n" PERF_EVT_SEL6 $(sudo rdmsr -p $CORE -d $PERF_EVT_SEL_IND6) $(sudo rdmsr -p $CORE -d 0xC7)
printf "%-15s: %X %X\n" PERF_EVT_SEL7 $(sudo rdmsr -p $CORE -d $PERF_EVT_SEL_IND7) $(sudo rdmsr -p $CORE -d 0xC8)



printf "%s:%X %s:%X\n" 1A6 $(sudo rdmsr -p $CORE -d 0x1A6) 1A7 $(sudo rdmsr -p $CORE -d 0x1A7)
