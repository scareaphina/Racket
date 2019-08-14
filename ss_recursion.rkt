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

;;;;;;;;;;;;;;;

(define (explode0 wd)
  '())

(define (explode1 wd)
  (se wd))

(define (explode2 wd)
  (se (first wd) (last wd)))

;(define (explode3 wd)
;  (se (first wd) (first (bf wd)) (last wd)))

; complex enough that we want to use explode2 to help

(define (explode3 wd)
  (se (first wd) (explode2 (bf wd))))

(define (explode4 wd)
  (se (first wd) (explode3 (bf wd))))

; so what's our base case? now that we know the pattern we can write explode2 in terms of 1, and even 1 in terms of 0

(define (explode2 wd)
  (se (first wd) (explode1 (bf wd))))

(define (explode1 wd)
  (se (first wd) (explode0 (bf wd))))

; so now we can write a recursive process that handles one and two letter words so that only zero letter words are special cases

(define (explode wd)
  (if (empty? wd)
      '()
      (se (first wd) (explode (bf wd)))))

;;;;;;;;;;;;;;;;;;;;;

(define (reverse wd)
  (word (last wd)
        (reverse (bl wd))))

;;;;;;;;;;;;;;;;;;;;;

; factorial
                    
(define (factorial n)
  (* n (factorial (- n 1))))

(define (factorial n)
  (if (= n 1)
      1
      (* n (factorial (- n 1)))))

(define (factorial n)
  (if (= n 1)
      1
      (* n (factorial (- n 1)))))

; evens

(define (losing-evens sent)
  (if (empty? sent)
      '()
      (se (losing-evens (bl sent))
          (last sent))))

(losing-evens '(i want to hold your hand))

(define (losing-evens sent)
  (if (empty? sent)
      '()
      (se (losing-evens (bl sent))
          (last sent))))

(losing-evens '(i want to hold your hand))

(define (evens1 sent)
  (cond ((empty? sent) '())
        ((odd? (count sent))
         (evens1 (bl sent)))
        (else (se (evens1 (bl sent))
                  (last sent)))))

(evens1 '(i want to hold your hand))

(define (evens sent)
  (if (<= (count sent) 1)
      '()
      (se (first (bf sent))
          (evens (bf (bf sent))))))

(evens '(got to get you into my life))

; simplifying base case

(define (reverse1 wd)
  (if (= (count wd) 1)
      wd
      (word (last wd)
            (reverse1 (bl wd)))))

;(word (last wd)
;      (reverse (bl wd)))

(define (reverse wd)
  (if (empty? wd)
      ""
      (word (last word)
            (reverse (bl word)))))

(reverse 'unicorn)

(define (downup wd)
  (if (= (count wd) 1)
      (se wd)
      (se wd (downup (bl wd)) wd)))

(downup 'a)

(downup 'alphabet)

(define (factorial n)
  (if (= n 1)
      1
      (* n (factorial (- n 1)))))

(define (letter-pairs wd)
  (if (<= (count wd) 1)
      '()
      (se (first-two wd)
          (letter-pairs (bf wd)))))

(define (first-two wd)
  (word (first wd) (first (bf wd))))

(first-two 'a)
