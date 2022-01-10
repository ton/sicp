;; See SICP solutions wiki; those do not bother with the type checks...

(define (make-mobile left right)
  (cons left right))

(define (make-branch length struture)
  (cons length struture))

(define (mobile? m)
  (and (pair? m) (branch? (car m))))

(define (branch? b)
  (and (pair? b) (not (pair? (car b)))))

(define (left-branch m)
  (cond ((not (mobile? m)) '())
        (else (car m))))

(define (right-branch m)
  (cond ((not (mobile? m)) '())
        (else (cdr m))))

(define (branch-length b)
  (cond ((not (branch? b)) 0)
        (else (car b))))

(define (branch-structure b)
  (cond ((not (branch? b)) '())
        (else (cdr b))))

(define (total-weight x)
  (cond ((mobile? x) (+ (total-weight (left-branch x))
                        (total-weight (right-branch x))))
        ((branch? x) (total-weight (branch-structure x)))
        (else x)))

(define (total-length x)
  (cond ((mobile? x) (+ (total-length (left-branch x))
                        (total-length (right-branch x))))
        ((branch? x) (+ (branch-length x) (total-length (branch-structure x))))
        (else 0)))

(define (torque x)
  (cond ((mobile? x) (+ (torque (left-branch x))
                        (torque (right-branch x))))
        ((branch? x) (* (branch-length x)
                        (total-weight x)))
        (else 0)))

(define (balanced? x)
  (cond ((mobile? x)
         (and (balanced? (left-branch x))
              (balanced? (right-branch x))
              (= (torque (left-branch x))
                 (torque (right-branch x)))))
        ((branch? x) (balanced? (branch-structure x)))
        (else #t)))
