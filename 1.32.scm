(define (identity x) x)

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (product term a next b)
  (if (> a b)
      1
      (* (term a)
         (product term (next a) next b))))

(define (accumulate combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a)
                (accumulate combiner null-value term (next a) next b))))

(define (accumulate-iter combiner null-value term a next b)
  (define (iter n result)
    (if (> n b)
        result
        (iter (next n) (combiner (term n) result))))
  (iter a null-value))

(define (sum-accumulate term a next b)
  (accumulate + 0 term a next b))

(define (product-accumulate term a next b)
  (accumulate * 1 term a next b))
