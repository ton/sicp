; As per the hint, we introduce an additional state variable a, such that (a *
; b^n) remains constant for each state change. In case n is even:
;
;  a * b^n = a * (b^(n/2))^2
;          = a * (b^2)^(n/2)
;
; Thus, in case n is even, we adapt b instead of a! In case n is odd:
;
;  a * b^n = a * b * b^(n-1)

(define (expt b n)
  (define (even? x)
    (= (remainder x 2) 0))
  (define (iter a b n)
    (cond ((= 0 n) a)
          ((even? n) (iter a (square b) (/ n 2)))
          (else (iter (* a b) b (- n 1)))))
  (iter 1 b n))
