# Lab Session, Principles of Programming #

11st Sep. 2013 (Wed) 16:00-17:50  
TA [Sungkeun Cho](http://ropas.snu.ac.kr/~skcho), [Jeehoon Kang](http://ropas.snu.ac.kr/~jhkang)

## Homework ##

[HW1 description](http://ropas.snu.ac.kr/~kwang/4190.210/13/hw1.pdf)

[Registering your Google ID](https://docs.google.com/forms/d/1qfm9xJmWguqvm1dFZc4X0L3RGHArKltmV7-CQThwH5Y/viewform): Please register your google ID by Wednesday.
We we prepare homework submission system Wednesday night (after all google IDs are gathered).

[HW submission system](http://www.crowdgrader.org/): We use CrowdGrader.
For more information, see:

* [HW submission system exlplanation](https://github.com/lunaticas/pp-material/blob/master/crowdgrader/crowdgrader.md)
* [(in English)](https://github.com/lunaticas/pp-material/blob/master/crowdgrader/crowdgrader_en.md)

Submission format: upload .rkt file for each task.

Resubmission: you may resubmit by the (due + delay). The last submission is the only submission TAs will consider.

Delay policy: -10% by 24 hrs, -20% by 48 hrs. No submissions are accepted after 48hrs.

Ask about homework in the board.

## Lab Team ##

### Lab Team Confirmation ###

We will confirm all lab teams and post the result in the board.

### Division ###

We will divide the class into two subclasses: one for 4 o'clock and another for 5 o'clock.
* After the half the the semester (5 times) we will change the two subclasses.
* The class is divided entirely **randomly**.

## Lab Material ##

We aim to learn concepts related to the homework 1.

### Value and Expression of Racket ###

#### Value ####

* Numbers
```racket
1
```

* Strings
```racket
"Principles of Programming"
```

* Pairs
```racket
(cons 2 3)
```

* Lists
```racket
'(1 2 3 4 5)
```

* Procedures
```racket
(lambda (x) (+ x 1))
```

#### Expression ####

```racket
(+ -1 2)
```

```racket
(string-append "Principles " "of " "Programming")
```

```racket
(cons (+ 1 1) (+ 1 2))
```

```racket
(append '(1 2) '(3 4 5))
```

```racket
((lambda (f) f) (lambda (x) (+ x 1)))
```

Other expressions:

```racket
if, equal?, or, and, +, -, *, /, <, quotient, remainder, ...
```

```racket
(if (equal? 1 2) "X" "O")
```

```racket
(if (or (equal? 1 2) (equal? 3 3)) "O" "X")
```

```racket
(if (and (equal? 1 2) (equal? 3 3)) "X" "O")
```

```racket
(+ 1 2 3 4 5)
```

```racket
(+ (* 1 2) (/ 3 4) (quotient 5 6) (remainder 7 8) (- 9 10))
```

```racket
(equal? "a" "a")
```

```racket
(if (< 1 2) "O" "X")
```

#### Pairs ####

Use ```cons``` to make a pair; ```car```, to get the first element; ```cdr```, to get the last one.

```racket
(car (cons 1 (cons 2 "three")))
```

```racket
(cdr (cons 1 (cons 2 "three")))
```

#### Lists ####

Lists are favorable data structure in Racket. In fact, lists are pairs constructed in a regular way.

```racket
(cons 0 (cons 1 (cons 2 '())))
```

```racket
(cons 0 '(1 2 3 4 5))
```

```racket
(cons 1 '())
```

You can check if a list is null.

```racket
(null? '())
```

```racket
(null? '(1 2 3))
```

Append two lists.

```racket
(append '(1 2) '(3 4))
```

* Rather than:
```racket
'(1 2 (+ 1 2) 4 5)
```

* spell like:
```racket
(list 1 2 (+ 1 2) 4 5)
```

### Define ###


You can assign an expression in a variable by ```define```, however complicated the expression is.

```racket
(define s (string-append "Hello, " "World!\n"))
(print s)
```

```racket
(define lst '(1 3 5 7))
```

```racket
(define f (lambda (x) (+ x 1)))
(f 1)
```

```racket
(define f (lambda (x y z) (+ x y z)))
(f 2 3 4)
```

There is a easier way to ```define``` a procedure.

```racket
(define (mySum a b) (+ a b))
(mySum 5 6)
```

```racket
(define (myIdentity x)
	(if (equal? 0 x)
		0
		(+ (myIdentity (- x 1)) 1)))
(myIdentity 5)
```

### Recursion ###

* If a procedure(foo) uses the very procedure(foo), the procedure is called **recursion**. The example defines ```myRev``` which reverses the input list.
  
```racket
(define (myRev l)
  (if (null? l)
      null
      (append (myRev (cdr l)) (list (car l)))))
(myRev (list 1 2 3 4))
```

  ```myRev``` uses ```myRev``` itself. Recursion like this is widely used for such data structures whose size is not pre-defined as lists.
  
* Adding 2 for all elements of a list

```racket
(define (add_two l)
  (if (null? l)
      null
      (cons (+ (car l) 2) (add_two (cdr l)))))
(add_two (list 1 2 3 4))
```

### Labwork ###

* Get the sign of a number.

```racket
(define (sign x)
    (raise "TODO"))
(sign 0) ; "0"
(sign 1) ; "+"
(sign -1) ; "-"
```

* Get the absolute number of a number.

```racket
(define (absolut x)
    (raise "TODO"))
(absolut 0) ; 0
(absolut 1) ; 1
(absolut -1) ; 1
```

* Get the largest element of a list.

```racket
(define (maxima lst)
    (raise "TODO"))
(maxima '()) ; 0
(maxima '(1 5 2 4 3)) ; 5
(maxima '(7 3 1)) ; 7
```
