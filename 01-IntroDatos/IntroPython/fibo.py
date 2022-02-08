# Fibonacci numbers module

def fib_print(n):
    """print Fibonacci series up to n"""
    a, b = 0, 1
    while a < n:
        print(a, end=' ')
        a, b = b, a+b
    print()

    
def fib_return(n):
    """return Fibonacci series up to n"""
    result = []
    a, b = 0, 1
    while a < n:
        result.append(a)
        a, b = b, a+b
    return result


if __name__ == "__main__":
    import sys
    fib(int(sys.argv[1]))