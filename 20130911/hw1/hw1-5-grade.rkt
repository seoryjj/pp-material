#lang racket

(require "common-grade.rkt")
(require "hw1-5.rkt")

(define (zipperNGrade)
	(begin
		(printf "zipperNGrade\n")
		(output (equal? '(1 3 5 2 4 6) (zipperN '((1 2) (3 4) (5 6)))))
		(output (equal? '(1 5 2 6) (zipperN '((1 2) () (5 6)))))
		(output (equal? '(1 5 2) (zipperN '((1 2) () (5)))))
		(output (equal? '(3 4) (zipperN '(() (3 4) ()))))))

(zipperNGrade)
