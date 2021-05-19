#lang racket

#|
|#
(require rackunit
         racket/trace)

;; (define (pascal-row last-row n)
;;   (cons 1

(define (pascal n)
  (if (= n 1)
      (list (list 1))
      (let* (
             [tri (pascal (- n 1))]
             [last-row (car tri)]
             [new-row (pascal-row last-row n)]
             )
        (cons new-row (pascal (n - 1))))))
