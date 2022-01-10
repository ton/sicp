(define (make-point x y)
  (cons x y))

(define (x-point p)
  (car p))

(define (y-point p)
  (cdr p))

(define (make-segment p q)
  (cons p q))

(define (start-segment s)
  (car s))

(define (end-segment s)
  (cdr s))

(define (average x y)
  (/ (+ x y) 2))

(define (average-points p q)
  (make-point (average (x-point p) (x-point q))
              (average (y-point p) (y-point q))))

(define (midpoint-segment s)
  (average-points (start-segment s) (end-segment s)))

; (define (make-rectangle bottom-left top-right)
;   (cons bottom-left top-right))

(define (make-rectangle top-left bottom-right)
  (cons top-left bottom-right))

(define (top-left r)
  (car r))

(define (bottom-right r)
  (cdr r))

(define (bottom-left r)
  (make-point (x-point (top-left r)) (y-point (bottom-right r))))

(define (top-right r)
  (make-point (x-point (bottom-right r)) (y-point (top-left r))))

(define (bottom r)
  (y-point (bottom-right r)))

(define (top r)
  (y-point (top-left r)))

(define (left r)
  (x-point (top-left r)))

(define (right r)
  (x-point (bottom-right r)))

(define (width r)
  (- (right r) (left r)))

(define (height r)
  (- (top r) (bottom r)))

(define (perimeter r)
  (+ (* (width r) 2) (* (height r) 2)))

(define (area r)
  (* (width r) (height r)))
