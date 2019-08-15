; 9.4

(define (who sent)
  (every (lambda (wd)
           (se wd sent)) '(pete roger john keith)))

(who '(sells out))

'(pete sells out roger sells out john sells out keith sells out)

; 9.5

(define (prepend-every ltr wd)
  (every (lambda (wd) (word ltr wd)) wd))

(prepend-every 's '(he aid he aid))

(prepend-every 'anti '(dote pasto gone body))
