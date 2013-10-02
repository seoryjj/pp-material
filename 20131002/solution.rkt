#lang racket

(define (prob-show n m d)
  (cond ((< n m) 0)
        ((= m 1) (* (expt (/ 1 d) n) d))
        (else
         (+ 
          (* 
           (prob-show (- n 1) (- m 1) d)
           (/ (- d (- m 1)) d))
          (* 
           (prob-show (- n 1) m d)
           (/ m d))))))

(define (fibonacci2 n)
  (define (fibonacci-aux n a b m)
    (if (= n m) 
        a
        (fibonacci-aux n b (+ a b) (+ m 1))))
  (fibonacci-aux n 0 1 0))

(define (my-gcd n m)
  (printf "~s~n" (+ n m))
  (cond ((= n 0) m)
        ((= m 0) n)
        ((< n m) (my-gcd n (- m n)))
        (else (my-gcd (- n m) m))))