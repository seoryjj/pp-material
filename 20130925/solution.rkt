#lang racket

(define (iseven n) (= (modulo n 2) 0)) ; iseven: int -> bool
(define (even-list items) ; even-list: int list -> bool list
  (if (null? items)
    '()
    (cons (iseven (car items)) (even-list (cdr items)))))

(even-list '(1 2 3 4 5))

;;

(define (my-map f l)
  (if (null? l)
      '()
      (cons (f (car l)) (my-map f (cdr l)))))

(my-map abs '(-1 -2 -3 4))

;;

(define (fold lst f c) ; fold: a list -> (a -> b -> b) -> b -> b
  (if (null? lst) c
      (f (car lst) (fold (cdr lst) f c))))

(define (has-even l)
  (fold
   (my-map iseven l)
   (lambda (x y) (or x y))
   false))

(has-even '(1 2 3 5))
(has-even '(-1 1 3))

;;

(define (empty-record) ; empty-record: record
  (lambda (x) (raise "no such key")))

(define (add-record k v d) ; add-record: string -> any -> record -> record
  (lambda (x)
    (if (equal? x k)
        v
        (d x))))

(define (find-record key dic) ; find-record: string -> record -> record
  (dic key))
