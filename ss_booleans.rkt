#lang simply-scheme

(define (greet name)
  (if (equal? (first name) 'professor)
      (se '(i hope i am not bothering you) 'professor (last name))
      (se '(good to see you) (first name))))

(greet '(matt wright))

(greet '(professor harold abelson))

(member? 'mick '(dave dee dozy beaky mick and tich))

(member? 'mick '(john paul george ringo))

(member? 'e 'truly)

(member? 'y 'truly)

(= 3 4)

(= 67 67)

(= (+ 52 8) 60)

(> 98 97)

(before? 'zorn 'coleman)

(before? 'pete 'ringo)

(empty? '(abbey road))

(empty? '())

(empty? 'hi)

(empty? (bf (bf 'hi)))

(empty? "")

(number? 'three)

(number? 74)

(boolean? #f)

(boolean? '(the beatles))

(boolean? 234)

(boolean? #t)

(word? 'flying)

(word? '(dig it))

(word? 87)

(sentence? 'wait)

(sentence? '(what goes on))
