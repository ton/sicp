(load "sicp.scm")

(define (unique-triplets n)
  (flatmap
    (lambda (i)
      (flatmap
        (lambda (j)
          (map
            (lambda (k) (list i j k))
            (enumerate-interval 1 (- j 1))))
        (enumerate-interval 1 (- i 1))))
    (enumerate-interval 1 n)))

(define (sum-n? triplet n)
  (= (+ (car triplet) (cadr triplet) (caddr triplet)) n))

(define (sum-triplets n s)
  (filter (lambda (t) (sum-n? t s)) (unique-triplets n)))
