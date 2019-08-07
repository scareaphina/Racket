#lang simply-scheme

(define (square x)
  (* x x))

(square 7)

(+ 10 (square 2))

(square (square 3))
