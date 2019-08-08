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

; special forms

; if is a special form

(if (= 3 3)
    'sure
    (factorial 1000))
    
; and & or are also special forms

(define (divisible? big small)
  (= (remainder big small) 0))

(define (num-divisible-by-4? x)
  (and (number? x) (divisible? x 4)))

(num-divisible-by-4? 16)

(num-divisible-by-4? 6)

(num-divisible-by-4? 'aardvark)

(divisible? 'aardvark 4)

; everything that isn't false is true

(define (divisible? big little)
  (= (remainder big little) 0))

(if (+ 3 4) 'yes 'no)

(define (integer-quotient big little)
  (if (divisible? big little)
      (/ big little)
      #f))

(integer-quotient 27 3)

(integer-quotient 12 5)

; returns a true result as soon as it evaluates true
(or #f 3 #f 4)

; returns a true result only if all arguments are true
(and 1 2 3 4 5)

(define (integer-quotient big little) ; alternate version
  (and (divisible? big little)
       (/ big little)))

(define (roman-value letter)
  (if (equal? letter 'i)
      1
      (if (equal? letter 'v)
          5
          (if (equal? letter 'x)
              10
              (if (equal? letter 'l)
                  50
                  (if (equal? letter 'c)
                      100
                      (if (equal? letter 'd)
                          500
                          (if (equal? letter 'm)
                              1000
                              'huh?))))))))

(define (roman-value letter)
  (cond ((equal? letter 'i) 1)
        ((equal? letter 'v) 5)
        ((equal? letter 'x) 10)
        ((equal? letter 'l) 50)
        ((equal? letter 'c) 100)
        ((equal? letter 'd) 500)
        ((equal? letter 'm) 1000)
        (else 'huh?)))
