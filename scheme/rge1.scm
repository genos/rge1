#!/usr/bin/env chez --optimize-level=3 --script
(let outer ([i 0.0] [x 0.0])
  (if (< i 1e6)
    (outer (1+ i)
           (+ x
              (let inner ([iters 0.0] [total 0.0])
                (if (< total 1.0)
                  (inner (1+ iters) (+ total (random 1.0)))
                  iters))))
    (display (/ x 1e6))))
(newline)
(exit)
