#lang racket

(require "hw3-3-library.rkt")
(require "hw3-3.rkt")
(require "common-grade.rkt")

(require racket/set)

(define (index-of l x)
  (if (equal? x 0) (car l)
      (index-of (cdr l) (- x 1))))

(define (move-location x y d)
  (cond [(equal? d 0) (cons x (- y 1))]
        [(equal? d 1)
         (if (odd? x)
             (cons (+ x 1) (- y 1))
             (cons (+ x 1) y))]
        [(equal? d 2)
         (if (odd? x)
             (cons (+ x 1) y)
             (cons (+ x 1) (+ y 1)))]
        [(equal? d 3) (cons x (+ y 1))]
        [(equal? d 4)
         (if (odd? x)
             (cons (- x 1) y)
             (cons (- x 1) (+ y 1)))]
        [(equal? d 5)
         (if (odd? x)
             (cons (- x 1) (- y 1))
             (cons (- x 1) y))]))

(define (range-to n)
  (let f ([i (- n 1)] [acc '()])
    (if (equal? i 0) (cons i acc)
        (f (- i 1) (cons i acc)))))

(define (check-maze-old maze)
  (define n (car (car maze)))
  (define m (cdr (car maze)))
  (define (valid-location x y)
    (and (<= 0 x) (< x n) (<= 0 y) (< y m)))
  (define lst (cdr maze))
  (define (lookup x y d)
    (let* ([col (index-of lst x)]
           [cell (index-of col y)])
      (index-of cell d)))
  (define tops (filter (lambda (x) (lookup x 0 0)) (range-to n)))
  (define bots (filter (lambda (x) (lookup x (- m 1) 3)) (range-to n)))
  (cond
   [(not (equal? (length tops) 1)) #f]
   [(not (equal? (length bots) 1)) #f]
   [else
    (begin
      (define top (car tops))
      (define bot (car bots))
      (define visit
        (let fixpt ([visit (set (cons top 0))]
                    [worklist (set (cons top 0))])
          (if
           (set-empty? worklist) visit
           (let*
               ([xy (set-first worklist)]
                [wl (set-rest worklist)]
                [x (car xy)]
                [y (cdr xy)]
                [vw
                 (foldl
                  (lambda (d vw)
                    (begin
                      (define v (car vw))
                      (define w (cdr vw))
                      (define nxy (move-location x y d))
                      (define nx (car nxy))
                      (define ny (cdr nxy))
                      (if (and
                           (valid-location nx ny)
                           (lookup x y d)
                           (not (set-member? v nxy)))
                          (cons (set-add v nxy) (set-add w nxy))
                          vw)))
                  (cons visit wl)
                  (range-to 6))])
             (fixpt (car vw) (cdr vw))))))
      (set-member? visit (cons bot (- m 1))))]))

(define (check-maze-new maze)
  (define n (car (car maze)))
  (define m (cdr (car maze)))
  (define (valid-location x y)
    (and (<= 0 x) (< x n) (<= 0 y) (< y m)))
  (define lst (cdr maze))
  (define (lookup x y d)
    (let* ([col (index-of lst x)]
           [cell (index-of col y)])
      (index-of cell d)))
  (define tops (filter
                (lambda (x)
                  (if (= (modulo x 2) 0)
                      (lookup x 0 0)
                      (or (lookup x 0 0) (lookup x 0 1) (lookup x 0 5))))
                (range-to n)))
  (define bots (filter
                (lambda (x)
                  (if (= (modulo x 2) 1)
                      (lookup x (- m 1) 3)
                      (or (lookup x (- m 1) 3) (lookup x (- m 1) 2) (lookup x (- m 1) 4))))
                (range-to n)))
  (cond
   [(not (equal? (length tops) 1)) #f]
   [(not (equal? (length bots) 1)) #f]
   [else
    (begin
      (define top (car tops))
      (define bot (car bots))
      (define visit
        (let fixpt ([visit (set (cons top 0))]
                    [worklist (set (cons top 0))])
          (if
           (set-empty? worklist) visit
           (let*
               ([xy (set-first worklist)]
                [wl (set-rest worklist)]
                [x (car xy)]
                [y (cdr xy)]
                [vw
                 (foldl
                  (lambda (d vw)
                    (begin
                      (define v (car vw))
                      (define w (cdr vw))
                      (define nxy (move-location x y d))
                      (define nx (car nxy))
                      (define ny (cdr nxy))
                      (if (and
                           (valid-location nx ny)
                           (lookup x y d)
                           (not (set-member? v nxy)))
                          (cons (set-add v nxy) (set-add w nxy))
                          vw)))
                  (cons visit wl)
                  (range-to 6))])
             (fixpt (car vw) (cdr vw))))))
      (set-member? visit (cons bot (- m 1))))]))

(define (check-maze maze)
  (or (check-maze-old maze) (check-maze-new maze)))

(output (lambda () (equal? #t (check-maze (mazeGen 3 3)))))
(output (lambda () (equal? #t (check-maze (mazeGen 5 5)))))
(output (lambda () (equal? #t (check-maze (mazeGen 7 7)))))
(output (lambda () (equal? #t (check-maze (mazeGen 9 9)))))
(output (lambda () (equal? #t (check-maze (mazeGen 10 10)))))
(output (lambda () (equal? #t (check-maze (mazeGen 11 11)))))
(output (lambda () (equal? #t (check-maze (mazeGen 12 12)))))
(output (lambda () (equal? #t (check-maze (mazeGen 13 13)))))
(output (lambda () (equal? #t (check-maze (mazeGen 14 14)))))
(output (lambda () (equal? #t (check-maze (mazeGen 15 15)))))
