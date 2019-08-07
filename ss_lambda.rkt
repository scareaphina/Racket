(define (add-three number)
  (+ number 3))

(define (add-three-to-each sent)
  (every add-three sent))

(add-three-to-each '(1 9 9 2))

; defining that first function just to use it once is tedious. use lambda!
