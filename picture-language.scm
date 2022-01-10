; 2.46
(define (make-vect x y)
  (cons x y))

(define (xcor-vect v)
  (car v))

(define (ycor-vect v)
  (cdr v))

(define (add-vect v w)
  (make-vect (+ (xcor-vect v) (xcor-vect w))
             (+ (ycor-vect w) (ycor-vect w))))

(define (sub-vect v w)
  (make-vect (- (xcor-vect v) (xcor-vect w))
             (- (ycor-vect w) (ycor-vect w))))

(define (scale-vect v s)
  (make-vect (* (xcor-vect v) s)
             (* (ycor-vect v) s)))

; 2.47
(define (make-frame origin edge1 edge2)
  (cons origin (cons edge1 edge2)))

(define (origin-frame frame)
  (car frame))

(define (edge1-frame frame)
  (cadr frame))

(define (edge2-frame frame)
  (cddr frame))

; 2.48
(define (make-segment p q)
  (cons p q))

(define (start-segment s)
  (car p))

(define (end-segment s)
  (cdr p))

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

; 2.50
(define (flip-horiz painter)
  (transform-painter painter
                     (make-vect 1.0 0.0)
                     (make-vect 0.0 0.0)
                     (make-vect 1.0 1.0)))

; (define (rotate-180 painter)
;   (rotate90 (rotate90 painter)))

(define (rotate-180 painter)
  (transform-painter painter
                     (make-vect 1.0 1.0)
                     (make-vect 0.0 1.0)
                     (make-vect 1.0 0.0)))

(define (rotate-270 painter)
  (transform-painter painter
                     (make-vect 0.0 1.0)
                     (make-vect 1.0 1.0)
                     (make-vect 0.0 0.0)))

; (define (rotate-270 painter)
;   (rotate90 (rotate180 painter)))
