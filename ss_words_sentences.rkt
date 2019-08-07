; words and sentences

(quote square)

(quote (tomorrow never knows))

(quote (things we said today))

'square ; apostrophe is an abbreviation for "quote"

'(old brown shoe)

; selectors

(first 'something)

(first '(eight days a week))

(first 910)

(last 'something)

(butfirst 'something)

(butfirst '(eight days a week))

(butfirst 910)

(butlast 'something)

(butlast '(eight days a week))

(butlast 910)

; can use primitive selectors to define others

(define (second thing)
  (first (butfirst thing)))

(second '(like dreamers do))

(second 'michelle)

; primitive selector item that takes two arguments: a number "n" and a word or sentence

(item 4 '(being for the benefit of mister kite!))

(item 4 'benefit)

(first 'because)

(first '(because))

(butfirst 'because)

(butfirst '(because))

(butfirst 'a)

(butfirst 1024)

; constructors

(word 'ses ' qui 'pe 'da 'lian 'ism)

(word 'now 'here)

(word 35 893)

(sentence 'carry 'that 'weight)

(sentence '(john paul) '(george ringo))

(se '(one plus one) 'makes 2)
