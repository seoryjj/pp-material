#lang racket

(define (my-gcd n m)
  (printf "~s~n" (raise "TODO"))
  (cond ((= n 0) m)
        ((= m 0) n)
        ((< n m) (my-gcd n (- m n)))
        (else (my-gcd (- n m) m))))