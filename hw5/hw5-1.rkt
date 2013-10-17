#lang racket


;;; CAUTION: read VERY CAREFULLY hw5-1-grade.rkt before doing your HW.
;;; Instructions how to write submission (and grade it) is written in
;;; hw5-1-grade.rkt.

;;; If these statements are omitted, your submission will be graded 0.
;;; You can add whatever function you would like to make public.
;;; For example, if you want a function foo in hw5-2, provide it.

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
  'B)

(define white ; white: form
  'W)


;;; implementation with array

(define (glue-array-from-tree nw ne se sw) ; glue-array-from-tree: form * form * form * form -> form
  'TODO)

(define (glue-array-from-array nw ne se sw) ; glue-array-from-array: form * form * form * form -> form
  'TODO)

(define (glue-tree-from-tree nw ne se sw) ; glue-tree-from-tree: form * form * form * form -> form
  'TODO)

(define (glue-tree-from-array nw ne se sw) ; glue-tree-from-array: form * form * form * form -> form
  'TODO)

(define (rotate-array f) ; rotate-array: form -> form
  'TODO)

(define (neighbor-array location f) ; neighbor-array: location * form -> int
  'TODO)

; In the document, it is said to have type form -> void, but implement
; as form -> string.
; Read hw5-1-grade.rkt for formatting.
(define (pprint-array f) ; pprint-array: form -> string
  'TODO)

(define (is-array? f) ; is-array?: form -> bool
  (cond [(equal? 'B f) #t]
        [(equal? 'W f) #t]
        [else 'TODO]))


;;; implementation with tree

(define (rotate-tree f) ; rotate-tree: form -> form
  'TODO)

(define (neighbor-tree loc f) ; neighbor-tree: location * form -> int
  'TODO)

; In the document, it is said to have type form -> void, but implement
; as form -> string.
(define (pprint-tree f) ; pprint-tree: form -> string
  'TODO)

(define (is-tree? f) ; is-tree?: form -> bool
  (cond [(equal? 'B f) #t]
        [(equal? 'W f) #t]
        [else 'TODO]))


;;; conversions 

(define (array-to-tree f) ; array-to-tree: form -> form
  'TODO)

(define (tree-to-array f) ; tree-to-array: form -> form
  'TODO)


;;; interfaces

(define (glue nw ne se sw) ; glue: form * form * form * form -> form
  'TODO)

(define (rotate f) ; rotate: form -> form
  (if (is-array? f)
      (rotate-array f)
      (rotate-tree f)))

(define (neighbor loc f) ; neighbor: location * form -> int
  (if (is-array? f)
      (neighbor-array loc f)
      (neighbor-tree loc f)))

; In the document, it is said to have type form -> void, but implement
; as form -> string.
(define (pprint f) ; pprint: form -> string
  (if (is-array? f)
      (pprint-array f)
      (pprint-tree f)))
