#lang racket

(require "common-grade.rkt")
(require "hw5-4.rkt")

(define (item-match? l r)
  (and (equal? (car l) (car r))
       (or
        (and (< (cdr l) 0.001) (< (cdr r) 0.001))
        (let ([ratio (/ (cdr l) (cdr r))])
         (and (< 0.99 ratio) (< ratio 1.01))))))

(define (list-match? pred l r)
  (cond [(equal? l '()) (equal? r '())]
        [(equal? r '()) #f]
        [else (and (pred (car l) (car r)) (list-match? pred (cdr l) (cdr r)))]))

(define (item-nonzero? sv)
  (>= (cdr sv) 0.001))

(define (symbol<? l r)
  (string<? (symbol->string l) (symbol->string r)))

(define (match? l r)
  (let* ([ll (filter item-nonzero? l)]
         [lll (sort ll (lambda (l r) (symbol<? (car l) (car r))))]
         [rr (filter item-nonzero? r)]
         [rrr (sort rr (lambda (l r) (symbol<? (car l) (car r))))])
    (list-match? item-match? lll rrr)))

(output
 (lambda ()
   (let* ([input '((A B 1.0) (B C 0.3) (B D 0.3) (B E 0.4) (C A 0.6) (C D 0.2) (C E 0.2) (D C 0.3) (D D 0.7) (E A 0.2) (E B 0.2) (E C 0.2) (E D 0.2) (E E 0.2))]
          [model-output '((A . 13.915094339663344) (B . 16.509433962312436) (C . 18.86792452835708) (D . 37.73584905671415) (E . 12.971698113245495))]
          [output (catchYou input 1000000)])
     (match? model-output output))))

(output
 (lambda ()
   (let* ([input '((A E 1.0) (B E 1.0) (C E 1.0) (D E 1.0) (E D 1.0))]
          [model-output '((A . 0.0) (B . 0.0) (C . 0.0) (D . 80.0) (E . 20.0))]
          [output (catchYou input 10000000)])
     (match? model-output output))))
