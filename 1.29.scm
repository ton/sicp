(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (integral f a b dx)
  (define (add-dx x) (+ x dx))
  (* (sum f (+ a (/ dx 2.0)) add-dx b) dx))

(define (simpson-integral f a b n)
  (define h (/ (- b a) n))

  (define (simpson-fn k)
    (define input (+ a (* k h)))
    (cond ((= k 0) (f input))
          ((= k n) (f input))
          ((even? k) (* (f input) 2))
          (else (* (f input) 4))))

  (define (next-k k) (+ k 1))
  (* (sum simpson-fn 0 next-k n)
     (/ h 3)))
