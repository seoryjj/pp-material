#lang racket

(provide empty-record add-record find-record)

(define (empty-record) ; empty-record: record
	(lambda (x) (raise "no such key")))

(define (add-record k v d) ; add-record: string -> any -> record -> record
	(raise "TODO"))

(define (find-record key dic) ; find-record: string -> record -> record
	(raise "TODO"))
