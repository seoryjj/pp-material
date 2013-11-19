#lang racket

(require racket/match)
(require "common-grade.rkt")
(require "hw4-1.rkt")

(define (lookup key m)
  (match
   m
   ['() (raise "lookup failed")]
   [(cons (cons k v) rest)
    (if (equal? key k)
        v
        (lookup key rest))]))

(define (sum-list l)
  (define (sum-list-acc l acc)
    (match
     l
     ['() acc]
     [(cons x r) (sum-list-acc r (+ x acc))]))
  (sum-list-acc l 0))

(define (prefix? lhs rhs)
  (match
   lhs
   ['() #t]
   [(cons lhd ltl)
    (match
     rhs
     ['() #f]
     [(cons rhd rtl)
      (and (equal? lhd rhd) (prefix? ltl rtl))])]))

(define (forall? pred l)
  (match
   l
   ['() #t]
   [(cons hd tl) (and (pred hd) (forall? pred tl))]))

(define (prefix-list? str l)
  (forall? (lambda (x) (not (or (prefix? str x) (prefix? x str)))) l))

(define (prefixfree? l)
  (match
   l
   ['() #t]
   [(cons hd tl)
    (and (prefix-list? hd tl) (prefixfree? tl))]))

(define (wellformed? frequencies codes)
  (and
   (forall?
    (lambda (kf)
      (with-handlers
       ([(lambda (exn) #t) #f])
       (or
        (equal? (cdr kf) 0)
        (begin
          (lookup (car kf) codes)
          #t))))
    frequencies)
   (prefixfree? (map cdr codes))))

(define (compute-score frequencies codes)
  (sum-list
   (map
    (lambda (kc)
      (let* ([k (car kc)]
             [c (cdr kc)]
             [f (lookup k frequencies)])
        (* f (length c))))
    codes)))

(output
 (lambda ()
   (let* ([frequencies (list (cons "a" 5) (cons "b" 1) (cons "c" 1) (cons "d" 1))]
          [codes (vlencode frequencies)]
          [wf? (wellformed? frequencies codes)]
          [score (compute-score frequencies codes)])
     (and wf? (equal? 13 score)))))

(output
 (lambda ()
   (let* ([frequencies (list (cons "a" 3) (cons "b" 4) (cons "c" 5) (cons "d" 6))]
          [codes (vlencode frequencies)]
          [wf? (wellformed? frequencies codes)]
          [score (compute-score frequencies codes)])
     (and wf? (equal? 36 score)))))

(output
 (lambda ()
   (let* ([frequencies (list (cons "a" 3) (cons "b" 4) (cons "c" 5) (cons "d" 6) (cons "e" 0))]
          [codes (vlencode frequencies)]
          [wf? (wellformed? frequencies codes)]
          [score (compute-score frequencies codes)])
     (and wf? (equal? 36 score)))))

(output
 (lambda ()
   (let* ([frequencies (list (cons "e" 0))]
          [codes (vlencode frequencies)]
          [wf? (wellformed? frequencies codes)]
          [score (compute-score frequencies codes)])
     (and wf? (equal? 0 score)))))

(output
 (lambda ()
   (let* ([frequencies (list (cons "e" 10))]
          [codes (vlencode frequencies)]
          [wf? (wellformed? frequencies codes)]
          [score (compute-score frequencies codes)])
     (and wf? (equal? 10 score)))))

(output
 (lambda ()
   (let* ([frequencies (list (cons "a" 100) (cons "b" 100) (cons "c" 100) (cons "d" 100) (cons "e" 100) (cons "f" 100) (cons "g" 100))]
          [codes (vlencode frequencies)]
          [wf? (wellformed? frequencies codes)]
          [score (compute-score frequencies codes)])
     (and wf? (equal? 2000 score)))))

(output
 (lambda ()
   (let* ([frequencies (list (cons "a" 100) (cons "b" 200) (cons "c" 300) (cons "d" 400) (cons "e" 500) (cons "f" 600) (cons "g" 700))]
          [codes (vlencode frequencies)]
          [wf? (wellformed? frequencies codes)]
          [score (compute-score frequencies codes)])
     (and wf? (equal? 7400 score)))))

(output
 (lambda ()
   (let* ([frequencies (list (cons "a" 700) (cons "b" 600) (cons "c" 500) (cons "d" 400) (cons "e" 300) (cons "f" 200) (cons "g" 100))]
          [codes (vlencode frequencies)]
          [wf? (wellformed? frequencies codes)]
          [score (compute-score frequencies codes)])
     (and wf? (equal? 7400 score)))))

(output
 (lambda ()
   (let* ([frequencies (list (cons "a" 13) (cons "b" 24) (cons "c" 95) (cons "d" 32) (cons "e" 23) (cons "f" 59) (cons "g" 31))]
          [codes (vlencode frequencies)]
          [wf? (wellformed? frequencies codes)]
          [score (compute-score frequencies codes)])
     (and wf? (equal? 713 score)))))

(output
 (lambda ()
   (let* ([frequencies (list (cons "a" 73) (cons "b" 56) (cons "c" 18) (cons "d" 39) (cons "e" 84) (cons "f" 58) (cons "g" 91))]
          [codes (vlencode frequencies)]
          [wf? (wellformed? frequencies codes)]
          [score (compute-score frequencies codes)])
     (and wf? (equal? 1139 score)))))
