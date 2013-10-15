#lang racket


;;; If these statements are omitted, your submission will be graded 0.

(provide black)
(provide white)

(provide glue-array-from-tree)
(provide glue-array-from-array)
(provide rotate-array)
(provide neighbor-array)
(provide pprint-array)
(provide is-array?)

(provide glue-tree-from-tree)
(provide glue-tree-from-array)
(provide rotate-tree)
(provide neighbor-tree)
(provide pprint-tree)
(provide is-tree?)

(provide array-to-tree)
(provide tree-to-array)

(provide glue)
(provide rotate)
(provide neighbor)
(provide pprint)


;;; primitive tile

(define black ; black: form
  (raise "TODO"))

(define white ; white: form
  (raise "TODO"))


;;; how to pprint
;
; Make the pprint function to print tiles on the screen using the
; characters 'W' for the white tile and 'B' for the black tile.  For
; example, (pprint (glue black black black white)) should prints tiles
; as follows.
;
; BB
; WB


;;; implementation with array

(define (glue-array-from-tree nw ne se sw) ; glue-array-from-tree: form * form * form * form -> form
  (raise "TODO"))

(define (glue-array-from-array nw ne se sw) ; glue-array-from-array: form * form * form * form -> form
  (raise "TODO"))

(define (rotate-array f) ; rotate-array: form -> form
  (raise "TODO"))

(define (neighbor-array loc f) ; neighbor-array: location * form -> int
  (raise "TODO"))

; In the document, it is said to have type form -> void, but implement
; as form -> string.
(define (pprint-array f) ; pprint-array: form -> string
  (raise "TODO"))

(define (is-array? f) ; is-array?: form -> bool
  (raise "TODO"))


;;; implementation with tree

(define (glue-tree-from-tree nw ne se sw) ; glue-tree-from-tree: form * form * form * form -> form
  (raise "TODO"))

(define (glue-tree-from-array nw ne se sw) ; glue-tree-from-array: form * form * form * form -> form
  (raise "TODO"))

(define (rotate-tree f) ; rotate-tree: form -> form
  (raise "TODO"))

(define (neighbor-tree loc f) ; neighbor-tree: location * form -> int
  (raise "TODO"))

; In the document, it is said to have type form -> void, but implement
; as form -> string.
(define (pprint-tree f) ; pprint-tree: form -> string
  (raise "TODO"))

(define (is-tree? f) ; is-tree?: form -> bool
  (raise "TODO"))


;;; conversions 

(define (array-to-tree f) ; array-to-tree: form -> form
  (raise "TODO"))

(define (tree-to-array f) ; tree-to-array: form -> form
  (raise "TODO"))


;;; interfaces

(define (glue nw ne se sw) ; glue: form * form * form * form -> form
  (raise "TODO"))

(define (rotate f) ; rotate: form -> form
  (raise "TODO"))

(define (neighbor loc f) ; neighbor: location * form -> int
  (raise "TODO"))

; In the document, it is said to have type form -> void, but implement
; as form -> string.
(define (pprint f) ; pprint: form -> string
  (raise "TODO"))
