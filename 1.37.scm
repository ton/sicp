(define phi (/ (+ 1 (sqrt 5)) 2))

(define (cont-frac n d k)
  (define (cont-frac-rec i)
    (if (<= i k)
        (/ (n i) (+ (d i) (cont-frac-rec (+ i 1))))
        0))
  (cont-frac-rec 1))

(define (cont-frac-iter n d k)
  (define (iter i sum)
    (if (= i 0)
        sum
        (iter (- i 1) (/ (n i) (+ (d i) sum)))))
  (iter k 0))

(define (e-minus-2 k)
  (cont-frac-iter (lambda (i) 1.0)
                  (lambda (i)
                    (if (= (remainder (- i 2) 3) 0)
                        (+ (* (/ (- i 2) 3) 2) 2)
                        1))
                  k))

(define (tan-cf x k)
  (cont-frac-iter (lambda (i)
                    (if (= i 1)
                        x
                        (- (square x))))
                  (lambda (i) (+ (* (- i 1) 2) 1))
                  k))
