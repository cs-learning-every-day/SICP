#lang sicp
(define (square x) (* x x))

(define (tree-map process tree)
  (cond ((null? tree) nil)
        ((not (pair? tree)) (process tree))
        (else (cons (tree-map process (car tree))
                    (tree-map process (cdr tree))))))

(define (square-tree tree) (tree-map square tree))
(square-tree (list 1
                   (list 2 (list 3 4) 5)))