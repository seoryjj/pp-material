#lang racket

(require "hw1-1.rkt")
(require "hw1-2.rkt")
(require "hw1-3.rkt")
(require "hw1-4.rkt")
(require "hw1-5.rkt")
(require "hw1-6.rkt")
(require "hw1-7.rkt")

(define (output p)
  (printf (if (equal? p #t) "O\n" "X\n")))

(define (gcdGrade)
  (begin
    (printf "gcd\n")
    (output (equal? 3 (gcd 6 15)))
    (output (equal? 3 (gcd 3 0)))
    (output (equal? 3 (gcd 0 3)))))

(define (t2Grade)
	(begin
		(printf "t2\n")
		(output (equal? "0" (t2 0)))
		(output (equal? "001" (t2 1)))
		(output (equal? "001011" (t2 2)))
		(output (equal? "001011" (t2 -2)))))

(define (yanghuiGrade)
	(begin
		(printf "yanghui\n")
		(output (equal? "" (yanghui -1)))
		(output (equal? "" (yanghui 0)))
		(output (equal? "1" (yanghui 1)))
		(output (equal? "111" (yanghui 2)))
		(output (equal? "111121" (yanghui 3)))))

(define (zipperGrade)
	(begin
		(printf "zipperGrade\n")
		(output (equal? '(1 3 2 4) (zipper '(1 2) '(3 4))))
		(output (equal? '(1 2) (zipper '(1 2) '())))
		(output (equal? '(1 2) (zipper '() '(1 2))))))

(define (zipperNGrade)
	(begin
		(printf "zipperNGrade\n")
		(output (equal? '(1 3 5 2 4 6) (zipperN '((1 2) (3 4) (5 6)))))
		(output (equal? '(1 5 2 6) (zipperN '((1 2) () (5 6)))))
		(output (equal? '(1 5 2) (zipperN '((1 2) () (5)))))
		(output (equal? '(3 4) (zipperN '(() (3 4) ()))))))

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

(define (crazy2addGrade)
	(begin
		(printf "crazy2add\n")
		(output (equal? (+ (crazy2val cz) (crazy2val cp)) (crazy2val (crazy2add cz cp))))
		(output (equal? (+ (crazy2val cp) (crazy2val cn)) (crazy2val (crazy2add cp cn))))
		(output (equal? (+ (crazy2val cn) (crazy2val cpz)) (crazy2val (crazy2add cn cpz))))
		(output (equal? (+ (crazy2val cpz) (crazy2val cnp)) (crazy2val (crazy2add cpz cnp))))
		(output (equal? (+ (crazy2val cnp) (crazy2val czn)) (crazy2val (crazy2add cnp czn))))
		(output (equal? (+ (crazy2val czn) (crazy2val cz)) (crazy2val (crazy2add czn cz))))))

(define (ignore-raise f)
  (with-handlers ([(lambda (exn) #t) (lambda (exn) (printf "Error: execution failed.\n"))]) (f)))

(ignore-raise gcdGrade)
(ignore-raise t2Grade)
(ignore-raise yanghuiGrade)
(ignore-raise zipperGrade)
(ignore-raise zipperNGrade)
(ignore-raise crazy2valGrade)
(ignore-raise crazy2addGrade)
