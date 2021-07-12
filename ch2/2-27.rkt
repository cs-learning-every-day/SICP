#lang sicp

(define x (list (list 1 2) (list 3 4)))

(define (tree-left tree)
  (car tree))

(define (tree-right tree)
  (cadr tree))

(define (empty-tree? tree)
  (null? tree))

(define (leaf? tree)
  (not (pair? tree)))

(define make-tree list)

(define (deep-reverse tree)
  (cond ((empty-tree? tree) '())
        ((leaf? tree) tree)
        (else
         (reverse (make-tree (deep-reverse (tree-left tree))
                             (deep-reverse (tree-right tree)))))))


x
(reverse x)
(deep-reverse x)