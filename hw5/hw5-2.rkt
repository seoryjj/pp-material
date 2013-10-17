#lang racket


;;; CAUTION: read VERY CAREFULLY hw5-2-grade.rkt before doing your HW.
;;; Instructions how to write submission (and grade it) is written in
;;; hw5-2-grade.rkt.

;;; If these statements are omitted, your submission will be graded 0.

(provide equal)
(provide size)
(provide beautiful)


; You can use the definitions and functions defined in hw5-1.rkt:
; black, white, glue-array-from-tree, glue-array-from-array,
; rotate-array, neighbor-array, pprint-array, is-array?,
; glue-tree-from-tree, glue-tree-from-array, rotate-tree,
; neighbor-tree, pprint-tree, is-tree?, array-to-tree, tree-to-array,
; glue, rotate, neighbor, pprint
(require "hw5-1.rkt")


;;; interfaces
(define (equal f g) ; equal: form * form -> form
  'TODO)

(define (size f) ; size: form -> int
  'TODO)

(define (beautiful f) ; beautiful: form -> bool
  (define (beautiful-sym f)
    'TODO)
  (define (beautiful-neighbor f)
    'TODO)
  (or (beautiful-sym f) (beautiful-neighbor f)))
