package main

import (
	"fmt"
	"math/rand/v2"
)

func main() {
	n, r, x := 1e6, rand.New(rand.NewPCG(1729, 8675309)), 0.0
	for range int64(n) {
		for total := 0.0; total < 1.0; x++ {
			total += r.Float64()
		}
	}
	x /= n
	fmt.Printf("%f\n", x)
}
