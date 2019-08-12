#lang simply-scheme

(define (game low high)
  (let ((guess (average low high)))
    (cond ((too-low? guess) (game (+ guess 1) high))
          ((too-high? guess) (game low (- guess 1)))
          (else '(I win!)))))

(define (downup1 wd)
  (se wd))

(downup1 'a)

(define (downup2 wd)
  (se wd (first wd) wd))

(downup2 'be)

;(define (downup3 wd)
;  (se wd
;      (bl wd)
;      (first wd)
;      (bl wd)
;      wd))

(define (downup3 wd)
  (se wd (downup2 (bl wd)) wd))

(downup3 'foo)

(define (downup4 wd)
  (se wd (downup3 (bl wd)) wd))

(downup4 'paul)

(define (downup59 wd)
  (se wd (downup58 (bl wd)) wd))

(define (downup2 wd)
  (se wd (downup1 (bl wd)) wd))
