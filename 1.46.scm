; (define (fixed-point f first-guess)
;   (define (close-enough? v1 v2)
;     (< (abs (- v1 v2)) tolerance))
;   (define (try guess)
;     (let ((next (f guess)))
;       (if (close-enough? guess next)
;           next
;           (try next))))
;   (try first-guess))

(load "sicp.scm")

(define (iterative-improve good-enough? improve-guess)
  (lambda (guess)
    (if (good-enough? guess)
        guess
        ((iterative-improve good-enough? improve-guess) (improve-guess guess)))))

(define tolerance 0.00001)

(define (fixed-point f first-guess)
  ((iterative-improve
     (lambda (x) (< (abs (- x (f x))) tolerance))
     (average-damp f))
   first-guess))

(define (sqrt x)
  ((iterative-improve
     (lambda (guess) (< (abs (- (square guess) x)) 0.00001))
     (lambda (guess) (/ (+ guess (/ x guess)) 2))
     ) 1.0))
