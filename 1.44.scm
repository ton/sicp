(load "sicp.scm")

(define (smoothed f)
  (define (average a b c)
    (/ (+ a b c) 3))
  (lambda (x) (average (f (- x dx)) (f x) (f (+ x dx)))))

(define (repeated f n)
  (if (= n 1)
      f
      (compose f (repeated f (- n 1)))))

; (define (n-fold-smoothed f n)
;   (lambda (x) (((repeated smoothed n) f) x)))

(define (n-fold-smoothed f n)
  ((repeated smoothed n) f))
