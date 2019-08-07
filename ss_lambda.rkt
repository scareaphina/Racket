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

;; the real power of lambda comes when using lambda to define a function

(define (make-adder num)
  (lambda (x) (+ x num)))

((make-adder 4) 7)

; 11

(define (same-arg-twice fn)
  (lambda (arg) (fn arg arg)))

((same-arg-twice word) 'hello)

; 'hellohello

((same-arg-twice *) 4)

; 16

(define (flip fn)
  (lambda (a b) (fn b a)))

((flip -) 5 8)

; 3

((flip se) 'goodbye 'hello)

; '(hello goodbye)

(define pi 3.141592654)

(* pi 10)

; 31.41592654

(define drummer '(ringo starr))

(first drummer)

; ringo

(define (square x) (* x x))

(define square (lambda (x) (* x x)))

(define square (same-arg-twice *))

(square 7)

; 49

(define forth-power (repeated square 2))

(forth-power 5)

; 625
