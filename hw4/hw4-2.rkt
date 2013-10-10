#lang racket

; We auto-grade only react function; other functions are not
; auto-graded. However, S, K, I, v, and a are required for
; grading. See hw4-2-grade.rkt for more information.
(provide react S K I v a)


(define (react solution) ; react: solution -> string
  (raise "TODO"))

(define S ; S: solution
  (raise "TODO"))
(define K ; K: solution
  (raise "TODO"))
(define I ; I: solution
  (raise "TODO"))
(define (v str) ; v: string -> solution
  (raise "TODO"))
(define (a lhs rhs) ; v: solution * solution -> solution
  (raise "TODO"))


; You may need the following tree interface.

(define (isS?) ; isS?: solution -> bool
  (raise "TODO"))
(define (isK?) ; isK?: solution -> bool
  (raise "TODO"))
(define (isI?) ; isI?: solution -> bool
  (raise "TODO"))
(define (isv?) ; isv?: solution -> bool
  (raise "TODO"))
(define (isa?) ; isa?: solution -> bool
  (raise "TODO"))
(define (var solution) ; var: solution -> string
  (raise "TODO"))
(define (al solution) ; al: solution -> solution
  (raise "TODO"))
(define (ar solution) ; ar: solution -> solution
  (raise "TODO"))
(define (pprint solution) ; pprint: solution -> string
  (raise "TODO"))
