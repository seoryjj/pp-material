#lang racket

(require racket/match)
(require "common-grade.rkt")
(require "hw5-1.rkt")
(require "hw5-2.rkt")

(define B black)
(define W white)
(define Basic (glue B B B W))
(define (turn pattern i)
  (if (<= i 0) 
      pattern
      (turn (rotate pattern) (- i 1))))
(define Compound1
  (glue Basic (turn Basic 1) (turn Basic 2) (turn Basic 3)))
(define Compound2
  (rotate (glue Basic Basic (rotate Basic) (rotate Basic))))
(define Compound3
  (glue Compound1 Compound2 (turn Compound1 2) (turn Compound2 2)))


;;; beautiful test

(output (lambda () (equal? #t (beautiful Compound1))))
(output (lambda () (equal? #f (beautiful Compound2))))
(output (lambda () (equal? #t (beautiful Compound3))))
