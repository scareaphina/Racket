; lambda

; lambda creates a function, define names it

(define add1 (lambda (x) (+ x 1)))

(add1 4)
(5)

;;;;;

(define (add-three number)
  (+ number 3))

;(define (add-three-to-each sent)
;  (every add-three sent))

; inconvenient to define a helper we are only going to use for this procedure, so use lambda!

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

; when we evaluate (same-arg-twice word), we substitute the procedure word for the formal parameter fn so the result is (lambda (arg) (word arg arg))

; 'hellohello

((same-arg-twice *) 4)

; 16

(define (flip fn)
  (lambda (a b) (fn b a)))

((flip -) 5 8)

; 3

((flip se) 'goodbye 'hello)

; '(hello goodbye)

; the truth about define

; define's real job is to give a name to some value

(define pi 3.141592654)

(* pi 10)

(define drummer '(ringo starr))

(first drummer)

; when we say: 

;(define (square x) (* x x))

; it's actually an abbreviation for

; (define square (lambda (x) (* x x)))

; here, the job of lambda is to create a procedure that multiplies its argument by itself, the job of define is to name that procedure square

(define (same-arg-twice fn)
  (lambda (arg) (fn arg arg)))

; now that we know the whole truth about define, we can combine it with the function-creating functions in these past two chapters

(define square (same-arg-twice *))

(square 7)

(define forth-power (repeated square 2))

(forth-power 5)

; the truth about let

(define (roots a b c)
  (roots1 a b c (sqrt (- (* b b) (* 4 a c)))))

(define (roots1 a b c discriminant)
  (se (/ (+ (- b) discriminant) (* 2 a))
      (/ (- (- b) discriminant) (* 2 a))))

(define (roots a b c)
  (let ((discriminant (sqrt (- (* b b) (* 4 a c)))))
    (se (/ (+ (- b) discriminant) (* 2 a))
        (/ (- (- b) discriminant) (* 2 a)))))

; name conflicts

(define (f x)
  (lambda (x) (+ x 3))) ; don't procedures in procedures with the same formal parameter name in both
  
  ; named and unnamed functions

(define pi 3.141592654)

(define (circle-area radius)
  (* pi radius radius))

(define (circumference radius)
  (* 2 pi radius))

(define (sphere-surface-area radius)
  (* 4 pi radius radius))

(define (sphere-volume radius)
  (* (/ 4 3) pi radius radius radius))

(define (square x) (* x x))

(define (backwards wd)
  (accumulate (lambda (a b) (word b a)) wd))

(backwards 'yesterday)

(every backwards '(i saw her standing there))
