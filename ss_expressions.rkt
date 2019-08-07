#lang simply-scheme

(+ (+ 2 3) (+ 4 5))

(- (+ 5 8) (+ 2 4))

(+ (+ 2 3) (+ 4 5))

(- (+ 5 8) (+ 2 4))

(* (- (+ 5 8) (+ 2 4))
   (/ 10 2))

(+ (* 2 (/ 14 7) 3)
   (/ (* (- (* 3 5) 3) (+ 1 1))
      (- (* 4 3) (* 3 2)))
   (- 15 18))

; Scheme understands the above by looking for the subexpressions of the overall expression, like this:
(+ ()
   (        ; One of them takes two lines but you can tell by
      )     ; matching parentheses that they're one expression.
   ())

