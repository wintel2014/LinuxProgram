#define cat(x,y)  x ## y
#define xcat(x,y) cat(x,y)
cat(cat(1,2), 3) //why not 123
xcat(xcat(1,2), 3)

/*
宏函数替换展开，规则可简单总结如下：在展开当前宏函数时，如果形参有#（字符串化操作）或##（记号连接操作）则不进行宏参数的展开，否则先展开宏参数，再展开当前宏（就像先计算函数中的参数，然后调用函数一样）。回头看最初的问题，则两个宏展开过程如下：

cat(cat(1,2),3)
=> cat(1,2) ## 3    // cat(x,y)  x##y参数前有##操作，参数不展开
=> cat(1,2)3        // K&R中说，)3 是一个不合法记号，不展开

xcat(xcat(1,2),3)
=> xcat(cat(1,2),3)  //xcat(x,y) cat(x,y)参数前无#，##操作，则先展开参数
=> xcat(1 ## 2,3)
=> xcat(12,3)
=> cat(12,3)
=> 12 ## 3
=> 123
*/
