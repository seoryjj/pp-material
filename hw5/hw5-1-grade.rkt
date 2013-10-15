#lang racket

(require racket/match)
(require "common-grade.rkt")
(require "hw5-1.rkt")

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


;;; pprint test

;;; ex1: the next command must print tiles as follows.
;
; BBWB
; WBBB
; BBBW
; BWBB
(pprint Compound1)

;;; ex2: the next command must print tiles as follows.
;
; BWWB
; BBBB
; BWWB
; BBBB
(pprint Compound2)


;;; neighbot test

(output (lambda () (equal? 2 (neighbor (list 0 0) Compound1))))
(output (lambda () (equal? 6 (neighbor (list 2 0) Compound1))))
(output (lambda () (equal? 2 (neighbor (list 3 3) Compound1))))
(output (lambda () (equal? 3 (neighbor (list 0 3) Compound2))))
(output (lambda () (equal? 4 (neighbor (list 1 3) Compound2))))
(output (lambda () (equal? 2 (neighbor (list 2 2) Compound2))))
