(load "sicp.scm")

(define (pow x y)
  (accumulate * 1 (lambda (i) x) 1 1+ y))

(define (n-th-root n)
  (define (repeated-average-damp n)
    (repeated average-damp (if (> n 2)
                               (- n 2)
                               n)))
  (lambda (x) (fixed-point ((repeated-average-damp n)
                            (lambda (y) (/ x (pow y (- n 1)))))
                           1.0)))
