GLOBAL_CTRL=0x38F
#
#
#
CORE=2
BRANCH_MISS=0x4100c5
LLC_REFERENCE=0x414f2e
sudo wrmsr -a 0x186 $BRANCH_MISS
echo -e "Init BRANCH_MISS PMC: "
sudo rdmsr -p $CORE -d 0xC1
sudo wrmsr -p $CORE $GLOBAL_CTRL 0x7000000ff
sudo wrmsr -p $CORE 0xc1 0
sudo rdmsr -p $CORE -d 0xC1
sudo wrmsr -a 0x186 0
sudo wrmsr -a 0x186 $LLC_REFERENCE
sudo wrmsr -p $CORE 0xc1 0
sleep 5

ReadPMC() {
    sleep 2
    sudo rdmsr -p $CORE -d 0xC1
    sleep 2
    sudo rdmsr -p $CORE -d 0xC1
    sleep 2
    sudo rdmsr -p $CORE -d 0xC1
    sleep 2
    sudo rdmsr -p $CORE -d 0xC1
    sleep 2
    sudo rdmsr -p $CORE -d 0xC1
}

sudo wrmsr -p $CORE 0x186 $BRANCH_MISS
sudo wrmsr -p $CORE 0x186 0x0
echo -e "\nDisable PMC"
ReadPMC

sudo wrmsr -p $CORE 0x186 $BRANCH_MISS
echo -e "\nEnable PMC"
ReadPMC

sudo wrmsr -p $CORE 0x186 $LLC_REFERENCE
echo -e "\nSwitch to LLC_REFERENCE"
ReadPMC
#sudo wrmsr -p 3 $GLOBAL_CTRL 0x0
#./rdpmc
#
#sudo wrmsr -p 3 0x38f 0x7000000ff
#echo -e "\nEnable PMC"
#./rdpmc
