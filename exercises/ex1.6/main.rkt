#lang racket

(require rackunit)

(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

(new-if (= 2 3) 0 5)
(new-if (= 1 1) 0 5)

(define (square x) (* x x))
(define (average x y)
  (/ (+ x y) 2))
(define (improve guess x)
  (average guess (/ x guess)))
(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (sqrt-iter1 guess x)
  (if (good-enough? guess x)
          guess
          (sqrt-iter1 (improve guess x) x)))

(define (sqrt-iter2 guess x)
  (new-if (good-enough? guess x)
          guess
          (sqrt-iter2 (improve guess x) x)))

(define (sqrt-iter3 guess x)
  (cond ((good-enough? guess x) guess)
        (else (sqrt-iter3 (improve guess x) x))))

(define (sqrt1 x)
  (sqrt-iter1 1.0 x))
(define (sqrt3 x)
  (sqrt-iter3 1.0 x))

(check-within (sqrt1 10) (sqrt 10) 0.002)
(check-within (sqrt3 10) (sqrt 10) 0.002)

;; 因为applicative-order必须先eval arguments, 但是arguments中有递归的调用了sqrt-iter2，导致死循环。如果采用if/cond特殊形式，它不是eval 所有的arguments, 而是先看predicate, 来决定后面是走consequent还是alternative。这样一开始走alternative, 最后一次退出条件满足的时候走consequent, 从而跳出死循环。本质原因是它不是所有的arguments都eval.
(define (sqrt2 x)
  (sqrt-iter2 1.0 x))
(sqrt2 10)

; 会造成死循环
