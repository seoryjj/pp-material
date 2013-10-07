# Lab Session, Principles of Programming #

2013/10/2 (Wed) 16:00-17:50
TA [Sungkeun Cho](http://ropas.snu.ac.kr/~skcho), [Jeehoon Kang](http://ropas.snu.ac.kr/~jhkang)

## Lab Material ##

### Hello Recursion!

There is a dice which has three kinds of spot.  When we throw the dice
four times, the probability that there appears two kinds of spot is as
follows.

* Spot1 and spot2 appear: 14 cases

  1112, 1121, 1211, 2111, 1122, 1212, 1221, 2112, 2121, 2211, 1222,
  2122, 2212, 2221

* Spot1 and spot3 appear: 14 cases

* Spot2 and spot3 appear: 14 cases

* The probability that two kinds of spot appear: (14\*3) / (3\*3\*3\*3)

Generalizing the problem, let's think about a dice which has d kinds
of spot.  When we throw the dice n times, the probability that there
appears m kinds of spot can be calculated as follows.

1. when n<m: since there is no such case, the probability is 0.
2. when m=1: the probability that there appears only one kind of spot
   with n throws is ((1/d)^n) \* d.
3. otherwise: sum of the next probabilities.
   * (the probability of appearing m kinds of spot with n-1 throws) \* (m/d).
   * (the probability of appearing m-1 kinds of spot with n-1 throws) \* ((d-(m-1))/d).

```prob-show``` calculates the probability of appearing m kinds of
spot when throwing a dice that has m kinds of spot n times.  Complete
the function.

```racket
(define (prob-show n m d)
  (cond ((< n m) (raise TODO))
        ((= m 1) (raise TODO))
        (else (raise TODO))))
```

### Tail Recursion Practice

*Tail Recursion* is a programming method to avoid accumulation of
continuations when there are many recursions.

```racket
(define (fac1 n) 
   (if (= n 0) 1 (* n (fac1 (- n 1)))))
    
(define (fac2 n)
   (define (fac-aux m r)
       (if (= m 0) r (fac-aux (- m 1) (* m r))))
   (fac-aux n 1))
```

The above two examples show factorial functions.  `fac1` is an
implementation in which every continuations are accumulated to be done
later and `fac2` is an implementation using tail recursion.

Modify the next function to use tail recursion.

Hint: in the arguments of `fibonacci-aux`, it is helpful to think that
`a` is `(fibonacci m)` and `b` is `(fibonacci (m+1))`.

```racket
(define (fibonacci1 n)
  (cond ((= n 0) 0)
        ((= n 1) 1)
        (else (+ (fibonacci1 (- n 1)) (fibonacci1 (- n 2))))))
    
(define (fibonacci2 n)
  (define (fibonacci-aux n a b m)
    (if (= n m) 
        a
        (raise "TODO")))
  (fibonacci-aux n 0 1 0))
```

### Termination of Program

The next factorial function terminates.

```racket
(define (fac n) 
   (printf "~s~n" n)
   (if (= n 0) 1 (* n (fac (- n 1)))))
```

To show the factorial function terminates explicitly, it prints *a
decreasing number* by the ```printf``` operation in the function.  The
decreasing number should satisfy the next conditions.

1. it must decrease in the every execution steps.
2. it must be bigger than or equal to 0.

The `my-gcd` function below also terminates.  To show the function
terminates explicitly, complete the function.  You can think that the
inputs of the `my-gcd` function are bigger than or equal to 0.

```racket
(define (my-gcd n m)
  (printf "~s~n" (raise "TODO"))
  (cond ((= n 0) m)
        ((= m 0) n)
        ((< n m) (my-gcd n (- m n)))
        (else (my-gcd (- n m) m))))
```
