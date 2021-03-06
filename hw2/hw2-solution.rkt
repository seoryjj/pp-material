#lang racket

(provide zipper zipperN iter)

(define (zipper lhs rhs)
  (if (pair? lhs)
      (let ((lhd (car lhs))
            (ltl (cdr lhs)))
        (if (pair? rhs)
            (let ((rhd (car rhs))
                  (rtl (cdr rhs)))
              (cons lhd (cons rhd (zipper ltl rtl))))
            lhs))
      rhs))

(define (zipperN lists)
  (if (pair? lists)
      (let ((lhd (car lists))
            (ltl (cdr lists)))
        (if (pair? lhd)
            (let ((llhd (car lhd))
                  (lltl (cdr lhd)))
              (cons llhd (zipperN (append ltl (list lltl)))))
            (zipperN ltl)))
      '()))

(define (iter n f)
  (let ((m (abs n)))
    (if (equal? m 0)
        (lambda (x) x)
        (lambda (x)
          (let ((fx (f x))
                (remf (iter (- m 1) f)))
            (remf fx))))))
