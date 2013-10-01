#lang racket

(define (fibonacci2 n)
  (define (fibonacci-aux n a b m)
    (if (= n m) 
        a
        (raise "TODO")))
  (fibonacci-aux n 0 1 0))
