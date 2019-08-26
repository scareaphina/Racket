#lang simply-scheme

; recursion

; solving a big problem by reducing it to a similar, smaller subproblem

(define (game low high)
  (let ((guess (average low high)))
    (cond ((too-low? guess) (game (+ guess 1) high))
          ((too-high? guess) (game low (- guess 1)))
          (else '(I win!)))))

(define (downup1 wd)
  (se wd))

(downup1 'a)

(define (downup2 wd)
  (se wd (first wd) wd))

(downup2 'be)

;(define (downup3 wd)
;  (se wd
;      (bl wd)
;      (first wd)
;      (bl wd)
;      wd))

(define (downup3 wd)
  (se wd (downup2 (bl wd)) wd))

(downup3 'foo)

(define (downup4 wd)
  (se wd (downup3 (bl wd)) wd))

(downup4 'paul)

(define (downup59 wd)
  (se wd (downup58 (bl wd)) wd))

(define (downup2 wd)
  (se wd (downup1 (bl wd)) wd))

;(define (downup wd)                          ;; first version
;  (se wd (downup (bl wd)) wd))

;(downup 'toe)

(define (downup wd)
  (if (= (count wd) 1)
      (se wd)
      (se wd (downup (bl wd)) wd)))

(downup 'toe)

(downup 'banana)

;;;;;;;;;;;;;;;;;;;;;
; pig latin

(define (pigl0 wd)
  (word wd 'ay))

(pigl0 'alabaster)

(define (pigl1 wd)
  (word (word (bf wd) (first wd))
        'ay))

(trace pigl1)

(pigl1 'salami)
(pigl1 'pastrami)

(define (pigl2 wd)
  (pigl1 (word (bf wd) (first wd))))

(trace pigl2)

(pigl2 'trample)

(define (pigl3 wd)
  (pigl2 (word (bf wd) (first wd))))

(trace pigl3)

(pigl3 'chrome)

(define (pigl wd)
  (if (member? (first wd) 'aeiou)
      (word wd 'ay)
      (pigl (word (bf wd) (first wd)))))

(trace pigl)

(pigl 'alphabet)
(pigl 'pillows)
(pigl 'apple)
(pigl 'stair)
(pigl 'thrush)

;;;;;;;;;;;;;;;

(define (explode0 wd)
  '())

(define (explode1 wd)
  (se wd))

(define (explode2 wd)
  (se (first wd) (last wd)))

;(define (explode3 wd)
;  (se (first wd) (first (bf wd)) (last wd)))

; complex enough that we want to use explode2 to help

(define (explode3 wd)
  (se (first wd) (explode2 (bf wd))))

(define (explode4 wd)
  (se (first wd) (explode3 (bf wd))))

; so what's our base case? now that we know the pattern we can write explode2 in terms of 1, and even 1 in terms of 0

(define (explode2 wd)
  (se (first wd) (explode1 (bf wd))))

(define (explode1 wd)
  (se (first wd) (explode0 (bf wd))))

; so now we can write a recursive process that handles one and two letter words so that only zero letter words are special cases

(define (explode wd)
  (if (empty? wd)
      '()
      (se (first wd) (explode (bf wd)))))

(trace explode)

(explode 'cats)

; letter-pairs

(define (letter-pairs0 wd)
  '())

(define (letter-pairs1 wd)
  '())

(define (letter-pairs2 wd)
  (se wd))

(define (letter-pairs3 wd)
  (se (bl wd) (bf wd)))

;(define (letter-pairs4 wd)
;  (se (bl (bl wd))
;      (bl (bf wd))
;      (bf (bf wd))))

;(define (letter-pairs4 wd)
;  (se (bl (bl wd))
;      (letter-pairs3 (bf wd))))

;(define (letter-pairs5 wd)
;  (se (bl (bl wd))
;      (letter-pairs4 (bf wd))))

(define (first-two wd)
  (word (first wd) (first (bf wd))))

(trace first-two)

(first-two 'unicorn)

(define (letter-pairs4 wd)
  (se (first-two wd) (letter-pairs3 (bf wd))))

(define (letter-pairs5 wd)
  (se (first-two wd) (letter-pairs4 (bf wd))))

(trace letter-pairs4)
(trace letter-pairs5)

(letter-pairs4 'cats)
(letter-pairs5 'bagel)

(define (first-two wd)
  (word (first wd) (first (bf wd))))

(define (letter-pairs wd)
  (if (<= (count wd) 1)
      '()
      (se (first-two wd)
          (letter-pairs (bf wd)))))

(trace letter-pairs)

(letter-pairs 'alphabet)
(letter-pairs 'bagel)
(letter-pairs 'elephant)
(letter-pairs '3l3v3n)

;;;;;;;;;;;;;;;;;;;;;

(define (reverse wd)
  (if (= (count wd) 1)
      wd
      (word (last wd)
            (reverse (bl wd)))))

(trace reverse)

(reverse 'miyazaki)
(reverse 'loki)

;;;;;;;;;;;;;;;;;;;;;

; factorial
                    
(define (factorial n)
  (* n (factorial (- n 1))))

(define (factorial n)
  (if (= n 1)
      1
      (* n (factorial (- n 1)))))

(trace factorial)

(factorial 3)
(factorial 843)

; evens

(define (losing-evens sent)
  (if (empty? sent)
      '()
      (se (losing-evens (bl sent))
          (last sent))))

(losing-evens '(i want to hold your hand))

(define (losing-evens sent)
  (if (empty? sent)
      '()
      (se (losing-evens (bl sent))
          (last sent))))

(losing-evens '(i want to hold your hand))

(define (evens1 sent)
  (cond ((empty? sent) '())
        ((odd? (count sent))
         (evens1 (bl sent)))
        (else (se (evens1 (bl sent))
                  (last sent)))))

(evens1 '(i want to hold your hand))

(define (evens sent)
  (if (<= (count sent) 1)
      '()
      (se (first (bf sent))
          (evens (bf (bf sent))))))

(evens '(got to get you into my life))

; simplifying base case

(define (reverse1 wd)
  (if (= (count wd) 1)
      wd
      (word (last wd)
            (reverse1 (bl wd)))))

;(word (last wd)
;      (reverse (bl wd)))

(define (reverse wd)
  (if (empty? wd)
      ""
      (word (last word)
            (reverse (bl word)))))

(reverse 'unicorn)

(define (downup wd)
  (if (= (count wd) 1)
      (se wd)
      (se wd (downup (bl wd)) wd)))

(downup 'a)

(downup 'alphabet)

(define (factorial n)
  (if (= n 1)
      1
      (* n (factorial (- n 1)))))

(define (letter-pairs wd)
  (if (<= (count wd) 1)
      '()
      (se (first-two wd)
          (letter-pairs (bf wd)))))

(define (first-two wd)
  (word (first wd) (first (bf wd))))

(first-two 'a)

; tracing

(define (double wd)
  (word wd wd))

(trace double)
(double 'frozen)

(double (double (double 'yum)))

(untrace double)

(define (downup wd)
  (if (= ( count wd) 1)
      (se wd)
      (se wd (downup (bl wd)) wd)))

(trace downup)

(downup 'trace)

(untrace downup)

(define (fib n)
  (if (<= n 2)
      1
      (+ (fib (- n 1))
         (fib (- n 2)))))

(trace fib)

(fib 4)

; common patterns in recursive procedures

; the every pattern

(define (square x)
  (* x x))

(define (square-sent sent)
  (if (empty? sent)
      '()
      (se (square (first sent))
          (square-sent (bf sent)))))

;;;;;;;;;;;;;;;

(define (pigl wd)
  (if (member? (first wd) 'aeiou)
      (word wd 'ay)
      (pigl (word (bf wd) (first wd)))))

(define (pigl-sent sent)
  (if (empty? sent)
      '()
      (se (pigl (first sent))
          (pigl-sent (bf sent)))))

;;;;;;;;;;;;;;;

(define (letter-pairs wd)
  (if (= (count wd) 1)
      '()
      (se (word (first wd) (first (bf wd)))
          (letter-pairs (bf wd)))))

(letter-pairs 'tripoli)

(define (disjoint-pairs wd)
  (cond ((empty? wd) '())
        ((= (count wd) 1) (se wd))
        (else (se (word (first wd) (first (bf wd)))
                  (disjoint-pairs (bf (bf wd)))))))

(disjoint-pairs 'tripoli)

; the keep pattern

(define (keep-three-letter-words sent)
  (cond ((empty? sent) '())
        ((= (count (first sent)) 3)
         (se (first sent) (keep-three-letter-words (bf sent))))
        (else (keep-three-letter-words (bf sent)))))

(keep-three-letter-words '(one two three four five six seven eight nine))

(define (vowel? letter)
  (member? letter 'aeiou))

(define (keep-vowels wd)
  (cond ((empty? wd) "")
        ((vowel? (first wd))
         (word (first wd) (keep-vowels (bf wd))))
        (else (keep-vowels (bf wd)))))

(keep-vowels 'napoleon)

;;;;;;;;;;;;;;;;;;;

(define (doubles wd)
  (cond ((= (count wd) 1) "")
        ((equal? (first wd) (first (bf wd)))
         (word (first wd) (first (bf wd)) (doubles (bf (bf wd)))))
        (else (doubles (bf wd)))))

(trace doubles)

(doubles 'bookkeeper)

(doubles 'mississippi)

(define (addup nums)
  (if (empty? nums)
      0
      (+ (first nums) (addup (bf nums)))))

(define (scrunch-words sent)
  (if (empty? sent)
      ""
      (word (first sent) (scrunch-words (bf sent)))))

(trace addup)
(trace scrunch-words)

(addup '(8 3 6 1 10))
(scrunch-words '(ack now ledge able))

>(addup '(8 3 6 1 10))
> (addup '(3 6 1 10))
> >(addup '(6 1 10))
> > (addup '(1 10))
> > >(addup '(10))
> > > (addup '())
< < < 0
< < <10
< < 11
< <17
< 20
<28
28
>(scrunch-words '(ack now ledge able))
> (scrunch-words '(now ledge able))
> >(scrunch-words '(ledge able))
> > (scrunch-words '(able))
> > >(scrunch-words '())
< < <""
< < 'able
< <'ledgeable
< 'nowledgeable
<'acknowledgeable
'acknowledgeable

(define (sent-max sent)
  (if (= (count sent) 1)
      (first sent)
      (max (first sent)
           (sent-max (bf sent)))))

; combining patterns

(define (add-numbers sent)
  (cond ((empty? sent) 0)
        ((number? (first sent))
         (+ (first sent) (add-numbers (bf sent))))
        (else (add-numbers (bf sent)))))

(trace add-numbers)

(add-numbers '(if 6 were 9))

(untrace add-numbers)

;;;;;;;;;;;;;;;;;

(define (vowel? letter)
  (member? letter 'aeiou))

(define (pigl wd)
  (if (member? (first wd) 'aeiou)
      (word wd 'ay)
      (pigl (word (bf wd) (first wd)))))

(define (keep-vowels wd)
  (cond ((empty? wd) "")
        ((vowel? (first wd))
         (word (first wd) (keep-vowels (bf wd))))
        (else (keep-vowels (bf wd)))))

(define (safe-pigl sent)
  (cond ((empty? sent) '())
        ((has-vowel? (first sent))
         (se (pigl (first sent)) (safe-pigl (bf sent))))
        (else (safe-pigl (bf sent)))))

(define (has-vowel? wd)
  (not (empty? (keep-vowels wd))))

(trace safe-pigl)

(safe-pigl '(my pet fly is named xyzzy))

; helper procedures

(define (every-nth n sent)
  (every-nth-helper n n sent))

(define (every-nth-helper interval remaining sent)
  (cond ((empty? sent) '())
        ((= remaining 1)
         (se (first sent)
             (every-nth-helper interval interval (bf sent))))
        (else (every-nth-helper interval (- remaining 1) (bf sent)))))

(trace every-nth-helper)

(every-nth 3 '(with a little help from my friends))

; how to use recursive patterns

(define (every-something sent)
  (if (empty? sent)
      '()
      (se (________ (first sent))
          (every-something (bf sent)))))

(define (keep-if-something sent)
  (cond ((empty? sent) '())
        ((_______? (first sent))
         (se (first sent) (keep-if-something (bf sent))))
        (else (keep-if-something (bf sent)))))

(define (accumulate-somehow sent)
  (if (empty? sent)
      ______
      (______ (first sent)
              (accumulate-somehow (bf sent)))))

(define (first-number sent)
  (cond ((empty? sent) 'no-number)
	((number? (first sent)) (first sent))
        (else (first-number (bf sent))))

; problems that don't follow patterns

(define (sent-before? sent1 sent2)
  (cond ((empty? sent1) #t)
        ((empty? sent2) #f)
        ((before? (first sent1) (first sent2)) #t)
        ((before? (first sent2) (first sent1)) #f)
        (else (sent-before? (bf sent1) (bf sent2)))))

(trace sent-before?)

(sent-before? '(hold me tight) '(sun king))

(sent-before? '(lovely rita) '(love you to))

(sent-before? '(strawberry fields forever)
              '(strawberry fields usually))

; advanced recursion

; sort

(define (sort sent)
  (if (empty? sent)
      '()
      (se (earliest-word sent)
          (sort (remove-once (earliest-word sent) sent)))))

(define (earliest-word sent)
  (earliest-helper (first sent) (bf sent)))

(define (earliest-helper so-far rest)
  (cond ((empty? rest) so-far)
        ((before? so-far (first rest))
         (earliest-helper so-far (bf rest)))
        (else (earliest-helper (first rest) (bf rest)))))

(define (remove-once wd sent)
  (cond ((empty? sent) '())
	((equal? wd (first sent)) (bf sent))
	(else (se (first sent) (remove-once wd (bf sent))))))

(trace sort)
(trace earliest-helper)

(sort '(i wanna be your man))

(before? 'starr 'best)

; from-binary

(define (from-binary bits)
  (if (empty? bits)
      0
      (+ (* (first bits) (expt 2 (count (bf bits))))
         (from-binary (bf bits)))))

(trace from-binary)

(from-binary 1101)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; advanced recursion
