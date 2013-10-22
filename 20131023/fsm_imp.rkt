#lang racket

; imperative programming

(define fsm null)

(define (init-fsm) ; init-fsm: unit
  (set! fsm null))

(define (add-rule-fsm curstate input newstate output) ; add-rule-fsm: state * input * state * output -> unit
  (set! fsm (cons (cons (cons curstate input) (cons newstate output)) fsm)))

(define (step-fsm curstate input) ; step-fsm: state * input -> state X output
  (let ((state curstate)
        (output "nothing"))
    (for ((rule fsm))
         (raise "TODO"))
    (cons state output)))

(define (run-fsm curstate inputs) ; run-stem: state * input list -> state X output list
  (let ((state curstate)
        (output-list null))
    (for ((input inputs))
         (raise "TODO"))
    (cons state output-list)))

(init-fsm)
(add-rule-fsm "initial" "insert-coin" "coined" "nothing")
(add-rule-fsm "initial" "push-cola" "initial" "nothing")
(add-rule-fsm "initial" "push-cider" "initial" "nothing")
(add-rule-fsm "initial" "push-return" "initial" "nothing")
(add-rule-fsm "coined" "insert-coin" "coined" "coin")
(add-rule-fsm "coined" "push-cola" "initial" "cola")
(add-rule-fsm "coined" "push-cider" "initial" "cider")
(add-rule-fsm "coined" "push-return" "initial" "coin")

(equal?
 (cons "initial" (list "nothing" "cola" "nothing" "coin" "cider" "nothing"))
 (run-fsm "initial" (list "insert-coin" "push-cola" "insert-coin" "insert-coin" "push-cider" "push-cider")))
