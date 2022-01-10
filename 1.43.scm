(load "sicp.scm")

; (define (repeated f n)
;   (define (iter i g)
;     (if (< i n)
;         (iter (+ i 1) (compose f g))
;         g))
;   (iter 1 f))

(define (repeated f n)
  (if (= n 1)
      f
      (compose f (repeated f (- n 1)))))
