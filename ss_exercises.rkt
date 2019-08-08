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
