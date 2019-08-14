#lang simply-scheme

; 3.1

(* (+ 3 4) 5)

(+ 3 (* 4 5))

; 4.4

(define (square x)
  (* x x))

(define (cube x)
  (* x (square x)))

(define (sphere-volume r)
  (* (/ 4 3) 3.141592654)
  (cube r))

(define (next x)
  (+ x 1))

(define (triangle-area base height)
  (* 0.5 base height))

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

;;;;;;;

; second attempt

; 4.5

(define (cel-fahr fahr)
  (* (/ 5 9) (- fahr 32)))

; C=5⁄9(F-32)

(define (fahr-cel cel)
  (* (/ 5 9) (+ cel 32)))

; F=9⁄5C+32

; 4.6

(define (square x)
  (* x x))

(define (forth x)
  (* (* x x) (*x x)))

(define (forth x)
  (* (square x) (square x)))

;;;;;;;;;;;;;;;;
; second attempt

(define (forth x)
  (* (* x x) (* x x)))

(forth 3)

(define (square n)
  (* n n))

(define (forth2 n)
  (* (square n) (square n)))

(forth2 3)

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

; 9.4

(define (who sent)
  (every (lambda (wd)
           (se wd sent)) '(pete roger john keith)))

(who '(sells out))

'(pete sells out roger sells out john sells out keith sells out)

; 9.5

(define (prepend-every ltr wd)
  (every (lambda (wd) (word ltr wd)) wd))

(prepend-every 's '(he aid he aid))

(prepend-every 'anti '(dote pasto gone body))

; 11.2

(define (count-ums0 sent)
  0)

(define (count-ums1 sent)
  (if (equal? 'um (first sent))
      1
      0))

(define (count-ums2 sent)
  (if (equal? 'um (first sent))
      (+ 1 (count-ums1 (bf sent)))
      (count-ums1 (bf sent))))

(define (count-ums3 sent)
  (if (equal? 'um (first sent))
      (+ 1 (count-ums2 (bf sent)))
      (count-ums2 (bf sent))))

(define (count-ums sent)
  (if (< (count sent) 1)
      0
      (if (equal? 'um (first sent))
          (+ 1 (count-ums (bf sent))
             (count-ums (bf sent))))))

(count-ums3 '(what if we um do um this))

; 11.5

(define (initials sent)
  (every first sent))

(initials '(if i needed someone))

(initials '(find me somebody to love))

; 11.6

(define (countdown number)
  (if (= number 0)
      'BLASTOFF!
      (cons number (countdown (- number 1)))))

(countdown 15)

(countdown 5)

; 12.2

(define (acronym sent) 
  (if (= (count sent) 1)
      (first (first sent))
      (word (first (first sent))
	    (acronym (bf sent)))))

(acronym '(bananas are good))
(acronym '(a))

; 12.5

(define (double n)
  (* n 2))

(define (exag-help wd)
  (if (number? wd)
      (double wd)
      (cond ((equal? wd 'good) 'great)
            ((equal? wd 'bad) 'terrible)
            ((equal? wd 'sad) 'miserable)
            ((equal? wd 'okay) 'boring)
            ((equal? wd 'pretty) 'beautiful)
            ((equal? wd 'tasty) 'delicious)
            ((equal? wd 'sick) 'dying)
            (else wd))))                    

(define (exaggerate sent)
  (if (empty? sent)
      '()
      (se
       (exag-help (first sent))
       (exaggerate (bf sent)))))

(exaggerate '(i had a good time))
(exaggerate '(i ate 3 slices of cake))
(exaggerate '(i feel sad today))
(exaggerate '(i am sick))

; 12.7

;; if i use their helper, it breaks when there's an unexpected entry.

(define (spell-digit digit)
  (item (+ 1 digit)
	'(zero one two three four five six seven eight nine)))

(define (spell-number sent)
  (if (empty? sent)
      '()
      (se
       (spell-digit (first sent))
       (spell-number (bf sent)))))

(spell-number 1981)
(spell-number 18460)
(spell-number 'apple) ; +: contract violation expected: number? given: 'a argument position: 2nd other arguments...:

;;;;

; my way gets me a result with non-numbers

(define (number-words num)
  (if (empty? num)
      '()
      (cond ((equal? num 0) 'zero)
            ((equal? num 1) 'one)
            ((equal? num 2) 'two)
            ((equal? num 3) 'three)
            ((equal? num 4) 'four)
            ((equal? num 5) 'five)
            ((equal? num 6) 'six)
            ((equal? num 7) 'seven)
            ((equal? num 8) 'eight)
            ((equal? num 9) 'nine)
            (else '(huh?)))))

(define (spell-number sent)
  (if (empty? sent)
      '()
      (se
       (number-words (first sent))
       (spell-number (bf sent)))))

(spell-number 1981)
(spell-number 18460)
(spell-number 'apple)
