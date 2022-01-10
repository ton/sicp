(define (pow a b)
  (if (= b 1)
      a
      (* a (pow a (-1+ b)))))

(define (even? n)
  (= (remainder n 2) 0))

(define (cons x y)
  (* (pow 2 x) (pow 3 y)))

(define (car z)
  (define (iter n i)
    (if (= (remainder n 2) 0)
        (iter (/ n 2) (+ i 1))
        i))
  (iter z 0))

(define (cdr z)
  (define (iter n i)
    (if (= (remainder n 3) 0)
        (iter (/ n 3) (+ i 1))
        i))
  (iter z 0))
