#lang racket

(require racket/match)
(require "common-grade.rkt")
(require "hw5-1.rkt")
(require "hw5-2.rkt")

(define B black)
(define W white)

(define basic (glue W B B B))

(define (turn pattern i)
  (if (<= i 0) 
      pattern
      (turn (rotate pattern) (- i 1))))
(define compound1
  (glue
   basic
   (turn basic 1)
   (turn basic 2)
   (turn basic 3)))
(define compound2
  (glue
   basic
   basic
   (rotate basic)
   (rotate basic)))


(define basic2 (glue W B W B))
(define compound3 (glue basic2 basic2 basic2 basic2))

;;; beautiful test

(output (lambda () (equal? 0 (size B))))
(output (lambda () (equal? 0 (size W))))
(output (lambda () (equal? 1 (size basic))))
(output (lambda () (equal? 2 (size compound1))))
(output (lambda () (equal? #t (beautiful compound1))))
(output (lambda () (equal? #f (beautiful compound2))))
(output (lambda () (equal? #t (beautiful compound3))))
(output (lambda () (equal? #t (beautiful (glue
                                          compound1
                                          (turn compound1 1)
                                          (turn compound1 2)
                                          (turn compound1 3))))))
(output (lambda () (equal? #t (beautiful (glue
                                          compound2
                                          (turn compound2 1)
                                          (turn compound2 2)
                                          (turn compound2 3))))))
(output (lambda () (equal? #t (beautiful (glue
                                          compound3
                                          (turn compound3 1)
                                          (turn compound3 2)
                                          (turn compound3 3))))))
