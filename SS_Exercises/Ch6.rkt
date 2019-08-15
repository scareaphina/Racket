#lang simply-scheme

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
