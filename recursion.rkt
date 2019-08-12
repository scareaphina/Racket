#lang simply-scheme

(define (game low high)
  (let ((guess (average low high)))
    (cond ((too-low? guess) (game (+ guess 1) high))
          ((too-high? guess) (game low (- guess 1)))
          (else '(I win!)))))

(define (downup1 wd)
  (se wd))

(downup1 'a)

(define (downup2 wd)
  (se wd (first wd) wd))

(downup2 'be)

;(define (downup3 wd)
;  (se wd
;      (bl wd)
;      (first wd)
;      (bl wd)
;      wd))

(define (downup3 wd)
  (se wd (downup2 (bl wd)) wd))

(downup3 'foo)

(define (downup4 wd)
  (se wd (downup3 (bl wd)) wd))

(downup4 'paul)

(define (downup59 wd)
  (se wd (downup58 (bl wd)) wd))

(define (downup2 wd)
  (se wd (downup1 (bl wd)) wd))

;(define (downup wd)                          ;; first version
;  (se wd (downup (bl wd)) wd))

;(downup 'toe)

(define (downup wd)
  (if (= (count wd) 1)
      (se wd)
      (se wd (downup (bl wd)) wd)))

(downup 'toe)

(downup 'banana)

;;;;;;;;;;;;;;;;;;;;;
; pig latin

(define (pigl0 wd)
  (word wd 'ay))

(pigl0 'alabaster)

;(define (pigl1 wd)
;  (word (bf wd) (first wd) 'ay))

;(pigl1 'salami)

;(define (pigl1 wd)
;  (word (word (bf wd) (first wd))
;        'ay))

;(pigl1 'pastrami)

(define (pigl1 wd)
  (pigl0 (word (bf wd) (first wd))))

(define (pigl2 wd)
  (pigl1 (word (bf wd) (first wd))))

(pigl2 'trample)

(define (pigl3 wd)
  (pigl2 (word (bf wd) (first wd))))

(pigl3 'chrome)

(define (pigl wd)
  (if (member? (first wd) 'aeiou)
      (word wd 'ay)
      (pigl (word (bf wd) (first wd)))))

(pigl 'apple)

(pigl 'stair)

(pigl 'thrush)
