#lang racket

(require "common-grade.rkt")
(require "hw2-3.rkt")

(define (iterGrade)
  (begin
    (printf "iter\n")
		(output (lambda () (equal? ((iter 5 (lambda (x) (+ 2 x))) 0) 10)))
		(output (lambda () (equal? ((iter 5 (lambda (x) (+ 3 x))) 1) 16)))
		(output (lambda () (equal? ((iter 5 (lambda (x) (* 3 x))) 1) 243)))
		(output (lambda () (equal? ((iter 5 (lambda (x) (* 4 x))) 1) 1024)))
		(output (lambda () (equal? ((iter 5 (lambda (x) (- 1 x))) 1) 0)))
		(output (lambda () (equal? ((iter 10 (lambda (x) (+ 2 x))) 0) 20)))
		(output (lambda () (equal? ((iter 10 (lambda (x) (+ 3 x))) 1) 31)))
		(output (lambda () (equal? ((iter 10 (lambda (x) (* 3 x))) 1) (* 243 243))))
		(output (lambda () (equal? ((iter 10 (lambda (x) (* 4 x))) 1) (* 1024 1024))))
		(output (lambda () (equal? ((iter 10 (lambda (x) (- 1 x))) 1) 1)))))

(iterGrade)
