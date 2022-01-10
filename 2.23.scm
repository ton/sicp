(define (for-each-1 proc items)
  (cond ((not (null? items))
         (proc (car items))
         (for-each-1 proc (cdr items)))))

(define (for-each-2 proc items)
  (if (null? items)
      #t
      (let ((n (proc (car items))))
        (for-each-2 proc (cdr items)))))

(define (for-each-3 proc items)
  (if (null? items)
      #t
      (let ()
        (proc (car items))
        (for-each-3 proc (cdr items)))))
