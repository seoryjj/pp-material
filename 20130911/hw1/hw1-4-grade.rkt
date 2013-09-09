#lang racket

(require "common-grade.rkt")
(require "hw1-4.rkt")

(define (zipperGrade)
	(begin
		(printf "zipperGrade\n")
		(output (equal? '(1 3 2 4) (zipper '(1 2) '(3 4))))
		(output (equal? '(1 2) (zipper '(1 2) '())))
		(output (equal? '(1 2) (zipper '() '(1 2))))))

(zipperGrade)
