#lang racket
#|

eval the first operator (if (> b 0) + -) and get the result of + or - primitive procedure. then apply the procedure to a and b arguments.

|#

(define a 1)
(define b 2)

(define proc (if (> b 0) + -))
proc
(apply proc (list a b))
