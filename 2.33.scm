(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define nil '())

(define (map-p p sequence)
  (accumulate (lambda (x y) (cons (p x) y)) nil sequence))

(define (append-acc seq1 seq2)
  (accumulate cons seq2 seq1))

(define (length-acc sequence)
  (accumulate (lambda (x y) (+ y 1)) 0 sequence))
