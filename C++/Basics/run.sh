g++ reference.cpp -o test1  -fauto-inc-dec -fbranch-count-reg -fcombine-stack-adjustments -fcompare-elim -fcprop-registers -fdce -fdefer-pop -fdse -fforward-propagate -fguess-branch-probability -fif-conversion -fif-conversion2
g++ reference.cpp -o test2  -finline-functions-called-once -fipa-profile -fipa-pure-const -fipa-reference -fipa-reference-addressable -fmerge-constants -fmove-loop-invariants -fomit-frame-pointer -freorder-blocks -fshrink-wrap -fshrink-wrap-separate
g++ reference.cpp -o test3  -fsplit-wide-types -fssa-backprop -fssa-phiopt -ftree-bit-ccp -ftree-ccp -ftree-ch -ftree-coalesce-vars -ftree-copy-prop -ftree-dce -ftree-dominator-opts -ftree-dse -ftree-forwprop -ftree-fre -ftree-phiprop -ftree-pta
g++ reference.cpp -o test4  -ftree-scev-cprop -ftree-sink -ftree-slsr -ftree-sra -ftree-ter -funit-at-a-time


 g++ reference.cpp -o test1 -falign-functions  -falign-jumps -falign-labels  -falign-loops -fcaller-saves -fcode-hoisting -fcrossjumping -fcse-follow-jumps  -fcse-skip-blocks -fdelete-null-pointer-checks -fdevirtualize  -fdevirtualize-speculatively
g++ reference.cpp -o test2  -fexpensive-optimizations -fgcse  -fgcse-lm -fhoist-adjacent-loads -finline-small-functions -findirect-inlining -fipa-bit-cp  -fipa-cp  -fipa-icf -fipa-ra  -fipa-sra  -fipa-vrp -fisolate-erroneous-paths-dereference -flra-remat
g++ reference.cpp -o test3  -foptimize-sibling-calls -foptimize-strlen -fpartial-inlining -fpeephole2 -freorder-blocks-algorithm=stc -freorder-blocks-and-partition  -freorder-functions -frerun-cse-after-loop -fschedule-insns  -fschedule-insns2
g++ reference.cpp -o test4  -fsched-interblock  -fsched-spec -fstore-merging -fstrict-aliasing -fthread-jumps -ftree-builtin-call-dce -ftree-pre -ftree-switch-conversion  -ftree-tail-merge -ftree-vrp


g++ reference.cpp -o test1        -fgcse-after-reload -finline-functions -fipa-cp-clone -floop-interchange -floop-unroll-and-jam -fpeel-loops -fpredictive-commoning -fsplit-paths -ftree-loop-distribute-patterns -ftree-loop-distribution -ftree-loop-vectorize
g++ reference.cpp -o test22           -ftree-partial-pre -ftree-slp-vectorize -funswitch-loops -fvect-cost-model -fversion-loops-for-strides

