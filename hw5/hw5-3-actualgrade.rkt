#lang racket

(require "common-grade.rkt")
(require "hw5-3.rkt")


;;; Rule table

(define table1 empty-ruletable)
(define table2 (add-rule (make-rule "empty" "a" "-" 'right "carrying") table1))
(define table3 (add-rule (make-rule "carrying" "a" "a" 'right "carrying") table2))
(define table4 (add-rule (make-rule "carrying" "b" "b" 'right "carrying") table3))
(define table5 (add-rule (make-rule "carrying" "-" "b" 'left "backing") table4))
(define table6 (add-rule (make-rule "backing" "a" "a" 'left "backing") table5))
(define table7 (add-rule (make-rule "backing" "b" "b" 'left "backing") table6))
(define table8 (add-rule (make-rule "backing" "-" "-" 'right "empty") table7))

;;; Turaing machine

(define (steps-tm n tm)
  (if (zero? n) tm
      (steps-tm (- n 1) (step-tm tm))))

(define tm1 (make-tm (list "a" "a" "a" "a" "a" "a" "a" "a") "empty" table8))
(define tm2 (steps-tm 8 tm1))
(define tm3 (steps-tm 9 tm2))
(define tm4 (steps-tm 8 tm3))
(define tm5 (steps-tm 9 tm4))
(define tm6 (steps-tm 8 tm5))
(define tm7 (steps-tm 9 tm6))
(define tm8 (steps-tm 8 tm7))
(define tm9 (steps-tm 9 tm8))
(define tm10 (run-tm tm9))

(output (lambda () (equal? "-.-.-.a.a.a.a" (print-tm tm1 3))))
(output (lambda () (equal? "a.a.a.-.-.-.-" (print-tm tm2 3))))
(output (lambda () (equal? "-.-.-.a.a.a.a" (print-tm tm3 3))))
(output (lambda () (equal? "a.a.b.-.-.-.-" (print-tm tm4 3))))
(output (lambda () (equal? "-.-.-.a.a.a.a" (print-tm tm5 3))))
(output (lambda () (equal? "a.b.b.-.-.-.-" (print-tm tm6 3))))
(output (lambda () (equal? "-.-.-.a.a.a.a" (print-tm tm7 3))))
(output (lambda () (equal? "b.b.b.-.-.-.-" (print-tm tm8 3))))
(output (lambda () (equal? "-.-.-.a.a.a.a" (print-tm tm9 3))))
(output (lambda () (equal? "-.-.-.b.b.b.b" (print-tm tm10 3))))
