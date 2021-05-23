#lang debug racket

#|
|#
(require rackunit
         racket/trace
         debug/repl)

(define (get-elem row)
  (+ (car row) (cadr row)))

(define (get-next-elems row)
  (cond
    ((eq? row '()) '())
    ((eq? (cdr row) '()) (list 1))
    (else (cons (get-elem row) (get-next-elems (cdr row))))))

; some unit test
;; (trace get-next-elems)
(check-equal? (get-next-elems (list 1)) '(1))
(check-equal? (get-next-elems (list 1 3 3 1)) '(4 6 4 1))

(define (get-next-row row)
  (cons 1 (get-next-elems row)))

(check-equal? (get-next-row '(1)) '(1 1))
(check-equal? (get-next-row '(1 3 3 1)) '(1 4 6 4 1))

(define (pascal-list n)
  (if (= n 1)
      (list (list 1))
      (let* (
             [tri (pascal-list (- n 1))]
             [last-row (car tri)]
             [new-row (get-next-row last-row)]
             )
        (cons new-row tri))))

(define (pascal n)
  (reverse (pascal-list n)))

; (trace pascal)
(check-equal? (pascal 1) '((1)))
(check-equal? (pascal 2) '((1) (1 1)))
(check-equal? (pascal 3) '((1) (1 1) (1 2 1 )))

; try it
(pascal 5)
