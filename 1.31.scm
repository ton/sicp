(define (product term a next b)
  (if (> a b)
      1
      (* (term a)
         (product term (next a) next b))))

(define (product-iter term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* result (term a)))))
  (iter a 1))

(define (identity x) x)

(define (factorial n)
  (product identity 1 1+ n))

(define (factorial-iter n)
  (product-iter identity 1 1+ n))

; 1 -> 2, 1 -> 3
; 2 -> 4, 2 -> 3
; 3 -> 4, 3 -> 5
; 4 -> 6, 4 -> 5
; 5 -> 6, 5 -> 7

(define (quarter-pi n)
  (define (factor i)
    (if (even? i)
        (/ (+ i 2) (+ i 1))
        (/ (+ i 1) (+ i 2))))
  (product factor 1 1+ n))
