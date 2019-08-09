; functions as data

(define (make-conjugator prefix ending)
  (lambda (verb) (sentence prefix (word verb ending))))

(define third-person (make-conjugator ' she 's))

(third-person 'program)

(define third-person-plural-past (make-conjugator 'they 'ed))

(third-person-plural-past 'play)

(define second-person-future-perfect
  (make-conjugator '(you will have) 'ed))

(second-person-future-perfect 'laugh)

; higher order functions

(define (two-firsts sent)
  (se (first (first sent))
      (first (last sent))))

(two-firsts '(john lennon))

(two-firsts '(george harrison))

(define (three-firsts sent)
  (se (first (first sent))
      (first (first (bf sent)))
      (first (last sent))))

(three-firsts '(james paul mccartney))

(define (first-letters sent)
  (every first sent))

(first-letters '(lucy in the sky with diamonds))
