#lang simply-scheme

; 4.4

(define (square x)
  (* x x))

(define (cube x)
  (* x (square x)))

(define (sphere-volume r)
  (* (/ 4 3) 3.141592654)
  (cube r))

(define (next x)
  (+ x 1))

(define (triangle-area base height)
  (* 0.5 base height))

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

;;;;;;;

; second attempt

; 4.5

(define (cel-fahr fahr)
  (* (/ 5 9) (- fahr 32)))

; C=5⁄9(F-32)

(define (fahr-cel cel)
  (* (/ 5 9) (+ cel 32)))

; F=9⁄5C+32

; 4.6

(define (square x)
  (* x x))

(define (forth x)
  (* (* x x) (*x x)))

(define (forth x)
  (* (square x) (square x)))

;;;;;;;;;;;;;;;;
; second attempt

(define (forth x)
  (* (* x x) (* x x)))

(forth 3)

(define (square n)
  (* n n))

(define (forth2 n)
  (* (square n) (square n)))

(forth2 3)

; 4.7

(define (square x)
  (* x x))

(define (abs arg)
  (sqrt (square arg)))

(abs 3)

; 4.10

(define (tip bill)
  (ceiling (* bill .15)))

(tip 100)

(tip 19.98)

(tip 29.23)

(tip 7.54)
