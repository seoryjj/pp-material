#lang racket

; switch the require for testing dictionary-function.rkt
(require "dictionary-list.rkt")
; (require "dictionary-function.rkt")

(define dic1 (empty-dic))
(define dic2 (add-dic "kwang" "Professor" dic1))
(define dic3 (add-dic "sungkeun" "TA" dic2))
(define dic4 (add-dic "jeehoon" "TA" dic3))

(print (find-dic "kwang" dic4)) ; "Professor"
(printf "\n")
(print (find-dic "sungkeun" dic4)) ; "TA"
(printf "\n")
(print (find-dic "jeehoon" dic4)) ; "TA"
(printf "\n")

(define dic5 (add-dic "kwang" "Awesome Professor" dic4))
(define dic6 (add-dic "sungkeun" "Awesome TA" dic5))
(define dic7 (add-dic "jeehoon" "Awesome TA" dic6))

(print (find-dic "kwang" dic7)) ; "Awesome Professor"
(printf "\n")
(print (find-dic "sungkeun" dic7)) ; "Awesome TA"
(printf "\n")
(print (find-dic "jeehoon" dic7)) ; "Awesome TA"
(printf "\n")
