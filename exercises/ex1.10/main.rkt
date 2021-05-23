#lang racket

#|
|#
(require rackunit
         racket/trace)

(define (A x y)
  (cond ((= y 0) 0)
        ((= x 0 ) (* 2 y))
        ((= y 1) 2)
        (else (A (- x 1) (A  x (- y 1))))))

(A 1 10)
(A 2 4)
(A 3 3)

#|

(f n):
(A 0 n)
(* 2 n)
2n

# applicative order expansion
(g n)
(A 1 n)
(A 0 (A 1 n-1))
(A 0 (A 0 (A 1 n-2)))
(A 0 (A 0 ... (A 1 1)))
2^(n-1)*2
2^n

(h n)
do your self

|#
