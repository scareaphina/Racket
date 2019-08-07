(define (add-three number)
  (+ number 3))

(define (add-three-to-each sent)
  (every add-three sent))

(add-three-to-each '(1 9 9 2))

; defining that first function just to use it once is tedious. use lambda!

(define (add-three-to-each sent)
  (every (lambda (number) (+ number 3)) sent))

(add-three-to-each '(1 9 9 2))

;'(4 12 12 5)

((lambda (a b) (+ (* 2 a) b)) 5 6)

; 16

(every (lambda (wd) (se (first wd) wd (last wd)))
       '(only a northern song))

; '(o only y a a a n northern n s song g)

(keep (lambda (n) (member? 9 n)) '(4 81 909 781 1969 1776))

; '(909 1969)

(accumulate (lambda (this that)
              (if (> (count this) (count that)) this that))
            '(wild honey pie))

; 'honey

(keep (lambda (person) (member? person '(john paul george ringo)))
      '(mick smokey paul diana bill geddy john yoko keith reparata))

; '(paul john)

(keep (lambda (person) (member? 'e person))
      '(mick smokey paul diana bill geddy john yoko keith reparata))
      
; '(smokey geddy keith reparata)
