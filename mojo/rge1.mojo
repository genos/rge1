from algorithm import mean, parallelize
from buffer import Buffer
from memory import UnsafePointer
from random import random_float64


def main():
    var ptr = UnsafePointer[Scalar[DType.float64]].alloc(1_000_000)
    var x = Buffer[DType.float64, 1_000_000](ptr)

    @parameter
    fn f(i: Int) capturing -> None:
        var total: Float64 = 0.0
        while total < 1.0:
            total += random_float64()
            x[i] += 1.0

    parallelize[f](len(x))
    print(mean(x))
    ptr.free()
