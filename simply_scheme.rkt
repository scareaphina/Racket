#lang simply-scheme

; lambda

(define (add-three number)
  (+ number 3))

(define (add-three-to-each sent)
  (every add-three sent))

(add-three-to-each (1992))

;use lambda to generate a procedure that does those things for us

(define (add-three-to-each sent)
  (every (lambda (number) (+ number 3)) sent))

(add-three-to-each (1 9 9 2))

((lambda (a b) (+ (* 2 a) b)) 5 6)

((lambda (wd) (word (last wd) (first wd))) 'impish)

(define (acronym phrase)
  (accumulate word (every first phrase)))

(acronym '(american civil liberties union))
(acronym '(reduced instruction set computer))
(acronym '(quod erat demonstrandum))

(first 'american)

(every first '(american civil liberties union))

(accumulate word '(a c l u))

(acronym '(united states of america))

(define (acronym phrase)
  (accumulate word (every first (keep real-word? phrase))))

(define (real-word? wd)
  (not (member? wd '(a the an in of and for to with))))

(acronym '(united states of america))

(acronym '(structure and interpretation of computer programs))

(acronym '(association for computing machinery))

(real-word? 'structure)

(real-word? 'of)

(keep real-word? '(united network command for law and enforcement))

(define (pigl wd)
  (if (member? (first wd) 'aeiou)
      (word wd 'ay)
      (pigl (word (butfirst wd) (first wd)))))

(pigl 'spaghetti)

(pigl 'ok)

(pigl 'elphant)

(first 'spaghetti)

(butfirst 'spaghetti)

(word 'paghetti 's)

(define (rotate wd)
  (word (butfirst wd) (first wd)))

(rotate 'spaghetti)

(rotate 'paghettis)

(pigl 'aghettisp)

(every pigl '(the ballad of john and yoko))
