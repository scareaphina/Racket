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

(define (f a b)
  (+ (* 3 a) b))

(f 5 8)

(f 8 5)

(/ (+ 17 25) 2)

(/ (+ 14 68) 2)

(define (average a b)
  (/ (+ a b) 2))

(average 27 4)

;;;;;;;;;;;;;;;;;;;;;;;

; composability
