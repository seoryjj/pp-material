#lang racket

(define (fibonacci1 n)
  (cond ((= n 0) 0)
        ((= n 1) 1)
        (else (+ (fibonacci1 (- n 1)) (fibonacci1 (- n 2))))))

(define (fibonacci2 n)
  (raise "TODO"))
