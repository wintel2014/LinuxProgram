#!/usr/bin/python3

def log(text):
    def decorator(func):
        def wrapper(*args, **kw):
            print('%s %s():' % (text, func.__name__))
            return func(*args, **kw)
        return wrapper
    return decorator

@log('execute')
def now():
    print('now 2015-3-25')

def now_2():
    print('now_2 2015-3-25')

now()
log('execute')(now_2)()


print("\n\n")

def use_logging(level):

    def decorator(func):
        def wrapper(*args, **kwargs):
            print("[%s] %s is running" % (level,func.__name__) )
            return func(*args)
        return wrapper

    return decorator



@use_logging(level="warn")
def foo(name='foo'):
    print("i am %s" % name)

foo()





class Foo(object):
    def __init__(self, func):
        self._func = func
    
    def __call__(self):
        print ('class decorator runing')
        self._func()
        print ('class decorator ending')

@Foo
def bar():
    print ('bar')
bar()


import time
from functools import wraps

# A simple decorator
def timethis(func):
    @wraps(func)
    def wrapper(*args, **kwargs):
        start = time.time()
        r = func(*args, **kwargs)
        end = time.time()
        if len(args) == 2:
            print("{}.{}({}) takes {} seconds\n".format(args[0], func.__name__, args[1], end-start))
        else:
            print("{}({}) takes {} seconds\n".format(func.__name__, args[0], end-start))
        return r
    return wrapper

# Class illustrating application of the decorator to different kinds of methods
#在Python中，类方法（class method）和静态方法（static method）都是用来在类中定义方法的。
#
#主要区别在于：
#1.类方法使用@classmethod装饰器来声明，第一个参数默认为类本身（通常命名为cls），可以通过这个参数来访问和修改类属性。而静态方法使用@staticmethod装饰器来声明，不需要类作为参数，也不能访问和修改类属性。
#2.类方法可以访问类属性和方法，也可以通过子类来调用和修改。而静态方法不能访问类属性和方法，也不能被子类重载。
#3.类方法通常用于需要操作类属性的方法，例如修改类属性、获取类属性等。而静态方法通常用于和类没有直接关系的方法，例如一些公共方法、工具方法等。
class Spam:
    attr = "Test"
    @timethis
    def instance_method(self, n):
        print("instance_method: ", self, n)
        while n > 0:
            n -= 1

    @classmethod
    @timethis
    def class_method(cls, n):
        print("class_method: ", cls, n, cls.attr)
        while n > 0:
            n -= 1

    @staticmethod
    @timethis
    def static_method(n):
        print(n)
        while n > 0:
            n -= 1

print("\n\n")
s = Spam()
s.instance_method(1000000)
s.class_method(10000)
Spam.class_method(1000000)
Spam.static_method(1000000)



#@property装饰符修饰成员函数diameter()和radius()，会自动生成对应的diameter和radius属性，当调用获取相应值时，就调用该函数
class Circle(object):
    def __init__(self, radius):
        self._radius = radius
    
    def cylinder_volume(self,height):
        """Calculate volume of cylinder with circle as base"""
        return self.area * height

    @property
    def diameter(self):
        print("get diameter")
        return self._radius * 2  
    @diameter.setter
    def diameter(self, new_diameter):
        print("set diameter")
        if new_diameter > 0:
            self._radius = new_diameter / 2
        else: 
            raise ValueError("Diameter should be positive!")   

c = Circle(1)
a = c.diameter
c.diameter = a+1


def my_decorator(cls, **kwargs):
    # Modify or extend class behavior
    setattr(cls, 'newattr', 'Dynamically set in decorator')
    return cls

@my_decorator
class MyClass:
    # Class definition
    pass

c = MyClass()
print(c.newattr)
