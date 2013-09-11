#lang racket

(require "common-grade.rkt")
(require "hw1-3.rkt")

(define (yanghuiGrade)
	(begin
		(printf "yanghui\n")
		(output (equal? "111" (yanghui -2)))
		(output (equal? "1" (yanghui -1)))
		(output (equal? "" (yanghui 0)))
		(output (equal? "1" (yanghui 1)))
		(output (equal? "111" (yanghui 2)))
		(output (equal? "111121" (yanghui 3)))))

(yanghuiGrade)
