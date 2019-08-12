#lang simply-scheme

; 4.4

(define (next x)
  (+ x 1))

(define (square x)
  (* x x))

(define (triangle-area triangle)
  (* 0.5 (* base height)))

(define (sum-of-squares x y)
  (+ (square x) (square y)))

; 4.5

; F=9⁄5C+32

(define (cel-to-fahr cel)
  (+ (* (/ 9 5) cel) 32))

(cel-to-fahr 32)

; C=5⁄9(F-32)

(define (fahr-to-cel fahr)
  (* (/ 5 9) (- fahr 32)))

(fahr-to-cel 95)

; 4.6

(define (square x)
  (* x x))

(define (forth x)
  (* (* x x) (*x x)))

(define (forth x)
  (* (square x) (square x)))

; 4.7

(define (square x)
  (* x x))

(define (abs arg)
  (sqrt (square arg)))

(abs 3)

; 4.10

(define (tip bill)
  (ceiling (* bill .15)))

(tip 100)

(tip 19.98)

(tip 29.23)

(tip 7.54)

; 5.14

(define (third thing)
  (first (butfirst
          (butfirst thing))))

(third 'and)

5.15

(define (first-two wd)
  (word
   (first wd) (first (butfirst wd))))

(first-two 'seraphina)

(first-two 'ambulatory)

;6.5

(define (am? time)
  (equal? (last time) 'am))

(define (pm? time)
  (equal? (last time) 'pm))

(define (american-time time)
  (if (> time 12)
      (sentence (- time 12)
                (if (= time 24) 'am 'pm))
      (sentence time (if (= time 12) 'pm 'am))))

(define (european-time time)
  (if (or
       (and
        (< (first time) 12) (pm? time))
       (and
        (= (first time) 12) (am? time)))
      (+ (first time) 12)
      (first time)))

(european-time '(8 am))

(european-time '(4 pm))

(american-time 21)

(american-time 12)

(european-time '(12 am))

; 6.6

(define (teen? age)
  (and(< age 19)
      (> age 13)))

(teen? 14)
(teen? 10)
(teen? 20)

; 6.7

(define (type-of argument)
  (cond ((boolean? argument) 'boolean)
        ((sentence? argument) 'sentence)
        ((number? argument) 'number)
        ((word? argument) 'word)
        (else 'huh?)))

(type-of 34)

(type-of '(never gonna give you up))

(type-of "")

(type-of #t)

(type-of 'never)

; 6.8

(define (vowel? x)
  (member? x '(a e i o u)))

(define (indef-article word)
  (cond ((vowel? (first word)) (sentence 'an word))
      (else (sentence 'a word))))

(indef-article 'snack)
(indef-article 'apple)
(indef-article 'map)

; 6.9

(define (plural wd)
  (if (equal? (last wd) 'y)
      (word (bl wd) 'ies)
      (word wd 's)))

(define (thismany amount noun)
  (sentence
   amount
   (if (> amount 1) (plural noun) noun)))

(thismany 1 'apple)

(thismany 2 'baby)

(thismany 75 'apple)

;6.13

(define (greet name)
  (se '(pleased to meet you)
  (cond ((equal? (first name) 'professor) 'professor)
        ((equal? (first name) 'mr) 'mister)
        ((equal? (first name) 'ms) 'miss)
        ((equal? (first name) 'doctor) 'doctor)
        (else first name))
  (se (last name)
      '(- how are you?))))

(greet '(professor michael brown))
(greet '(mr andrews))
(greet '(safi harriott))

; 8.4

(define (vowel? letter)
  (member? letter '(a e i o u)))

(define (even-count? word)
  (even? (count word)))

(define (ends-vowel? word)
  (vowel? (last word)))

(define (choose-beatles pred)
  (keep pred '(John Paul George Ringo)))

(choose-beatles ends-vowel?)

(choose-beatles even-count?)

; 8.5

(define (transform-beatles procedure)
  (se (every procedure '(John Paul George Ringo))))

(transform-beatles butfirst)

; 8.6

(define (nato-phon letter)
  (cond ((equal? letter 'a) 'alpha)
        ((equal? letter 'b) 'bravo)
        ((equal? letter 'c) 'charlie)
        ((equal? letter 'd) 'delta)
        ((equal? letter 'e) 'echo)
        ((equal? letter 'f) 'foxtrot)
        ((equal? letter 'g) 'golf)
        ((equal? letter 'h) 'hotel)
        ((equal? letter 'i) 'india)
        ((equal? letter 'j) 'juliette)
        ((equal? letter 'k) 'kilo)
        ((equal? letter 'l) 'lima)
        ((equal? letter 'm) 'mike)
        ((equal? letter 'n) 'november)
        ((equal? letter 'o) 'oscar)
        ((equal? letter 'p) 'papa)
        ((equal? letter 'q) 'quebec)
        ((equal? letter 'r) 'romeo)
        ((equal? letter 's) 'siera)
        ((equal? letter 't) 'tango)
        ((equal? letter 'u) 'uniform)
        ((equal? letter 'v) 'victor)
        ((equal? letter 'w) 'whiskey)
        ((equal? letter 'x) 'xray)
        ((equal? letter 'y) 'yankee)
        ((equal? letter 'z) 'zulu)
        (else 'huh?)))

(define (nato-letters word)
  (se (every nato-phon word)))

(nato-phon '(abc))
