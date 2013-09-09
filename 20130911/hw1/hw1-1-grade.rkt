#lang racket

(require "common-grade.rkt")
(require "hw1-1.rkt")

(define (gcdGrade)
  (begin
    (printf "gcd\n")
    (output (equal? 3 (gcd 6 15)))
    (output (equal? 3 (gcd 3 0)))
    (output (equal? 3 (gcd 0 3)))))

(gcdGrade)
