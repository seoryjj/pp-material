#lang racket

; applicative programming

(define (sum_a n)
  (if (equal? n 0)
      0
      (+ n (sum_a (- n 1)))))

(sum_a 10)

; imperative programming

(define sum 0)

(define (sum_i n)
  (if (equal? n 0)
      sum
      (begin 
        (set! sum (+ n sum))
        (sum_i (- n 1)))))

(sum_i 10)

; with 'for'

(set! sum 0)

(define (sum_i_for n)
  (for ((i (+ n 1)))
       (set! sum (+ sum i)))
  sum)

(sum_i_for 10)
