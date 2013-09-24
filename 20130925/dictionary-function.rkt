#lang racket

(provide empty-dic add-dic find-dic)

(define (empty-dic) ; empty-dic: dictionary
	(lambda (x) (raise "no such key")))

(define (add-dic k v d) ; add-dic: string -> any -> dictionary -> dictionary
	(raise "TODO"))

(define (find-dic key dic) ; find-dic: string -> dictionary -> dictionary
	(raise "TODO"))
