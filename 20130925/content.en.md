# Lab Session, Principles of Programming #

25 Sep. 2013 (Wed) 16:00-17:50
TA [Sungkeun Cho](http://ropas.snu.ac.kr/~skcho), [Jeehoon Kang](http://ropas.snu.ac.kr/~jhkang)

## Announcement ##

* Class is divided into two subclasses (at 4 o'clock and 5 o'clock).
* HW 3 is out.
  + Task 1 asks you to comment the types of programs. Comment types as
    in this material.
* We changed how HW is evaluated.
  + See the [TA page](http://ropas.snu.ac.kr/~ta/4190.210/13/).
  + [Crowdgrader?](https://github.com/lunaticas/pp-material/blob/master/crowdgrader/crowdgrader_en.md)

## Lab Material ##

* ```even-list```

```even-list```, given a list of integers, results in the list of
booleans which indicate whether the given integers are even. Fill the
blank.
```racket
(define (iseven n) (= (modulo n 2) 0)) ; iseven: int -> bool
(define (even-list items) ; even-list: int list -> bool list
  (if (null? items)
    '()
    (cons (raise "TODO") (even-list (raise "TODO")))))
```

* ```map```

```even-list``` is easily implemented with ```map```. ```map```, given
a list and a function, results in the list of elements applied with
the given function.
```racket
(define (even-list-map items) ; even-list-map: int list -> bool list
  (map iseven items))
```

Implement ```my-map: (a -> b) -> a list -> b list``` which behaves
equivalently to ```map```. For example,

```racket
(my-map abs (list -1 -2 -3 4))
```

should results in ```'(1 2 3 4)```.

* ```fold```

```fold```, given a list, a function, and an initial value, results in:

```racket
(fold (a1 a2 ... an) f c) = (f a1 (f a2 (... (f an c) ...)))
```

The definition is:

```racket
(define (fold lst f c) ; fold: a list -> (a -> b -> b) -> b -> b
  (if (null? lst) c
  (f (car lst) (fold (cdr lst) f c))))
```

Given the definition of ```fold```, ```even-list```, and ```or```,
implement ```has-even``` that checks if a given list has an even
number as follows:

```racket
(has-even '(1 2 3 5)) ; #t
(has-even '(-1 1 3)) ; #f
```

* Records has pairs of a keyword and its associated value. Interface
  for records are as follows:

```racket
empty-record: record
add-record: string -> any -> record -> record
find-record: string -> record -> any
```

[```record-list.rkt```](record-list.rkt) contains an implementation of
records in lists. [```record-use.rkt```](record-use.rkt) is a usage.

Implement a record in functions in
[```record-function.rkt```](record-function.rkt). Do not modify
```empty-record``` and fill blanks in ```add-record``` and
```find-record```. Check if [```record-use.rkt```](record-use.rkt)
works fine after changing ```require```.
