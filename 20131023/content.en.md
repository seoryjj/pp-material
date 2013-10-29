# Lab Session, Principles of Programming #

2013/10/23 (Wed) 16:00-17:50
TA [Sungkeun Cho](http://ropas.snu.ac.kr/~skcho), [Jeehoon Kang](http://ropas.snu.ac.kr/~jhkang)

### Complex numbers ###

Implement complex numbers. You can do in two ways:

+ Descartes coordinate system: As usual, express as ```(x, y)```.  +
Polar coordinate system: ```(r, θ)``` means the length ```r``` and the
angle ```θ```.

Both are represented as ```real X real```, so it is better to
distinguish with tagging. For example,

+ ```(cons 'rect (cons 1 pi))``` means ```(1, pi)``` in the Descartes
  coordinate, and
+ ```(cons 'polar (cons 1 pi))``` means ```(1, pi)``` in polar
coordinate, i.e. ```(-1,0)``` in Descartes coordinate.

Implement functions on Descartes coordinate system,
```racket
is-c-rect?: c-rect -> bool
c-rect-make: number * number -> c-rect
c-rect-real: c-rect -> number
c-rect-imaginary: c-rect -> number
```

and functions on polar coordinate system.
```racket
is-c-polar?: c-polar -> bool
c-polar-make: number * number -> c-polar
c-polar-real: c-polar -> number
c-polar-imaginary: c-polar -> number
```

Implement functions that works on both coordinate systems.
```racket
c-real: complex -> number
c-imaginary: complex -> number
c-angle: complex -> number
c-radius: complex -> number
c-conjugate: complex -> complex
```

See Wikipedia for more information on complex numbers and polar
coordinate system.

+ [Complex number](http://en.wikipedia.org/wiki/Complex_number)
+ [Polar coordinate system](http://en.wikipedia.org/wiki/Polar_coordinate_system)

```racket
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
```

### Applicative programming vs. Imperative programming ###

You have learned *applicative* and *imperative* programming in the
last class.  In this time we practice them.

#### Summation ####

A summation function that sums 0 to 10 can be implemented with the two
styles of programming.

##### Applicative programming

```racket
(define (sum_a n)
  (if (equal? n 0)
      0
      (+ n (sum_a (- n 1)))))

(sum_a 10)
```

The above function is implemented as a recursive function.  Note that
all variables(`n`) appearing on the execution are **values**; which means
that their contents never change.

##### Imperative programming

The next is an example that implements the same function with the
imperative style.

```racket
(define sum 0)

(define (sum_i n)
  (if (equal? n 0)
      sum
      (begin 
        (set! sum (+ n sum))
        (sum_i (- n 1)))))

(sum_i 10)
```

The imperative program has a variable, `sum`, of which content changes
on the execution.  The content changes many times on the execution and
it finally becomes a value we want to get.

The next function uses the `for` statement of the racket language.
Please refer to the
[manual](http://docs.racket-lang.org/reference/for.html) of racket for
more deatils.

```racket
(set! sum 0)

(define (sum_i_for n)
  (for ((i (+ n 1)))
       (set! sum (+ sum i)))
  sum)

(sum_i_for 10)
```

#### Finite state machine ####

Let's re-implement the finite state machine we did in the last week
with the imperative programming style.

The next is
[skeleton code](https://github.com/lunaticas/pp-material/blob/master/20131023/fsm_imp.rkt)
today.  Compare it to the
[solution](https://github.com/lunaticas/pp-material/blob/master/20131023/fsm.rkt)
of the last week.

```racket
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
         (raise "TODO"))
    output))

(define (run-fsm inputs) ; run-fsm: input list -> output list
  (let ((output-list null))
    (for ((input inputs))
         (raise "TODO"))
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
```

Please complete the functions `step-fsm` and `run-fsm` that execute
the finite state machine.  The next can be helpful.

1. `fsm` and `state` represent a finite state machine and its state,
respectively.  They are some **states**, not **values**, which means
that their contents can be changed when some functions are executed.

2. The finite state machine has a type `((state X input) X (state X
output)) list`.

3. The execution of `step-fsm`: (1) traversing all rules of the finite
state machine, it records the next state and output to `state` and
`output` using the input state(`input-state`) and the input
value(`input`); (2) after the traversing it ouputs `output`.

4. The execution of `run-fsm`: (1) traversing all inputs in `inputs`,
it executes `step-fsm`.  At that time, the output that is return of
`step-fsm` is recorded to `output-list`; (2) after the traversing it
outputs `output-list`.
