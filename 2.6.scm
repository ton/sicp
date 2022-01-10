(define zero (lambda (f) (lambda (x) x)))

(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))

; add-1 zero
; (lambda (f) (lambda (x) (f ((zero f) x))))
; (lambda (f) (lambda (x) (f (((lambda (g) (lambda (h) h)) f) x))))
; (lambda (f) (lambda (x) (f ((lambda (h) h) x))))
; (lambda (f) (lambda (x) (f x)))

(define one (lambda (f) (lambda (x) (f x))))

; add-1 one
; (lambda (f) (lambda (x) (f ((one f) x))))
; (lambda (f) (lambda (x) (f (((lambda (g) (lambda (h) (g h))) f) x))))
; (lambda (f) (lambda (x) (f ((lambda (h) f h) x))))
; (lambda (f) (lambda (x) (f (f x))))

(define two (lambda (f) (lambda (x) (f (f x)))))

 (define two (lambda (f) (f (lambda (x) (f x)))))
; (define two (lambda (f) (f (lambda (x) (f x)))))

(define (+ a b)
  (lambda (f) (lambda (x) ((a f) x)
