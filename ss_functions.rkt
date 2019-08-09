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

(define (first-letters sent)
  (every first sent))

(first-letters '(lucy in the sky with diamonds))

(every last '(while my guitar gently weeps))

(every - '(4 5 6 7 8 9))

(define (plural noun)
  (if (equal? (last noun) 'y)
      (word (bl noun) 'ies)
      (word noun 's)))

(every plural '(beatle turtle holly kink zombie))

(define (double letter) (word letter letter))

(every double 'girl)

(define (set-of-first-two wd)
  (se (first wd) (first (bf wd))))

(every set-of-first-two '(the inner light))

(every set-of-first-two '(tell me what you see))

(define (g wd)
  (se (word 'with wd) 'you))

(every g '(in out))

; keep

(keep even? '(1 2 3 4 5))

(define (ends-e? word) (equal? (last word) 'e))

(keep ends-e? '(please put the salami above the blue elephant))

(keep number? '(1 after 1909))

(keep number? 'zonk23hey9)

(define (vowel? letter) (member? letter '(a e i o u)))

(keep vowel? 'piggies)

(define (real-world? wd)
  (not (member? wd '(a the an in of and for to with))))

(keep real-world? '(lucy in the sky with diamonds))

(every first (keep real-world? '(lucy in the sky with diamonds)))
