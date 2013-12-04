#lang racket

(require "common-grade.rkt")
(require "hw6-8-library.rkt")
(require "hw6-8.rkt")

(define (sort-shoppinglist lst)
  (sort (map (lambda (p) (cons (car p) (sort (cdr p) <))) lst)
        (lambda (x y) (string<? (symbol->string (car x)) (symbol->string (car y))))))

(define condA
  (mustAnd (mustItems '(1 2))
           (mustHaveCommon (mustBeTheSame 'B)
                           (mustBeTheSame 'C))))

(define condB
  (mustHaveCommon (mustBeTheSame 'C)
                  (mustItems '(2 3))))

(define condC
  (mustAnd (mustItems '(1))
           (mustHaveExceptFor (mustBeTheSame 'A)
                              '(3))))

(output
 (lambda ()
   (equal? (sort-shoppinglist (shoppingList (list (cons 'A condA) (cons 'B condB) (cons 'C condC))))
           '((A . (1 2)) (B . (2)) (C . (1 2))))))

(output
 (lambda ()
   (equal? (sort-shoppinglist (shoppingList (list (cons 'A (mustBeTheSame 'B)) (cons 'B (mustBeTheSame 'A)))))
   '((A) (B)))))

(output
 (lambda ()
   (equal? (sort-shoppinglist (shoppingList (list (cons 'A (mustAnd (mustItems '()) (mustBeTheSame 'B)))(cons 'B (mustAnd (mustItems '()) (mustBeTheSame 'C)))(cons 'C (mustAnd (mustItems '()) (mustBeTheSame 'A))))))
           (list (cons 'A '()) (cons 'B '()) (cons 'C '())))))

(output
 (lambda ()
   (equal? (sort-shoppinglist (shoppingList (list (cons 'A (mustAnd (mustAnd (mustItems '()) (mustItems '(1 2 ))) (mustHaveCommon (mustBeTheSame 'B) (mustBeTheSame 'C))))(cons 'B (mustAnd (mustItems '()) (mustHaveCommon (mustBeTheSame 'C) (mustItems '(2 3 )))))(cons 'C (mustAnd (mustAnd (mustItems '()) (mustItems '(1 ))) (mustHaveExceptFor (mustBeTheSame 'A) '(3 )))))))
           (list (cons 'A '(1 2 )) (cons 'B '(2 )) (cons 'C '(1 2 ))))))

(output
 (lambda ()
   (equal? (sort-shoppinglist (shoppingList (list (cons 'A (mustAnd (mustAnd (mustItems '()) (mustItems '(1 ))) (mustBeTheSame 'B)))(cons 'B (mustAnd (mustItems '()) (mustBeTheSame 'C)))(cons 'C (mustAnd (mustItems '()) (mustBeTheSame 'B))))))
           (list (cons 'A '(1 )) (cons 'B '()) (cons 'C '())))))
