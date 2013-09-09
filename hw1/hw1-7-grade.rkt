#lang racket

(require "common-grade.rkt")
(require "hw1-6.rkt")
(require "hw1-7.rkt")

(define cz 'z)
(define cp 'p)
(define cn 'n)
(define cpz (cons 'p 'z))
(define cnp (cons 'n 'p))
(define czn (cons 'z 'n))

(define (crazy2addGrade)
	(begin
		(printf "crazy2add\n")
		(output (equal? (+ (crazy2val cz) (crazy2val cp)) (crazy2val (crazy2add cz cp))))
		(output (equal? (+ (crazy2val cp) (crazy2val cn)) (crazy2val (crazy2add cp cn))))
		(output (equal? (+ (crazy2val cn) (crazy2val cpz)) (crazy2val (crazy2add cn cpz))))
		(output (equal? (+ (crazy2val cpz) (crazy2val cnp)) (crazy2val (crazy2add cpz cnp))))
		(output (equal? (+ (crazy2val cnp) (crazy2val czn)) (crazy2val (crazy2add cnp czn))))
		(output (equal? (+ (crazy2val czn) (crazy2val cz)) (crazy2val (crazy2add czn cz))))))

(crazy2addGrade)
