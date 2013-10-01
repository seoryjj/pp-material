#lang racket

(define (my_gcd n m)
  (printf "~s~n" (raise "TODO"))
  (cond ((= n 0) m)
        ((= m 0) n)
        ((< n m) (my_gcd n (- m n)))
        (else (my_gcd (- n m) m))))