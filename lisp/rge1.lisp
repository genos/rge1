(in-package #:rge1)

(declaim (optimize (speed 3) (safety 0) (space 0) (debug 0)))

(declaim (ftype (function (fixnum) single-float) single-run))
(defun single-run (_ignored)
 (loop for total = 0.0 then (+ total (random 1.0))
       for iters from 0.0
       do (when (> total 1.0) (return iters))))

(declaim (ftype (function (fixnum) single-float) n-runs))
(defun n-runs-average (n)
  (/ (lparallel:pmap-reduce
       #'single-run
       #'+
       (loop for i below n collecting i))
    n))

(defun main ()
  (let* ((args (uiop:command-line-arguments))
         (n (parse-integer (or (first args) "1000000")))
         (cs (parse-integer (or (second args) "16"))))
    (setf lparallel:*kernel* (lparallel:make-kernel cs))
    (uiop:println (rge1:n-runs-average n))))
