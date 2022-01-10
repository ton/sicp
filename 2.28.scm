(define (deep-flattened-reverse l)
  (define (iter l items)
    (cond ((null? l) items)
          ((pair? (car l)) (iter (cdr l) (iter (car l) items)))
          (else (iter (cdr l) (cons items (car l))))))
  (iter l '()))

(define (fringe l)
  (cond ((null? l) l)
        ((pair? (car l)) (append (fringe (car l)) (fringe (cdr l))))
        (else (cons (car l) (fringe (cdr l))))))

;; A nicer solution is one that does not use append:

(define (fringe-iter T)
  (define (iter T R)
    (cond ((null? T) R)
          ((pair? T) (iter (car T) (iter (cdr T) R)))
          (else (cons T R))))
  (iter T '()))
