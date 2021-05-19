#lang racket

#|
说的是absolute tolerance 和relative tolerance的区别．
原始版本用的是absolute tolerance, e.g. 0.001
需要改成relative tolerance.
二者的优劣如下：
对于大数和小数来说，控制相对精度即控制迭代次数
而绝对精度会导致大数和小数收敛次数不一样．
相对精度缺点是大数误差大，小数误差小．
abstol, reltol在迭代算法中很常见，用于控制迭代停止的不同策略．
尤其是有时会取二者的结合．

自己体会一下相对精度和绝对精度控制的区别．
|#
(require rackunit)

(define (square x) (* x x))

(define (average x y)
  (/ (+ x y) 2))

(define (improve guess x)
  (average guess (/ x guess)))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) (* 0.001 guess)))

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
          guess
          (sqrt-iter (improve guess x) x)))

(define (sqrt1 x)
  (sqrt-iter 1.0 x))

(check-within (sqrt1 10) (sqrt 10) 1e-3)
