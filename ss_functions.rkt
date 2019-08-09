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
