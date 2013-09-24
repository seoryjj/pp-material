#lang racket

(provide zipper zipperN iter)

(define (zipper lhs rhs)
	(match lhs
				 ['() rhs]
				 [(list lhd ltl ...)
					(match rhs
								 ['() lhs]
								 [(list rhd rtl ...)
									(append (list lhd rhd) (zipper ltl rtl))])]))

(define (zipperN lists)
	(match lists
				 ['() '()]
				 [(list lhd ltl ...)
					(match lhd
								 ['() (zipperN ltl)]
								 [(list llhd lltl ...)
									(cons llhd (zipperN (append ltl (list lltl))))])]))

(define (iter n f)
	(let ((m (abs n)))
		(if (equal? m 0)
				(lambda (x) x)
				(lambda (x) ((iter (- m 1) f) (f x))))))
