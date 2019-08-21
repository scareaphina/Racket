#lang simply-scheme

; 5.14

(define (third thing)
  (first (butfirst
          (butfirst thing))))

(third 'and)

; second attempt with trace

(define (third thing)
  (first (butfirst
          (butfirst thing))))

(trace third)

(third 'and)
(third '(i wanna hold your hand))

5.15

(define (first-two wd)
  (word
   (first wd) (first (butfirst wd))))

(first-two 'seraphina)

(first-two 'ambulatory)
