#lang simply-scheme

; 14.1

(define (remove-once wd sent)
  (cond ((empty? sent) '())
        ((equal? (first sent) wd) (bf sent))
        (else (se (first sent) (remove-once wd (bf sent))))))

(trace remove-once)

(remove-once 'morning '(good morning good morning))
(remove-once 'oh '(oh bla di oh bla dah))

; 14.2

(define (up word)
  (if (= (count word) 1)
      word
      (se (up (bl word)) word)))

(trace up)

(up 'town)
(up 'banana)

; 14.3

(define (remdup sent)
  (cond ((empty? sent) sent)
        ((member? (first sent) sent)
         (first sent) remdup (bf sent))
        (else (remdup (bf sent)))))

(trace remdup)

(remdup '(ob la di ob la da))
(remdup '(this is how we do this))

; 14.4

(define (odds-def word sent)
  (cond ((empty? sent) sent)
        ((= (remainder word 2) 0) (odds-def (+ word 1) (bf sent)))
        (else (se (first sent) (odds-def (+ word 1) (bf sent))))))

(define (odds sent)
  (odds-def 1 sent))

(trace odds)

(odds '(i lost my little girl))
(odds '(ob la di ob la da))
(odds '(this is how we do this))

; 14.5

;; saving this first attempt because it made me laugh and it was very close to my final answer

(define (letter-count sent)
  (if (empty? sent)
      '()
      (se (count (first sent))
          (letter-count (bf sent)))))

(letter-count '(lucy in the sky with diamonds))

;; actual solution

(define (letter-count sent)
  (if (empty? sent)
      0
      (+ (count (first sent))
         (letter-count (bf sent)))))

(trace letter-count)

(letter-count '(lucy in the sky with diamonds))

; 14.6

(define (member? wd sent)
  (cond ((empty? sent) #f)
        ((equal? wd (first sent)) #t)
        (else (member? wd (bf sent)))))

(trace member?)

(member? 'real '(this is real and you are completely unprepared))
(member? 'woman '(y the last man))
