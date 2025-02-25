(let [n 1e6]
  (println
    (/ (reduce + (for [_ (range n)]
                   (loop [i 0.0 t 0.0]
                     (if (< t 1.0) (recur (inc i) (+ t (rand))) i))))
       n)))
