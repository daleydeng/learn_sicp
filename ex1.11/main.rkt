#lang racket

#|
|#
(require rackunit
         racket/trace)

(define (f0 n)
  (if (< n 3)
      n
      (+ (f0 (- n 1)) (* 2 (f0 (- n 2))) (* 3 (f0 (- n 3))))))

(define (f-iter a b c n)
  (if (= n 0)
      c
      (f-iter b c (+ c (* 2 b) (* 3 a)) (- n 1))))

(define (f1 n)
  (f-iter 0 1 2 (- n 2)))

(trace f-iter)

(check-equal? (f0 4) (f1 4))
