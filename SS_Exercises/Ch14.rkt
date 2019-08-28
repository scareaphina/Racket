#lang simply-scheme

; 14.1

(define (remove-once wd sent)
  (cond ((empty? sent) '())
        ((equal? (first sent) wd) (bf sent))
        (else (se (first sent) (remove-once wd (bf sent))))))

(trace remove-once)

(remove-once 'morning '(good morning good morning))
(remove-once 'oh '(oh bla di oh bla dah))

;;;;

(define (remove-once wd sent)
  (cond ((empty? sent)'())
        ((equal? (first sent) wd) (bf sent))
        (else (se (first sent) (remove-once wd (bf sent))))))

(trace remove-once)

(remove-once 'morning '(good morning good morning))

; 14.2

(define (up word)
  (if (= (count word) 1)
      word
      (se (up (bl word)) word)))

(trace up)

(up 'town)
(up 'banana)

;;;;

(define (up wd)
  (if (= (count wd) 1)
      (se wd)
      (se (up (bl wd)) wd)))

(trace up)

(up 'town)
(up 'unicorn)

; 14.3

(define (remdup sent)
  (cond ((empty? sent) sent)
        ((member? (first sent) (bf sent))
         (remdup (bf sent)))
        (else (se (first sent) (remdup (bf sent))))))

(trace remdup)

(remdup '(ob la di ob la da))

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

;;;;

(define (odds sent)
  (cond ((empty? sent) '())
        ((odd? (count sent))
         (se (first sent) (odds (bf sent))))
        (else (odds (bf sent)))))

(trace odds)

(odds '(i lost my little girl))

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

;;;;

(define (letter-count sent)
  (if (empty? sent)
      0
      (+ (count (first sent))
         (letter-count (bf sent)))))

(trace letter-count)

(letter-count '(this is a test))
(letter-count '(this is real and you are completely unprepared))

; 14.6

(define (member? wd sent)
  (cond ((empty? sent) #f)
        ((equal? wd (first sent)) #t)
        (else (member? wd (bf sent)))))

(trace member?)

(member? 'real '(this is real and you are completely unprepared))
(member? 'woman '(y the last man))

; 14.7

(define (differences sent)
  (if (<= (count sent) 1)
      '()
      (let ((f (first sent))
            (s (bf sent)))
        (se (- (first s) f) (differences s)))))

(trace differences)

(differences '(4 23 9 87 6 12))

;;;;;

(define (differences sent)
  (if (<= (count sent) 1)
      '()
      (let ((o (first sent))
            (t (bf sent)))
        (se (- (first t) o) (differences t)))))

(trace differences)

(differences '(4 23 9 87 6 12))

; 14.8

(define (double-wd times word)
  (if (= times 0)
      '()
      (se word (double-wd (- times 1) word))))

(define (expand sent)
  (if (empty? sent)
      sent
      (let ((f (first sent))
            (rest (bf sent)))
        (if (and (number? f)
                 (> (count sent) 1))
            (se (double-wd f (first rest))
                (expand (bf rest)))
            (se f (expand rest))))))

(trace expand)

(expand '(4 calling birds 3 french hens))
(expand '(the 7 samurai))

;;;;

(define (double-wd times word)
  (if (= times 0)
      '()
      (se word (double-wd (- times 1) word))))

(define (expand sent)
  (if (empty? sent)
      sent
      (let ((f (first sent))
            (rest (bf sent)))
        (if (and (number? f)
                 (> (count sent) 1))
            (se (double-wd f (first rest))
                (expand (bf rest)))
            (se f (expand rest))))))

(trace expand)

(expand '(4 calling birds 3 french hens))
(expand '(the seven samurai))
(expand '(the 7 samurai))

; 14.9

(define (helper x word sent)
  (if (empty? sent)
      '(requested word not found)
      (if (equal? word (first sent))
          x
          (helper (+ x 1) word (bf sent)))))

(define (location word sent)
  (helper 1 word sent))

(trace location)

(location 'me '(you never give me your money))
(location 'you '(this is real and you are completely unprepared))
(location 'bad '(good omens))
