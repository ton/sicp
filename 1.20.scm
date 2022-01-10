; Using the following function for the greatest common divider:

(define (gcd x y)
  (if (= y 0)
      x
      (gcd y (remainder x y))))

; In applicative-order evaluation, the following operations are performed:
;
; (gcd 206 40)
; (gcd 40 (remainder 206 40))
; (gcd 40 6)
; (gcd 6 (remainder 40 6))
; (gcd 6 4)
; (gcd 4 (remainder 6 4))
; (gcd 4 2)
; (gcd 2 (remainder 4 2))
; (gcd 2 0)
; 12
;
; So, a total of four remainder operations.
;
; In normal-order evaluation, the following operations are performed:
;
; (gcd 206 40)
; (gcd 40 (remainder 206 40))
; (if (= (remainder 206 40) 0))
; (if (= 6 0))
; (gcd (remainder 206 40) (remainder 40 (remainder 206 40)))
; (if (= (remainder 40 (remainder 206 40)) 0))
; (if (= 4 0))
; (gcd (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))
; (if (= (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) 0))
; (if (= 2 0))
; (gcd (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
;      (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))
; (if (= (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))) 0))
; (if (= 0 0))
; (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
;
; So, 14 evaluations of remainder in the conditions, and 4 evaluations of remainder in the final evaluation of y.
