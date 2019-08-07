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

; 4.5

; F=9⁄5C+32

(define (cel-to-fahr cel)
  (+ (* (/ 9 5) cel) 32))

(cel-to-fahr 32)

; C=5⁄9(F-32)

(define (fahr-to-cel fahr)
  (* (/ 5 9) (- fahr 32)))

(fahr-to-cel 95)
