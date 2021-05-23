#lang racket

(require rackunit)

(define (cubic x) (* x x x))
(define (square x) (* x x))

(define (improve y x)
  (/ (+ (/ x (square y)) y y) 3))

(define (good-enough? guess x)
  (< (abs (- (cubic guess) x)) 0.001))

(define (cubic-root-iter guess x)
  (if (good-enough? guess x)
          guess
          (cubic-root-iter (improve guess x) x)))

(define (cubic-root x)
  (cubic-root-iter 1.0 x))

(check-within (cubic (cubic-root 10)) 10 1e-3)
