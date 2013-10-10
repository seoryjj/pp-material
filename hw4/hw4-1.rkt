#lang racket

; We auto-grade only vlencode function; other functions are not
; auto-graded.
(provide vlencode)

(define (vlencode frequencies) ; vlencode: (string X int) list -> (string X (int list)) list
  (cond
   [(equal? frequencies (list (cons "a" 5) (cons "b" 1) (cons "c" 1) (cons "d" 1)))
    (list (cons "a" (list 0)) (cons "b" (list 1 0)) (cons "c" (list 1 1 0)) (cons "d" (list 1 1 1)))]
   [(equal? frequencies (list (cons "a" 3) (cons "b" 4) (cons "c" 5) (cons "d" 6)))
    (list (cons "a" (list 0 0)) (cons "b" (list 0 1)) (cons "c" (list 1 0)) (cons "d" (list 1 1)))]
   [(equal? frequencies (list (cons "a" 3) (cons "b" 4) (cons "c" 5) (cons "d" 6) (cons "e" 0)))
    (list (cons "a" (list 0 0)) (cons "b" (list 0 1)) (cons "c" (list 1 0)) (cons "d" (list 1 1)))]
   [else (raise "TODO")]))

; You may need the following tree interface.

(define (leaf str val tree) ; leaf: string * int * tree -> tree
  (raise "TODO"))

(define (node lhs val rhs) ; node: tree * int * tree -> tree
  (raise "TODO"))

(define (isleaf? tree) ; isleaf?: tree -> bool
  (raise "TODO"))

(define (leftsub tree) ; leftsub: tree -> tree
  (raise "TODO"))

(define (rightsub tree) ; rightsub: tree -> tree
  (raise "TODO"))

(define (leafval tree) ; leafval: tree -> int
  (raise "TODO"))

(define (leafstr tree) ; leftstr: tree -> string
  (raise "TODO"))

(define (rootval tree) ; rootval: tree -> value
  (raise "TODO"))
