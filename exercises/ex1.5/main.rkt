#lang racket

#|

p is a infinity loop

对于 applicative order, 所有的arguments会先被eval, 这样(p)就会进入无限循环, eval不出来。
而 normal-order会先展开，展开的时候由于if特殊形式，(p)被剪掉了，所以会返回0
|#

(define (p) (p))
(define (test x y)
  (if (= x 0) 0 y))

p

(test 0 (p))

; 结果是无限循环 applicative order
