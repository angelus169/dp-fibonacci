import sys
from .fib import fib


def main(args: list):
    if len(args) == 2:
        num = int(args[1])
        print(f'{num} fib number: {fib(num)}')
        return 0
    else:
        return 1


if __name__ == '__main__':
    sys.exit(main(sys.argv))
