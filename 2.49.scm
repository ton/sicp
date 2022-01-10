; 2.49
(define (outline-painter)
  (segments->painter
    (make-segment (make-vector 0.0 0.0) (make-vector 1.0 0.0))
    (make-segment (make-vector 1.0 0.0) (make-vector 1.0 1.0))
    (make-segment (make-vector 1.0 1.0) (make-vector 0.0 1.0))
    (make-segment (make-vector 0.0 1.0) (make-vector 0.0 0.0))))

(define (x-painter)
  (segments-painter
    (make-segment (make-vector 0.0 0.0) (make-vector 1.0 1.0))
    (make-segment (make-vector 0.0 1.0) (make-vector 1.0 0.0))))

(define (diamond-painter)
  (segments-painter
    (make-segment (make-vector 0.5 0.0) (make-vector 1.0 0.5))
    (make-segment (make-vector 1.0 0.5) (make-vector 0.5 1.0))
    (make-segment (make-vector 1.0 0.5) (make-vector 0.0 0.5))
    (make-segment (make-vector 0.0 0.5) (make-vector 0.5 0.0))))
