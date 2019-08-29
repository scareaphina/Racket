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
