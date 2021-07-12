#lang sicp
(define (same-parity first . rest)
  (let ((flag? (if (odd? first)
                odd?
                even?)))
      (define (iter items result)
        (if (null? items)
            (reverse result)
            (iter (cdr items) (if (flag? (car items))
                                  (cons (car items)
                                        result)
                                  result))))
    (iter rest (list first))))


(same-parity 1 2 3 4 5 6 7)
(same-parity 2 3 4 5 6 7)