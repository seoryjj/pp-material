#lang racket

; applicative programming

(define init-fsm ; init-fsm: fsm
  null)

(define (add-rule-fsm curstate input newstate output fsm) ; add-rule-fsm: state * input * state * output * fsm -> fsm
  (cons (cons (cons curstate input) (cons newstate output)) fsm))

(define (step-fsm curstate input fsm) ; step-fsm: state * input * fsm -> state X output
  (if (null? fsm) 
      (cons curstate "nothing")
      (if (equal? (cons curstate input) (caar fsm))
          (cdar fsm)
          (step-fsm curstate input (cdr fsm)))))

(define (run-fsm curstate inputs fsm) ; run-stem: state * input list * fsm -> state X output list
  (if (null? inputs)
      (cons curstate null)
      (let* ((result (step-fsm curstate (car inputs) fsm))
             (final-result (run-fsm (car result) (cdr inputs) fsm)))
        (cons (car final-result) (cons (cdr result) (cdr final-result))))))

(define fsm1 init-fsm)
(define fsm2 (add-rule-fsm "initial" "insert-coin" "coined" "nothing" fsm1))
(define fsm3 (add-rule-fsm "initial" "push-cola" "initial" "nothing" fsm2))
(define fsm4 (add-rule-fsm "initial" "push-cider" "initial" "nothing" fsm3))
(define fsm5 (add-rule-fsm "initial" "push-return" "initial" "nothing" fsm4))
(define fsm6 (add-rule-fsm "coined" "insert-coin" "coined" "coin" fsm5))
(define fsm7 (add-rule-fsm "coined" "push-cola" "initial" "cola" fsm6))
(define fsm8 (add-rule-fsm "coined" "push-cider" "initial" "cider" fsm7))
(define fsm9 (add-rule-fsm "coined" "push-return" "initial" "coin" fsm8))

(equal?
 (cons "initial" (list "nothing" "cola" "nothing" "coin" "cider" "nothing"))
 (run-fsm "initial" (list "insert-coin" "push-cola" "insert-coin" "insert-coin" "push-cider" "push-cider") fsm9))
