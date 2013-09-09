#lang racket

(require "common-grade.rkt")
(require "hw1-2.rkt")

(define (t2Grade)
	(begin
		(printf "t2\n")
		(output (equal? "0" (t2 0)))
		(output (equal? "001" (t2 1)))
		(output (equal? "001011" (t2 2)))
		(output (equal? "001011" (t2 -2)))))

(t2Grade)
