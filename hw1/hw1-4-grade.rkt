#lang racket

(require "common-grade.rkt")
(require "hw1-4.rkt")

(define cz 'z)
(define cp 'p)
(define cn 'n)
(define cpz (cons 'p 'z))
(define cnp (cons 'n 'p))
(define czn (cons 'z 'n))

(define (crazy2valGrade)
	(begin
		(printf "crazy2val\n")
		(output (equal? 0 (crazy2val cz)))
		(output (equal? 1 (crazy2val cp)))
		(output (equal? -1 (crazy2val cn)))
		(output (equal? 1 (crazy2val cpz)))
		(output (equal? 1 (crazy2val cnp)))
		(output (equal? -2 (crazy2val czn)))))

(crazy2valGrade)
