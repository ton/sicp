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
; This can be written as fast-mult. Assume double and halve are defined by the language.

(define (halve n)
  (/ n 2))

(define (double n)
  (+ n n))

(define (fast-mult a b)
  (define (even? n)
    (= (remainder n 2) 0))
  (cond ((= 0 b) 0)
        ((even? b) (double (fast-mult a (halve b))))
        (else (+ a (fast-mult a (- b 1))))))
