(define (equal? x y)
  (or (eq? x y)
      (and (pair? x) (pair? y) (equal? (car x) (car y)) (equal? (cdr x) (cdr y)))))
