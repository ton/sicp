(define (reverse l)
  (define (iter l items)
    (if (null? l)
        items
        (iter (cdr l) (cons (car l) items))))
  (iter l '()))

(define (deep-flattened-reverse l)
  (define (iter l items)
    (cond ((null? l) items)
          ((pair? (car l)) (iter (cdr l) (iter (car l) items)))
          (else (iter (cdr l) (cons (car l) items)))))
  (iter l '()))

(define (deep-reverse l)
  (define (iter l items)
    (cond ((null? l) items)
          ((pair? (car l)) (iter (cdr l) (cons (iter (car l) '()) items)))
          (else (iter (cdr l) (cons (car l) items)))))
  (iter l '()))
