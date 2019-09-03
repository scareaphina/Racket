#lang simply-scheme

; 12.2

(define (acronym sent) 
  (if (= (count sent) 1)
      (first (first sent))
      (word (first (first sent))
	    (acronym (bf sent)))))

(acronym '(bananas are good))
(acronym '(a))

;;;;;;;;;;;;;;;

(define (acronym sent)
  (if (= (count sent) 0)
      ""
      (word (first (first sent))
	    (acronym (bf sent)))))

(trace acronym)

(acronym '(working on simply scheme))
(acronym '(knocking it out of the park))

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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (double n)
  (* 2 n))

(define (hyperbole sent)
  (if (number? sent)
      (double sent)
      (cond ((equal? sent 'good) 'great)
            ((equal? sent 'bad) 'terrible)
            ((equal? sent 'small) 'tiny)
            ((equal? sent 'sick) 'dying)
            ((equal? sent 'big) 'huge)
            ((equal? sent 'funny) 'hilarious)
            ((equal? sent 'cute) 'adorable)
            ((equal? sent 'pretty) 'transcendant)
            ((equal? sent 'sad) 'tragic)
            ((equal? sent 'hurt) 'broken)
            (else sent))))

(define (exaggerate sent)
  (if (empty? sent)
      '()
      (se (hyperbole (first sent))
          (exaggerate (bf sent)))))

(trace exaggerate)

(exaggerate '(i ate 3 potstickers))
(exaggerate '(the chow fun is great here))
(exaggerate '(i am sick))
(exaggerate '(my cat is so cute))

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
(spell-number 'apple) ; +: contract violation expected: number? given: 'a argument position: 2nd other arguments...

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

;;;;;;

(define (spell-digit digit)
  (item (+ 1 digit)
        '(zero one two three four five six seven eight nine)))

(define (spell-number n)
  (if (empty? n)
      '()
      (se (spell-digit (first n))
          (spell-number (bf n)))))

(trace spell-number)

(spell-number 1990)
(spell-number 1029384756)

;;;;;;;;;

; solved this in 5 minutes this time around

(define (num-help sent)
  (cond ((equal? sent 0) 'zero)
        ((equal? sent 1) 'one)
        ((equal? sent 2) 'two)
        ((equal? sent 3) 'three)
        ((equal? sent 4) 'four)
        ((equal? sent 5) 'five)
        ((equal? sent 6) 'six)
        ((equal? sent 7) 'seven)
        ((equal? sent 8) 'eight)
        ((equal? sent 9) 'nine)
        (else 'huh?)))

(define (spell-number sent)
  (if (empty? sent)
      '()
      (se (num-help (first sent))
          (spell-number (bf sent)))))

(trace spell-number)

(spell-number 1990)

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

;;;;;;;;

(define (find-number sent)
  (if (number? sent)
      sent
      '()))

(define (numbers sent)
  (if (empty? sent)
      '()
      (se (find-number (first sent))
          (numbers (butfirst sent)))))

(trace numbers)

(numbers '(76 trombones and 110 cornets))
(numbers '(i have 2 cats))
(numbers '(i do not have any numbers))

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

;;;;;;;;;;;;

(define (real-word? wd)
  (not (member? wd '(a the an in of and for to with))))

(define (return-real-word wd)
  (if (real-word? wd)
      wd
      '()))

(define (real-words sent)
  (if (empty? sent)
      '()
      (se (return-real-word (first sent))
          (real-words (bf sent)))))

(trace real-words)

(real-words '(it was the best of times it was the worst of times))
(real-words '(the cats have the zooms and it is loud))

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

; 12.11

(define (count sent)
  (if (empty? sent)
      0
      (+ 1 (count (bf sent)))))

(trace count)

(count 'banana)
(count '(i am a test))
