#lang simply-scheme

(define (square x)
  (* x x))

(square 7)

(+ 10 (square 2))

(square (square 3))

;;;;;;;;;;;;;;;;;;;;;;;

(define (square x)
  (* x x))

(square 7)

(+ 10 (square 2))

(square (square 3))

(define (f x)
  (+ (* 3 x) 12))

(define (g x)
  (* 3 (+ x 4)))

;;;;;;;;;;;;;;;;;;;;;;;
