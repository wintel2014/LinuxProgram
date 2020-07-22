http://nicephil.blinkenshell.org/my_book/ch07s04.html

动态链接比静态链接灵活，但牺牲了性能，据统计ELF程序在静态链接下比动态库快大约1%~5%。
主要原因是，动态链接下对于全局和静态数据的访问都要进行复杂的GOT定位，然后间接寻址，对于模块间的调用也要先定位GOT，然后进行间接跳转。
另外，动态链接的链接过程是在运行时完成的，动态链接器会寻找并转载所需要的对象，然后进行符号查找地址重定位等工作。

延迟绑定实现：
因为很多函数可能在程序执行完时都不会被用到，比如错误处理函数或一些用户很少用到的功能模块等，那么一开始就把所有函数都链接好实际是一种浪费，因此ELF采用了一种延迟绑定（Lazy Binding），就是在当函数第一次被用到时才进行绑定（符号查找，重定位等），如果没有用到则不进行绑定。
ELF使用PLT（Procedure Linkage Table）的方法来实现，使用一些很精妙的指令序列来完成。
Glibc提供了地址绑定的函数_dl_runtime_resolve()，当我们调用某个外部模块的函数时，按照正常做法应该通过GOT中的相应的项进行间接跳转。PLT为了实现延迟绑定，在这个过程中邮增加了一层间接跳转。调用函数并不直接通过GOT跳转而是使用PLT项的结构来进行跳转。每个外部函数在PLT中都有一个相应的项。比如bar()函数：
bar@plt:
jmp *(bar@GOT)
push n
push moduleID
jump _dl_runtime_resove
第一条指令通过GOT间接跳转指令。bar@GOT表示GOT中保存bar()函数地址的相应项。如果李娜节气艾初始化阶段已经初始化该项，并且将bar()地址填入该项，那么结果是跳转到bar()。为了实现延迟绑定，链接器在初始化阶段并没有将bar()地址填入该项，而是将上面第二条指令"push n"的地址填入到bar@GOT中哦功能，这个步骤不需要查找任何符号，所以代价很小，那么第一条指令相当于跳转到第二条指令，第二条指令将数字n压栈，n是bar这个符号应用在重定位表".rel.plt"中的下标，接着一条push指令将模块ID压栈，让阿后跳转到_dl_runtime_resolve。实际是：先将所需要决议的符号的下标压入栈，后将模块ID入栈，然后调用动态链接器的_dl_runtime_resolve()函数完成符号解析和重定位工作。一旦函数被解析完毕，当再次调用bar@plt时，第一条jmp指令就能够跳转到真正的bar()函数。

ELF将GOT拆成两个部分".got",".got.plt"，其中.got保存全局变量引用的地址，.got.plt波阿村函数引用地址。所有对于外部函数的引用都分离出来放在.got.plt中。它的前三项有特殊用途：
第一项保存的是.dynamic的地址，这个段描述了本模块动态链接相关信息
第二项保存的是本模块ID
第三项是_dl_runtime_resolve()的地址。
其中第二项和第三项由动态链接器在装载共享模块时负责将他们初始化。.got.plt的其余项分别对应每个外部函数的引用。
.got.plt:
Address of .dynamic
Module ID "Lib.so"
_dl_runtime_resolve()
import func1
import func2
...
...

PLT结构也有点不同，为了避免代码的重复，ELF把最后两条指令放在了PLT中的第一项。
PLT0:
push *(GOT + 4)
jump *(GOT + 8)
...
bar@plt:
jmp *(bar@GOT)
push n
jump PLT0

PLT在ELF文件中放在.plt段，因为本身是地址无关代码因此，和代码段一起放在可读可执行的Segment被装载进内存。
