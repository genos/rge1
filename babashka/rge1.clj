(println
 (/ (reduce + (for [_ (range 1e6)]
                (loop [i 0.0 t 0.0]
                  (if (< t 1.0) (recur (inc i) (+ t (rand))) i))))
    1e6))
