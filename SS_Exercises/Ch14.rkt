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
