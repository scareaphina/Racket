#lang simply-scheme

; variables

(define (square x) (* x x))

(define (hypotenuse x y)
  (sqrt (+ (square x) (square y))))

(hypotenuse 3 4)

(define (f x)
  (g 6))

(define (g y)
  (+ x y))

(f 4)

(define (f x)
  (g x 6))

(define (g x y)
  (+ x y))

(f 4)
