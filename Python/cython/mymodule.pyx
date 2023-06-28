cdef int fibonacci(int n):
    cdef int a = 0
    cdef int b = 1
    cdef int i

    for i in range(n):
        a, b = b, a + b

    return a

def fibonacci_sequence(int n):
    result = []
    for i in range(n):
        result.append(fibonacci(i))
    return result
