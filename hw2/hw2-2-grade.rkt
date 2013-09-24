#lang racket

(require "common-grade.rkt")
(require "hw2-2.rkt")

(define (zipperNGrade)
  (begin
    (printf "zipperN\n")
    (output (lambda () (equal? (zipperN '((1) (2) (3))) '(1 2 3))))
    (output (lambda () (equal? (zipperN '((1) () (3))) '(1 3))))
    (output (lambda () (equal? (zipperN '((1) (2 4 5 6) (3))) '(1 2 3 4 5 6))))
    (output (lambda () (equal? (zipperN '(() () ())) '())))
    (output (lambda () (equal? (zipperN '(() () () () () () ())) '())))
    (output (lambda () (equal? (zipperN '((1 2 3) (4 5 6) (7 8 9) (10 11 12))) '(1 4 7 10 2 5 8 11 3 6 9 12))))
    (output (lambda () (equal? (zipperN '((1) (2 3) (4 5 6) (7 8 9 10))) '(1 2 4 7 3 5 8 6 9 10))))
    (output (lambda () (equal? (zipperN '((1 2 3 4) (5 6) (7 8 9) (10))) '(1 5 7 10 2 6 8 3 9 4))))

    (output (lambda () (equal? (zipperN '((1 2 3 4) (5 6 7) (8 9) (10))) '(1 5 8 10 2 6 9 3 7 4))))
    (output (lambda () (equal? (zipperN '(() () () (1 2 3 4) ())) '(1 2 3 4))))))

(zipperNGrade)
