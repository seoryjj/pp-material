#lang racket

(provide gcd t2 yanghui crazy2val crazy2add)

(require racket/match)

(define (gcd n m)
	(if (equal? n 0) m
			(gcd (remainder m n) n)))

(define (t2 n)
	(let f ([m (abs n)])
		(if (equal? m 0) "0"
				(string-append (f (- m 1)) "0" (make-string m #\1)))))

(define (factorial n)
	(if (equal? 0 n) 1
			(* (factorial (- n 1)) n)))

(define (comb n m)
	(/ (factorial n) (* (factorial m) (factorial (- n m)))))

(define (yanghui n)
	(let f ([h (- n 1)] [w (- n 1)])
		(if (< h 0) ""
				(if (equal? w -1) (f (- h 1) (- h 1))
						(string-append (f h (- w 1)) (number->string (comb h w)))))))

(define (zpn x)
	(match x
				 ['z 0]
				 ['p 1]
				 ['n -1]))

(define (crazy2val c)
	(match c
				 ['z 0]
				 ['p 1]
				 ['n -1]
				 [(cons hd tl) (+ (* 2 (crazy2val tl)) (zpn hd))]))

(define (zpnadd a b c)
	(match (+ (zpn a) (zpn b) (zpn c))
				 [3 (cons 'p 'p)]
				 [2 (cons 'z 'p)]
				 [1 (cons 'p 'z)]
				 [0 (cons 'z 'z)]
				 [-1 (cons 'n 'z)]
				 [-2 (cons 'z 'n)]
				 [-3 (cons 'n 'n)]))

(define (crazy2add_carry lhs rhs carry)
	(match lhs
				 [(cons lhd ltl)
					(match rhs
								 [(cons rhd rtl)
									(match (zpnadd lhd rhd carry)
												 [(cons nd nc) (cons nd (crazy2add_carry ltl rtl nc))])]
								 [rc
									(match (zpnadd lhd rc carry)
												 [(cons nd nc) (cons nd (crazy2add_carry ltl 'z nc))])])]
				 [lc
					(match rhs
								 [(cons rhd rtl)
									(match (zpnadd lc rhd carry)
												 [(cons nd nc) (cons nd (crazy2add_carry 'z rtl nc))])]
								 [rc
									(zpnadd lc rc carry)])]))

(define (crazy2add lhs rhs)
	(crazy2add_carry lhs rhs 'z))
