; abstraction

(sentence 'she (word 'run 's))
(sentence 'she (word 'walk 's))
(sentence 'she (word 'program 's))

(define (third-person verb)
  (sentence 'she (word verb 's)))

; lists

(define (order flavor)
  (if (member? flavor
               '(vanilla (ultra chocolate) (heath bar crunch) ginger (cherry garcia) strawberry lychee raspberry mocha))
      '(coming right up!)
      (se '(sorry we have no) flavor)))

(trace order)

(order 'vanilla)

; selectors and constructors

(cons 'for '(no one))
(cons 'julia '())

(append '(get back) '(the word))

(list '(i am) '(the walrus))
(cons '(i am) '(the walrus))
(append '(i am) '(the walrus))
