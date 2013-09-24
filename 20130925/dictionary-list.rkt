#lang racket

(provide empty-dic add-dic find-dic)

(define (empty-dic) '()) ; empty-dic: dictionary

(define (add-dic k v d) (cons (cons k v) d)) ; add-dic: string -> any -> dictionary -> dictionary

(define (find-dic key dic) ; find-dic: string -> dictionary -> dictionary
	(if (pair? dic)
			(let* ((kv (car dic)) ; kv: string * any
						 (k (car kv)) ; k: string
						 (v (cdr kv))) ; v: any
				(if (equal? key k) v
						(find-dic key (cdr dic))))
			(raise "no such key")))
