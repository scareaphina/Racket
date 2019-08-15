#lang simply-scheme

; 5.14

(define (third thing)
  (first (butfirst
          (butfirst thing))))

(third 'and)

5.15

(define (first-two wd)
  (word
   (first wd) (first (butfirst wd))))

(first-two 'seraphina)

(first-two 'ambulatory)
