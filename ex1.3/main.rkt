#lang racket

(require rackunit)

(define (square a) (* a a))

(define (square-sum a b) (+ (square a) (square b)))

(define (sum-top2 a b c)
  (cond
    [(and (<= a b) (<= a c)) (square-sum b c)]
    [(and (<= b a) (<= b c)) (square-sum a c)]
    [(and (<= c a) (<= c b)) (square-sum a b)]
    ))

(check-equal? (sum-top2 1 2 3) 13)
(check-equal? (sum-top2 2 1 3) 13)
(check-equal? (sum-top2 3 2 1) 13)
