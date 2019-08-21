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

; second attempt

(define (first-two wd)
  (word
   (first wd) (first (butfirst wd))))

(trace first-two)

(first-two 'elephant)
(first-two 'broccoli)

; 5.16

(define (two-first y z)
  (word (first y) (first z)))

(define (two-first-sent sent)
  (word
   (first (first sent))
   (first (first (butfirst sent)))))

(trace two-first)
(trace two-first-sent)

(two-first 'brian 'epstein)
(two-first-sent '(brian epstein))

; 5.17

(define (knight sent)
  (sentence 'Sir sent))

(knight 'Sterling)
(knight '(Arthur of the Round Table))
