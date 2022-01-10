(define (make-interval x y) (cons x y))

(define (lower-bound x) (car x))
(define (upper-bound x) (cdr x))

(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
                 (+ (upper-bound x) (upper-bound y))))

(define (sub-interval x y)
  (make-interval (- (lower-bound x) (upper-bound y))
                 (- (upper-bound x) (lower-bound y))))

(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4) 
                   (max p1 p2 p3 p4))))

; Note: much easier: lower-bound * upper-bound <= 0
(define (interval-spans-zero? x)
  (cond ((< (lower-bound x) 0) (>= (upper-bound x) 0))
        ((= (lower-bound x) 0) #t)
        ((= (upper-bound x) 0) #t)
        (else #f)))

(define (div-interval x y)
  (cond ((interval-spans-zero? x) error)
        ((interval-spans-zero? y) error)
        (else
          (mul-interval x (make-interval (/ 1.0 (upper-bound y))
                                         (/ 1.0 (lower-bound y)))))))

(define (width-interval x)
  (/ (- (upper-bound x) (lower-bound x)) 2))

(define (make-center-width c w)
  (make-interval (- c w) (+ c w)))

(define (center-interval i)
  (/ (+ (lower-bound i) (upper-bound i)) 2))

(define (make-center-percentage c p)
  (make-center-width c (* (/ p 100.) c)))

(define (percentage-interval i)
  (* 100 (/ (width-interval i) (center-interval i))))
