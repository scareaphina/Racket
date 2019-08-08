#lang simply-scheme

(define (greet name)
  (if (equal? (first name) 'professor)
      (se '(i hope i am not bothering you) 'professor (last name))
      (se '(good to see you) (first name))))

(greet '(matt wright))

(greet '(professor harold abelson))

(member? 'mick '(dave dee dozy beaky mick and tich))

(member? 'mick '(john paul george ringo))

(member? 'e 'truly)

(member? 'y 'truly)

(= 3 4)

(= 67 67)

(= (+ 52 8) 60)

(> 98 97)

(before? 'zorn 'coleman)

(before? 'pete 'ringo)

(empty? '(abbey road))

(empty? '())

(empty? 'hi)

(empty? (bf (bf 'hi)))

(empty? "")

(number? 'three)

(number? 74)

(boolean? #f)

(boolean? '(the beatles))

(boolean? 234)

(boolean? #t)

(word? 'flying)

(word? '(dig it))

(word? 87)

(sentence? 'wait)

(sentence? '(what goes on))

(define (vowel? letter)
  (member? letter 'aeiou))

(define (positive? number)
  (> number 0))

; using predicates

(define (abs num)
  (if (< num 0)
      (- num)
      num))

(define (divisible? big little)
  (= (remainder big little) 0))

(define (buzz num)
  (if (or (divisible? num 7) (member? 7 num))
      'buzz
      num))

(buzz 17)
(buzz 42)
(buzz 124)

;(define (plural wd)
;  (word wd 's))

(plural 'beatle)

(plural 'computer)

(plural 'fly) ; ah, but incorrect. how do we make this correct?

(define (plural wd)
  (if (equal? (last wd) 'y)
      (word (bl wd) 'ies)
      (word wd 's)))

(plural 'beatle)

(plural 'computer)

(plural 'fly)
