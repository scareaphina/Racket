#lang simply-scheme

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

; 12.8

(define (get-number n)
  (if (number? n)
      n
      '()))

(define (numbers sent)
  (if (empty? sent)
      sent
      (se (get-number (first sent))
          (numbers (bf sent)))))

(numbers '(i ate 2 pies 30 days ago))
(numbers '(i plan on visiting 12 countries in 2 years))
(numbers '(i have never seen that before))

; 12.9

(define (real-word? wd)
  (not (member? wd '(a the an in of and for to with))))

(define (get-real-word wd)
  (if (real-word? wd)
      wd
      '()))

(define (real-words sent)
  (if (empty? sent)
      sent
      (se (get-real-word (first sent))
          (real-words (bf sent)))))

(real-words '(if i had a million dollars))
(real-words '(the song love of the loved by the beatles))

; 12.10

(define (remove word sent)
  (if (empty? sent)
      sent
      (se (if (equal? (first sent) word)
              '()
              (first sent))
          (remove word (bf sent)))))

(remove 'the '(the song love of the loved by the beatles))
(remove 'love '(the song love of the loved by the beatles))
