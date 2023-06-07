#!/usr/bin/python3

class ClassB:
    def add(self, x, y):
        return x + y

class ClassA:
    def __init__(self):
        self.objB = ClassB()

    def add(self, x, y):
        return self.objB.add(x, y)

#__getattr__是Python中的特殊方法，用于在访问不存在的属性时执行自定义操作
class ClassC:
    def __init__(self):
        self.objB = ClassB()

    def __getattr__(self, attr):
        if attr=="add":
            return getattr(self.objB, attr)
        else:
            return -1

objA = ClassA()
result = objA.add(3, 5)
print(result)  # 输出：8

objC = ClassC()
result = objC.add(3, 5)
print(result)  # 输出：8

