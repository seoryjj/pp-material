#lang racket

(require "hw3-2-library.rkt")
(require "submission.rkt")
(require "common-grade.rkt")

(define maze1
  (cons 4
        '((1 4) (0 5) (3 6) (2 7)
          (0 5 8) (1 4) (2) (3)
          (4 12) (10 13) (9 11 14) (10)
          (8 13) (9 12) (10 15) (14))))

(define room1 0)
(define room2 15)
(define room3 7)

(define cases
  (list
   (list 7 0 #f)
   (list 9 10 #t)

   (list 7 2 #t)
   (list 7 9 #f)

   (list 7 4 #f)
   (list 9 11 #t)

   (list 7 6 #t)
   (list 7 15 #f)

   (list 7 8 #f)
   (list 7 7 #t)

   (list 7 10 #f)
   (list 9 12 #t)

   (list 7 12 #f)
   (list 9 13 #t)

   (list 7 14 #f)
   (list 7 3 #t)

   (list 8 0 #t)
   (list 8 3 #f)

   (list 8 2 #f)
   (list 8 1 #t)))


(define (iter lst f)
  (cond
   [(empty? lst) '()]
   [else
    (begin
      (f (car lst))
      (iter (cdr lst) f))]))

(iter (build-list 10 values)
      (lambda (x)
        (let* ([c1 (list-ref cases (+ x x))]
               [c2 (list-ref cases (+ x x 1))])
          (output
           (lambda ()
             (and (equal? (list-ref c1 2) (maze-check maze1 (list-ref c1 0) (list-ref c1 1)))
                  (equal? (list-ref c2 2) (maze-check maze1 (list-ref c2 0) (list-ref c2 1)))))))))
