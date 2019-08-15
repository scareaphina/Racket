#lang simply-scheme

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
