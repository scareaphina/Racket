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

;;;;;;
; simple racket program for menu population

(define (choices menu)
  (if (null? menu)
      '(())
      (let ((smaller (choices (cdr menu))))
        (reduce append
                (map (lambda (item) (prepend-every item smaller))
                     (car menu))))))

(define (prepend-every item 1st)
  (map (lambda (choice) (se item choice)) 1st))

(choices '((small medium large)
           (vanilla (ultra chocolate) (rum raisin) ginger)
           (cone cup)))
           
;result:
'((small vanilla cone)
  (small vanilla cup)
  (small ultra chocolate cone)
  (small ultra chocolate cup)
  (small rum raisin cone)
  (small rum raisin cup)
  (small ginger cone)
  (small ginger cup)
  (medium vanilla cone)
  (medium vanilla cup)
  (medium ultra chocolate cone)
  (medium ultra chocolate cup)
  (medium rum raisin cone)
  (medium rum raisin cup)
  (medium ginger cone)
  (medium ginger cup)
  (large vanilla cone)
  (large vanilla cup)
  (large ultra chocolate cone)
  (large ultra chocolate cup)
  (large rum raisin cone)
  (large rum raisin cup)
  (large ginger cone)
  (large ginger cup))
  
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;
  
 ;expressing complex techniques simply in scheme
 
 (define (combinations size set)
  (cond ((= size 0) '(()))
        ((empty? set) '())
        (else (append (prepend-every (first set)
                                     (combinations (- size 1)
                                                   (butfirst set)))
                      (combinations size (butfirst set))))))

(combinations 3 '(a b c d e))

(combinations 2 '(john paul george ringo))

;;;;;;;;;;;;;;;;;;

(define (factorial n)
  (if (= n 0)
      1
      (* n (factorial (- n 1)))))

(factorial 4)

(factorial 1000)

(factorial 400)

;;;;;;;;;;;;;;;;;;

