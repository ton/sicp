(load "sicp.scm")

(define (list-ref items n)
  (if (= n 0)
      (car items)
      (list-ref (cdr items) (- n 1))))

(define (queens board-size)

  (define empty-board '())

  (define (row-occupied? row positions)
    (accumulate (lambda (x occupied?) (or occupied? (= row x))) #f positions))

  (define (diagonal-up-occupied? row positions)
    (and (not (null? positions))
         (> row 0)
         (or (= row (car positions)) (diagonal-up-occupied? (- row 1) (cdr positions)))))

  (define (diagonal-down-occupied? row positions)
    (and (not (null? positions))
         (<= row board-size)
         (or (= row (car positions)) (diagonal-down-occupied? (+ row 1) (cdr positions)))))

  (define (safe? k positions)
    (let ((row (car positions)))
      (and (not (row-occupied? row (cdr positions)))
           (not (diagonal-up-occupied? (- row 1) (cdr positions)))
           (not (diagonal-down-occupied? (+ row 1) (cdr positions))))))

  (define (adjoin-position row positions)
    (cons row positions))

  (define (queen-cols k)
    (if (= k 0)
        (list empty-board)
        (filter
          (lambda (positions) (safe? k positions))
          (flatmap
            (lambda (rest-of-queens)
              (map (lambda (new-row)
                     (adjoin-position new-row rest-of-queens))
                   (enumerate-interval 1 board-size)))
            (queen-cols (- k 1))))))

  (queen-cols board-size))
