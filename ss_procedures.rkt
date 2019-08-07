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

(define (average a b)
  (/ (+ a b) 2))

(average (+ 10 8) (* 3 5))

(average (average 2 3) (average 4 5))

(sqrt (average 143 145))

; the substitution model

(define (square x)
  (* x x))

(define (hypotenuse a b)
  (sqrt (+ (square a) (square b))))

(hypotenuse 5 12)

; spelled out:

(sqrt (+ (square 5) (square 12)))

(hypotenuse 5 12)                   ; substitute into HYPOTENUSE body
(sqrt (+ (square 5) (square 12)))   ; substitute for (SQUARE 5)
         (* 5 5)
         25
(sqrt (+ 25         (square 12)))   ; substitute for (SQUARE 12)
                    (* 12 12)
                    144
(sqrt (+ 25         144))
      (+ 25         144)            ; combine the results as before
      169
(sqrt 169)
13

;;;;;;;;;;;;;;;;;;;;;;;

; pitfalls

(define (sum-of-squares x y)
  (+ (square x)
     (square y)))

(define (f x)
  (+ (* x 3) 10))

;;;;;;;;;;;;;;;;;;;;;;;

