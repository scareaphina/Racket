#lang simply-scheme

; 11.1

(define (downup1 wd)
  (se wd))

(define (downup2 wd)
  (se wd (first wd) wd))

(define (downup3 wd)
  (se wd (downup2 (bl wd)) wd))

(define (downup4 wd)
  (se wd (downup3 (bl wd)) wd))

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
          (+ 1 (count-ums (bf sent)))
          (count-ums (bf sent)))))

(trace count-ums)

(count-ums '(today um we are going to um talk about the combining um method))
(count-ums3 '(what if we um do um this))
(count-ums '(lets um do this thing um right now))

; 11.3

(define (unspell-letter letter)
  (cond ((member? letter 'abc) 2)
        ((member? letter 'def) 3)
        ((member? letter 'ghi) 4)
        ((member? letter 'jkl) 5)
        ((member? letter 'mno) 6)
        ((member? letter 'prs) 7)
        ((member? letter 'tuv) 8)
        ((member? letter 'wxy) 9)
        (else 0)))

(define (phone-unspell1 wd)
  (unspell-letter wd))

(define (phone-unspell2 wd)
  (word (unspell-letter (first wd))
        (unspell-letter (first (bf wd)))))

(define (phone-unspell sent)
  (if (empty? sent)
      '()
      (se (unspell-letter (first sent))
          (phone-unspell (bf sent)))))

(trace phone-unspell)

(phone-unspell 'catbutt)
(phone-unspell 'unicorn)

; 11.5

(define (initials sent)
  (se (every first sent)))

(trace initials)

(initials '(if i needed someone))
(initials '(are you gonna be my girl))

; 11.6

(define (countdown number)
  (if (= number 0)
      'blastoff!
      (cons number (countdown (- number 1)))))

(trace countdown)

(countdown 10)
(countdown 30)
