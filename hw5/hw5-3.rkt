#lang racket


; If these statements are omitted, your submission will be graded 0.
(provide init-tape read-tape write-tape move-tape-left move-tape-right print-tape)
(provide empty-ruletable add-rule make-rule match-rule)
(provide make-tm step-tm run-tm print-tm)


;;; Tapes

(define (init-tape syms) ; init-tape: symbol list -> tape
  (raise "TODO"))

(define (read-tape tape) ; read-tape: tape -> symbol
  (raise "TODO"))

(define (write-tape tape sym) ; write-tape: tape ∗* symbol →-> tape
  (raise "TODO"))

(define (move-tape-left tape) ; move-tape-left: tape →-> tape
  (raise "TODO"))

(define (move-tape-right tape) ; move-tape-right: tape →-> tape
  (raise "TODO"))

; Implement "tape -> string" instead of "tap -> void".
(define (print-tape tape) ; print-tape: tape →-> string
  (raise "TODO"))


;;; Rule tables

(define empty-ruletable ; empty-ruletable: ruletable
  (raise "TODO"))

(define (add-rule rule table) ; add-rule: rule * ruletable -> ruletable
  (raise "TODO"))

(define (make-rule curstate cursym newsym move newstate) ; make-rule: state * symbol * symbol * move * state -> rule
  (raise "TODO"))

(define (match-rule curstate cursym table) ; match-rule: state * symbol * ruletable -> symbol X move X state
  (raise "TODO"))


;;; Turing machines

(define (make-tm syms state ruletable) ; make-tm: symbol list * state * ruletable -> tm
  (raise "TODO"))

(define (step-tm tm) ; step-tm: tm -> tm
  (raise "TODO"))

(define (run-tm tm) ; run-tm: tm -> tm
  (raise "TODO"))

; Implement "tm * int -> string" instead of "tm * int -> void".
(define (print-tm tm size) ; print-tm: tm * int -> string
  (raise "TODO"))
