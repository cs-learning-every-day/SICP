#lang sicp
;;; public 
(define (make-mobile left right)
  (list left right))

(define (make-branch length structure)
  (list length structure))

(define (left-branch mobile)
  (car mobile))

(define (right-branch mobile)
  (cadr mobile))

(define (branch-length branch)
  (car branch))

(define (branch-structure branch)
  (cadr branch))

;;; private
(define (empty-mobile? mobile)
  (null? mobile))

(define (structure-is-branch? branch)
  (pair? branch))

; b
(define (total-weight mobile)
  (if (empty-mobile? mobile)
      0
      (+ (branch-weight (left-branch mobile))
         (branch-weight (right-branch mobile)))))

(define (branch-weight branch)
  (if (structure-is-branch? (branch-structure branch))
      (total-weight (branch-structure branch))
      (branch-structure branch)))

; c
(define (branch-torque branch)
  (* (branch-length branch)
     (branch-weight branch)))

(define (mobile-balance? mobile)
  (let ((left (left-branch mobile))
        (right (right-branch mobile)))
    (and (same-torque? left right)
         (branch-balance? left)
         (branch-balance? right))))

(define (same-torque? l-branch r-branch)
  (= (branch-torque l-branch)
     (branch-torque r-branch)))

(define (branch-balance? branch)
  (if (structure-is-branch? (branch-structure branch))
      (mobile-balance? (branch-structure branch))
      #t))

; d 4

;;; test
(define mobile (make-mobile (make-branch 20 30)
                            (make-branch 20 0.5)))
(define mobile2 (make-mobile (make-branch 20 100)
                             (make-branch 20 mobile)))
(define mobile3 (make-mobile (make-branch 20 mobile2)
                             (make-branch 20 mobile)))

mobile
(left-branch mobile)
(right-branch mobile)
(branch-length (right-branch mobile))
(branch-structure (right-branch mobile))

(total-weight nil)
(total-weight mobile)

mobile2
(total-weight mobile2)

mobile3
(total-weight mobile3)


(define branch (make-branch 10 20))
(branch-torque branch)

(define balance-mobile (make-mobile (make-branch 10 10)
                                    (make-branch 10 10)))
(mobile-balance? balance-mobile)

(define unbalance-mobile (make-mobile (make-branch 0 0)
                                      (make-branch 10 10)))
(mobile-balance? unbalance-mobile)

(define mobile-with-sub-mobile (make-mobile (make-branch 10 balance-mobile)
                                            (make-branch 10 balance-mobile)))
(mobile-balance? mobile-with-sub-mobile)

(define mobile-with-sub-mobile2 (make-mobile (make-branch 10 balance-mobile)
                                             (make-branch 10 unbalance-mobile)))
(mobile-balance? mobile-with-sub-mobile2)