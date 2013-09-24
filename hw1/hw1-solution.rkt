#lang racket

(provide gcd t2 yanghui crazy2val crazy2add)

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
	(cond ((equal? x 'z) 0)
				((equal? x 'p) 1)
				((equal? x 'n) -1)))

(define (crazy2val c)
	(cond ((pair? c)
				 (let ((hd (car c))
							 (tl (cdr c)))
					 (+ (* 2 (crazy2val tl)) (zpn hd))))
				(else (zpn c))))

(define (zpnadd a b c)
	(let ((sum (+ (zpn a) (zpn b) (zpn c))))
		(cond ((equal? sum 3) (cons 'p 'p))
					((equal? sum 2) (cons 'z 'p))
					((equal? sum 1) (cons 'p 'z))
					((equal? sum 0) (cons 'z 'z))
					((equal? sum -1) (cons 'n 'z))
					((equal? sum -2) (cons 'z 'n))
					((equal? sum -3) (cons 'n 'n)))))

(define (crazy2add-carry lhs rhs carry)
	(if (pair? lhs)
			(let ((lhd (car lhs))
						(ltl (cdr lhs)))
				(if (pair? rhs)
						(let* ((rhd (car rhs))
									(rtl (cdr rhs))
									(sum (zpnadd lhd rhd carry)))
							(cons (car sum) (crazy2add-carry ltl rtl (cdr sum))))
						(let ((sum (zpnadd lhd rhs carry)))
							(cons (car sum) (crazy2add-carry ltl 'z (cdr sum))))))
			(if (pair? rhs)
					(let* ((rhd (car rhs))
								(rtl (cdr rhs))
								(sum (zpnadd lhs rhd carry)))
						(cons (car sum) (crazy2add-carry 'z rtl (cdr sum))))
					(zpnadd lhs rhs carry))))

(define (crazy2add lhs rhs)
	(crazy2add-carry lhs rhs 'z))
