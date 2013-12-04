#lang racket

(require racket/match)
(require "common-grade.rkt")
(require "hw6-1.rkt")

(output (lambda () (equal? 15 (memo-ways 2 4))))
(output (lambda () (equal? 184756 (memo-ways 10 10))))
(output (lambda () (equal? 30045015 (memo-ways 10 20))))
(output (lambda () (equal? 137846528820 (memo-ways 20 20))))
(output (lambda () (equal? 47129212243960 (memo-ways 30 20))))
(output (lambda () (equal? 118264581564861424 (memo-ways 30 30))))
(output (lambda () (equal? 55347740058143507128 (memo-ways 30 40))))
(output (lambda () (equal? 107507208733336176461620 (memo-ways 40 40))))
(output (lambda () (equal? 59870908646972742699313758 (memo-ways 50 40))))
(output (lambda () (equal? 100891344545564193334812497256 (memo-ways 50 50))))
