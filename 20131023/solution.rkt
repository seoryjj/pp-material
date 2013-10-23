#lang racket

;;; complex number

(define (is-c-rect? c)
  (equal? 'rect (car c)))

(define (c-rect-make x y)
  (cons 'rect (cons x y)))

(define c-rect-real cadr)

(define c-rect-imaginary cddr)


(define (is-c-polar? c)
  (equal? 'polar (car c)))

(define (c-polar-make theta r)
  (cons 'polar (cons theta r)))

(define c-polar-angle cadr)

(define c-polar-radius cddr)


(define (c-real c)
  (if (is-c-rect? c)
      (c-rect-real c)
      (* (cos (c-polar-angle c)) (c-polar-radius c))))

(define (c-imaginary c)
  (if (is-c-rect? c)
      (c-rect-imaginary c)
      (* (sin (c-polar-angle c)) (c-polar-radius c))))

(define (c-angle c)
  (if (is-c-rect? c)
      (atan (c-rect-imaginary c) (c-rect-real c))
      (c-polar-angle c)))

(define (c-radius c)
  (if (is-c-rect? c)
      (sqrt (+ (expt (c-rect-real c) 2) (expt (c-rect-imaginary c) 2)))
      (c-polar-radius c)))

(define (c-conjugate c)
  (if (is-c-rect? c)
      (c-rect-make (c-rect-real c) (- (c-rect-imaginary c)))
      (c-polar-make (- (+ pi pi) (c-polar-angle c)) (c-polar-radius c))))

(define c1 (c-rect-make 1 2))
(define c2 (c-rect-make 3 4))
(define c3 (c-polar-make 0.7 3))
(define c4 (c-polar-make 0.5 2))

(c-rect-real c1) ; 1
(c-rect-imaginary c2) ; 4
(c-polar-angle c3) ; 0.7
(c-polar-radius c4) ; 2
(is-c-rect? c1) ; #t
(is-c-rect? c3) ; #f
(is-c-polar? c4) ; #t
(c-real c1) ; 1
(c-real c3) ; 2.2945265618534654 = (* 3 (cos 0.7))
(c-imaginary c2) ; 4
(c-imaginary c4) ; 0.958851077208406 = (* 2 (sin 0.5))
(c-angle c1) ; 1.1071487177940904;(atan 2 1)
(c-angle c3) ; 0.7
(c-radius c2) ; 5 = (sqrt (+ (expt 3 2) (expt 4 2)))
(c-radius c4) ; 2

(define c5 (c-conjugate c1))
(define c6 (c-conjugate c3))

(c-real c5) ; 1
(c-imaginary c5) ; -2
(c-real c6) ; 2.2945265618534654
(c-imaginary c6) ; -1.932653061713073



;;; imperative programming

(define fsm null)
(define state "initial")

(define (init-fsm) ; init-fsm: unit
  (set! fsm null)
  (set! state "initial"))

(define (add-rule-fsm curstate input newstate output) ; add-rule-fsm: state * input * state * output -> unit
  (set! fsm (cons (cons (cons curstate input) (cons newstate output)) fsm)))

(define (step-fsm input) ; step-fsm: input -> output
  (let ((input-state state)
        (output "nothing"))
    (for ((rule fsm))
         (when (equal? (cons input-state input) (car rule))
               (set! state (cadr rule))
               (set! output (cddr rule))))
    output))

(define (run-fsm inputs) ; run-fsm: input list -> output list
  (let ((output-list null))
    (for ((input inputs))
         (let ((output (step-fsm input)))
           (set! output-list (append output-list (list output)))))
    output-list))

(init-fsm)
(add-rule-fsm "initial" "insert-coin" "coined" "nothing")
(add-rule-fsm "initial" "push-cola" "initial" "nothing")
(add-rule-fsm "initial" "push-cider" "initial" "nothing")
(add-rule-fsm "initial" "push-return" "initial" "nothing")
(add-rule-fsm "coined" "insert-coin" "coined" "coin")
(add-rule-fsm "coined" "push-cola" "initial" "cola")
(add-rule-fsm "coined" "push-cider" "initial" "cider")
(add-rule-fsm "coined" "push-return" "initial" "coin")

(and
 (equal? "initial" state)
 (equal?
  (list "nothing" "cola" "nothing" "coin" "cider" "nothing")
  (run-fsm (list "insert-coin" "push-cola" "insert-coin" "insert-coin" "push-cider" "push-cider"))))
