#lang racket

(provide empty-record add-record find-record)

(define (empty-record) '()) ; empty-record: record

(define (add-record k v d) (cons (cons k v) d)) ; add-record: string -> any -> record -> record

(define (find-record key dic) ; find-record: string -> record -> record
	(if (pair? dic)
			(let* ((kv (car dic)) ; kv: string * any
						 (k (car kv)) ; k: string
						 (v (cdr kv))) ; v: any
				(if (equal? key k) v
						(find-record key (cdr dic))))
			(raise "no such key")))
