#lang sicp
(define (reverse items)
  (define (iter its result)
    (if (null? its)
        result
        (iter (cdr its)
              (cons (car its)
                    result))))

  (iter items '()))

(list 1 4 9 16 25)
(reverse (list 1 4 9 16 25))