from algorithm import mean, parallelize
from random import random_float64


def main():
    var ptr = alloc[Float64](1_000_000)
    var x = Span(ptr=ptr, length=1_000_000)

    @parameter
    fn f(i: Int) capturing -> None:
        var total: Float64 = 0.0
        while total < 1.0:
            total += random_float64()
            x[i] += 1.0

    parallelize[f](len(x))
    print(mean(x))
    ptr.free()
