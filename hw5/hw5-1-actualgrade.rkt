#lang racket

(require racket/match)
(require "common-grade.rkt")
(require "hw5-1.rkt")

(define B black)
(define W white)

(output (lambda () (equal? '(array (W B) (B B))
                           (glue-array-from-tree W B B B))))
(output (lambda () (equal? '(tree W B B B)
                           (glue-tree-from-array W B B B))))

(define basic-array (glue-array-from-array W B B B))
(define basic-tree (glue-tree-from-tree W B B B))

(define (turn-array pattern i)
  (if (<= i 0) 
      pattern
      (turn-array (rotate-array pattern) (- i 1))))
(define (turn-tree pattern i)
  (if (<= i 0) 
      pattern
      (turn-tree (rotate-tree pattern) (- i 1))))
(define compound1-array
  (glue-array-from-array
   basic-array
   (turn-array basic-array 1)
   (turn-array basic-array 2)
   (turn-array basic-array 3)))
(define compound2-array
  (glue-array-from-array
   basic-array
   basic-array
   (rotate-array basic-array)
   (rotate-array basic-array)))
(output (lambda () (equal? '(array (W B B W) (B B B B) (B B B B) (W B B W))
                           compound1-array)))
(output (lambda () (equal? '(array (W B W B) (B B B B) (B W B W) (B B B B))
                           compound2-array)))
(define compound1-tree
  (glue-tree-from-tree
   basic-tree
   (turn-tree basic-tree 1)
   (turn-tree basic-tree 2)
   (turn-tree basic-tree 3)))
(define compound2-tree
  (glue-tree-from-tree
   basic-tree
   basic-tree
   (rotate-tree basic-tree)
   (rotate-tree basic-tree)))
(output (lambda () (equal? '(tree (W B B B) (B W B B) (B B W B) (B B B W))
                           compound1-tree)))
(output (lambda () (equal? '(tree (W B B B) (W B B B) (B W B B) (B W B B))
                           compound2-tree)))

(output (lambda () (equal? "WBBW\nBBBB\nBBBB\nWBBW\n"
                               (pprint compound1-array))))

(output (lambda () (equal? 3 (neighbor-array (list 0 0) compound1-tree))))
(output (lambda () (equal? 4 (neighbor-array (list 0 1) compound1-array))))
(output (lambda () (equal? 7 (neighbor-array (list 0 2) compound1-array))))
