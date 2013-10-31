#lang racket

(define (create-fsm)
  (define rules null)
  (define state "initial")

  (define (init) ; -> unit
    (set! rules null)
    (set! state "initial"))

  (define (add-rule curstate input newstate output) ; add-rule: state * input * state * output -> unit
    (set! rules (cons (cons (cons curstate input) (cons newstate output)) rules)))

  (define (step input) ; step: input -> output
    (let ((input-state state)
          (output "nothing"))
      (for ((rule rules))
           (when (equal? (cons input-state input) (car rule))
                 (set! state (cadr rule))
                 (set! output (cddr rule))))
      output))

  (define (run inputs) ; run: input list -> output list
    (let ((output-list null))
      (for ((input inputs))
           (let ((output (step input)))
             (set! output-list (append output-list (list output)))))
      output-list))

  (list init add-rule step run))

(define (init-fsm fsm) ; init-fsm: fsm -> unit
  ((list-ref fsm 0)))

(define (add-rule-fsm fsm curstate input newstate output) ; add-rule-fsm: fsm * state * input * state * output -> unit
  ((list-ref fsm 1) curstate input newstate output))

(define (step-fsm fsm input) ; step-fsm: fsm * input -> output
  ((list-ref fsm 2) input))

(define (run-fsm fsm inputs) ; run-fsm: fsm * input list -> output list
  ((list-ref fsm 3) inputs))

(define fsm1 (create-fsm))
(init-fsm fsm1)
(add-rule-fsm fsm1 "initial" "insert-coin" "coined" "nothing")
(add-rule-fsm fsm1 "initial" "push-cola" "initial" "nothing")
(add-rule-fsm fsm1 "initial" "push-cider" "initial" "nothing")
(add-rule-fsm fsm1 "initial" "push-return" "initial" "nothing")
(add-rule-fsm fsm1 "coined" "insert-coin" "coined" "coin")
(add-rule-fsm fsm1 "coined" "push-cola" "initial" "cola")
(add-rule-fsm fsm1 "coined" "push-cider" "initial" "cider")
(add-rule-fsm fsm1 "coined" "push-return" "initial" "coin")
(equal?
 (list "nothing" "cola" "nothing" "coin" "cider" "nothing")
 (run-fsm fsm1 (list "insert-coin" "push-cola" "insert-coin" "insert-coin" "push-cider" "push-cider")))

(define fsm2 (create-fsm))
(init-fsm fsm2)
(add-rule-fsm fsm2 "initial" "insert-coin" "coined" "nothing")
(add-rule-fsm fsm2 "initial" "push-orange" "initial" "nothing")
(add-rule-fsm fsm2 "initial" "push-grape" "initial" "nothing")
(add-rule-fsm fsm2 "initial" "push-return" "initial" "nothing")
(add-rule-fsm fsm2 "coined" "insert-coin" "coined" "coin")
(add-rule-fsm fsm2 "coined" "push-orange" "initial" "orange")
(add-rule-fsm fsm2 "coined" "push-grape" "initial" "grape")
(add-rule-fsm fsm2 "coined" "push-return" "initial" "coin")
(equal?
 (list "nothing" "orange" "nothing" "coin" "grape" "nothing")
 (run-fsm fsm2 (list "insert-coin" "push-orange" "insert-coin" "insert-coin" "push-grape" "push-grape")))
