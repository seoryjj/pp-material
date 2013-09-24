#lang racket

(require "common-grade.rkt")
(require "hw2-1.rkt")

(define (zipperGrade)
  (begin
    (printf "zipper\n")
		(output (lambda () (equal? (zipper '(1) '(2)) '(1 2))))
		(output (lambda () (equal? (zipper '(1 3 5) '(2 4)) '(1 2 3 4 5))))
		(output (lambda () (equal? (zipper '() '(1 2 3)) '(1 2 3))))
		(output (lambda () (equal? (zipper '(1 2 3) '()) '(1 2 3))))
		(output (lambda () (equal? (zipper '(1) '()) '(1))))
		(output (lambda () (equal? (zipper '() '(1)) '(1))))
		(output (lambda () (equal? (zipper '(1 2 3 4 5) '(6 7 8 9 10)) '(1 6 2 7 3 8 4 9 5 10))))
		(output (lambda () (equal? (zipper '(10 9 8 7 6) '(5 4 3)) '(10 5 9 4 8 3 7 6))))
		(output (lambda () (equal? (zipper '(10 9 8) '(7 6 5 4 3)) '(10 7 9 6 8 5 4 3))))
		(output (lambda () (equal? (zipper '() '()) '())))))

(zipperGrade)
