(defn single-run []
  (var iters 0.0)
  (var total 0.0)
  (while (< total 1.0)
    (+= total (math/random))
    (+= iters 1.0))
  iters)

(defn n-runs-avg [n]
  (var total 0.0)
  (loop [i :range [0 n]] (+= total (single-run)))
  (/ total n))

(defn main [& args]
  (print (n-runs-avg 1_000_000)))
