; 15.2

(define (implode sent)
  (accumulate word sent))

(define (check-pal wd)
  (if (<= (count wd) 1)
      #t
      (and (equal? (first wd) (last wd))
           (check-pal (bf (bl wd))))))

(define (palindrome? sent)
  (check-pal (implode sent)))

(trace palindrome?)

(palindrome? '(flee to me remote elf))
(palindrome? '(flee to me remote control))

; 15.3

(define (diminish wd)
  (if (empty? wd)
      '()
      (se wd (diminish (bl wd)))))

(define (substrings wd)
  (if (empty? wd)
      (se "")
      (se (diminish wd) (substrings (bf wd)))))

(trace substrings)

(substrings 'mississippi)
(substrings 'brat)
