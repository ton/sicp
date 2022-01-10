; For example, 8 * b can be written as:
; 
;  b + (b + (b + (b + (b + (b + (b + b))))))
;
; This can be divided in three computations:
;
;  2 * b = b + b
;  4 * b = 2 * b + 2 * b
;  8 * b = 4 * b + 4 * b
;
; In general, we can say:
;
;  n * b = (n / 2) * b + (n / 2) * b    (n is even)
;  n * b = b + (n - 1) * b              (n is odd)
;
; For the tail-recursive function, add an additional state variable q, such that 
; q + a * n does not change from state to state. In case n is even:
;
;  q + a * n = q + (a * 2) * (n / 2)
;
; Thus, in case n is even, we adapt a instead of q! In case n is odd:
;
;  q + a * n = (q + a) + a * (n - 1)

(define (halve n)
  (/ n 2))

(define (double n)
  (+ n n))

(define (even? n)
(= (remainder n 2) 0))

(define (fast-mult a b)
  (define (iter q a b)
    (cond ((= 0 b) q)
          ((even? b) (iter q (double a) (halve b)))
          (else (iter (+ q a) a (- b 1)))))
  (iter 0 a b))
