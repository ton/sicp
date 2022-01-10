; Tpq transforms the pair (a, b) according to:
;
;  a <- bq + aq + ap
;  b <- bp + aq
;
; Applying Tpq twice yields:
;
;  a <- (bp + aq)q + (bq + aq + ap)q + (bq + aq + ap)p
;    <- bpq + aq^2 + bq^2 + aq^2 + apq + bpq + apq + ap^2
;    <- 2aq^2 + ap^2 + bq^2 + 2bpq + 2apq
;    <- b(2pq + q^2) + a(2q^2 + p^2 + 2pq)
;    <- b(2pq + q^2) + a(2pq + q^2) + a(p^2 + q^2)
;    <- bq' + aq' + ap'
;
; with: q' = 2pq + q^2
;       p' = p^2 + q^2
;
;  b <- (bp + aq)p + (bq + aq + ap)q
;    <- bp^2 + apq + bq^2 + aq^2 + apq
;    <- bp^2 + bq^2 + aq^2 + 2apq
;    <- b(p^2 + q^2) + a(q^2 + 2pq)
;    <- bp' + aq'
;
; Much more elegant solution is by using linear algebra, see:
; http://community.schemewiki.org/?sicp-ex-1.19

(define (fib n)
  (define (iter a b n)
    (if (= 0 n) b
        (iter (+ a b) a (- n 1))))
  (iter 1 0 n))

(define (fib-log n)
  (define (iter a b p q n)
    (cond ((= n 0) b)
          ((even? n) (iter a
                           b
                           (+ (square p) (square q))
                           (+ (* 2 p q) (square q))
                           (/ n 2)))
          (else (iter (+ (* b q) (* a q) (* a p))
                      (+ (* b p) (* a q))
                      p
                      q
                      (- n 1)))))
  (iter 1 0 0 1 n))
