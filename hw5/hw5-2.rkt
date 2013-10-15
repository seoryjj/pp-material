#lang racket


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
  (raise "TODO"))

(define (size f) ; size: form -> int
  (raise "TODO"))

(define (beautiful f) ; beautiful: form -> bool
  (raise "TODO"))
