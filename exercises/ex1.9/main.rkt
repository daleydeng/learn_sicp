#lang racket

#| 很明显第一种是递归，第二种是迭代
|#
(require rackunit
         racket/trace)

(define (inc a) (+ a 1))
(define (dec a) (- a 1))

(define (plus1 a b)
  (if (= a 0) b (inc (plus1 (dec a) b))))

(display "first case:\n")
(trace plus1)
(plus1 4 5)

(define (plus2 a b)
  (if (= a 0) b (plus2  (dec a) (inc b))))

(display "second case:\n")
(trace plus2)
(plus2 4 5)
