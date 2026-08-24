package rge1

import "core:fmt"
import "core:math/rand"

main :: proc() {
	rand.reset(1729)
	n :: 1e6
	x, total := 0.0, 0.0
	for _ in 0 ..< n {
		total = 0.0
		for total < 1.0 {
			x += 1.0
			total += rand.float64()
		}
	}
	x /= n
	fmt.println(x)
}
