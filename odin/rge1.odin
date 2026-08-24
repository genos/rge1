package main

import "core:fmt"
import "core:math/rand"

main :: proc() {
	n: u32 : 1e6
	rand.reset_u64(1729)
	x: f64 = 0.0
	total: f64
	for _ in 0 ..< n {
		total = 0.0
		for total < 1 {
			x += 1
			total += rand.float64()
		}
	}
	x /= f64(n)
	fmt.println(x)
}
