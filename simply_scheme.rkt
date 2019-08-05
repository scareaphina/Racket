; lambda

(define (add-three number)
  (+ number 3))

(define (add-three-to-each sent)
  (every add-three sent))

(add-three-to-each (1992))

;use lambda to generate a procedure that does those things for us

(define (add-three-to-each sent)
  (every (lambda (number) (+ number 3)) sent))

(add-three-to-each (1 9 9 2))

((lambda (a b) (+ (* 2 a) b)) 5 6)

((lambda (wd) (word (last wd) (first wd))) 'impish)
