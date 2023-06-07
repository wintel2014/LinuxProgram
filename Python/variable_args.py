#!/usr/bin/python3
#可变参数允许你传入0个或任意个参数，这些可变参数在函数调用时自动组装为一个tuple,
#而关键字参数允许你传入0个或任意个含参数名的参数，这些关键字参数在函数内部自动组装为一个dict

def argsFunc(a, *args):
    print (a)
    print (args[1])
    print (args)

argsFunc(1, 2, 3, 4)
#1
#3
#(2, 3, 4)

def kw_args_func(**kwargs):
    print (kwargs) 

kw_args_func(x=1,y=2,z=3) #{'x': 1, 'y': 2, 'z': 3}

def kw_args_connect(**kwargs):
    print (kwargs["user"])
    print (kwargs)

#将命名参数key=value, 以字典的形式传入函数
kw_args_connect(user='Wang', password='pw213')

#将字典以可变参数的形式传入函数
db_conf = {
	'user':'Wang',
	'password':'pw213', 
	'host':'xxx.xxx.xxx.xxx',
	'database':'sql'
}

print("================================")
print(db_conf)
kw_args_connect(**db_conf)
print("================================")



def f1(a, b, c=0, *args, **kw):
    print('a =', a, 'b =', b, 'c =', c, 'args =', args, 'kw =', kw)

def f2(a, b, c=0, *, d, **kw):
    print('a =', a, 'b =', b, 'c =', c, 'd =', d, 'kw =', kw)


f1(1, 2)
#a = 1 b = 2 c = 0 args = () kw = {}
f1(1, 2, c=3)
#a = 1 b = 2 c = 3 args = () kw = {}
f1(1, 2, 3, 'a', 'b')
#a = 1 b = 2 c = 3 args = ('a', 'b') kw = {}
f1(1, 2, 3, 'a', 'b', x=99)
#a = 1 b = 2 c = 3 args = ('a', 'b') kw = {'x': 99}
f2(1, 2, d=99, ext=None)
#a = 1 b = 2 c = 0 d = 99 kw = {'ext': None}
