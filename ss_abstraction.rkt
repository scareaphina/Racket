(sentence 'she (word 'run 's))
(sentence 'she (word 'walk 's))
(sentence 'she (word 'program 's))

(define (third-person verb)
  (sentence 'she (word verb 's)))



(define (order flavor)
  (if (member? flavor
               '(vanilla (ultra chocolate) (heath bar crunch) ginger (cherry garcia) strawberry lychee raspberry mocha))
      '(coming right up!)
      (se '(sorry we have no) flavor)))

(trace order)

(order 'vanilla)
