#lang simply-scheme

; 4.4

(define (next x)
  (+ x 1))

(define (square x)
  (* x x))

(define (triangle-area triangle)
  (* 0.5 (* base height)))

(define (sum-of-squares x y)
  (+ (square x) (square y)))
