(define (last-pair l)
  (define (last-pair-non-empty x)
      (let ((rest (cdr x)))
        (if (null? rest)
            x
            (last-pair-non-empty rest))))
  (if (null? l)
      l
      (last-pair-non-empty l)))

; (define (reverse l)
;   (define (iter l items)
;     (if (null? l)
;         items
;         (iter (cdr l) (cons (car l) items))))
;   (iter l '()))

(define (reverse l)
  (if (null? l)
      l
      (append (reverse (cdr l)) (cons (car l) '()))))
