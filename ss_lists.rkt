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

(list (+ 2 3) 'squash (= 2 2) (list 4 5) remainder 'zucchini)

(cons 'for '(no one))

(cons 'julia '())

(append '(get back) '(the word))

; how list, cons, and append act differently

(list '(i am) '(the walrus))
(cons '(i am) '(the walrus))
(cons 'i '(am the walrus))
(append '(i am) '(the walrus))

; When list is invoked with two arguments, it considers them to be two proposed elements for a new two-element list. List doesn't care whether the arguments are themselves lists, words, or anything else; it just creates a new list whose elements are the arguments.

; Cons requires that its second argument be a list. Cons will extend that list to form a new list, one element longer than the original; the first element of the resulting list comes from the first argument to cons. In other words, when you pass cons two arguments, you get back a list whose car is the first argument to cons and whose cdr is the second argument.

; Append of two arguments uses the elements of both arguments as elements of its return value.
; programming with lists

; programming with lists

(define (praise flavors)
  (if (null? flavors)
      '()
      (cons (se (car flavors) '(is delicious))
            (praise (cdr flavors)))))

(trace praise)

(praise '(ginger (ultra chocolate) lychee (rum raisin)))

(define (translate wd)
  (lookup wd '((window fenetre) (book livre) (computer ordinateur)
	       (house maison) (closed ferme) (pate pate) (liver foie)
	       (faith foi) (weekend (fin de semaine))
	       ((practical joke) attrape) (pal copain))))

(define (lookup wd dictionary)
  (cond ((null? dictionary) '(parlez-vous anglais?))
        ((equal? wd (car (car dictionary)))
         (car (cdr (car dictionary))))
        (else (lookup wd (cdr dictionary)))))

(check-equal? (translate 'fenetre) '(parlez-vous anglais?))
(check-equal? (translate 'closed) 'ferme)

(translate 'computer)
(translate '(practical joke))
(translate 'recursion)

(car (cdr (car dictionary)))

; car of cdr of car
(cadar dictionary)

; cddadr
(cdr (cdr (car (cdr something))))

; don't make the mistake of reading cadr as meaning "first take the car and then the cdr" it means "take the car of the cdr"

; most commonly used is cadr, which takes the second element of a list, caddr, which selects the third element, and cadddr, which selects the forth

; the truth about sentences

; scheme represents lists in a way that makes it easy to find the first element, but harder to find the last one
; no primitive selectors for lists equivilant to last and butlast for sentences

(define (first sent)         ;;; just for sentences
  (car sent))

(define (last sent)
  (if (null? (cdr sent))
      (car sent)
      (last (cdr sent))))

(define (butfirst sent)
  (cdr sent))

(define (butlast sent)
  (if (null? (cdr sent))
      '()
      (cons (car sent) (butlast (cdr sent)))))

; higher order functions

; every = map
; keep = filter
; accumulate = reduce

(define (square n)
  (* n n))

(map square '(9 8 7 6))

(map (lambda (x) (se x x)) '(rocky raccoon))

(every (lambda (x) (se x x)) '(rocky raccoon))

(map car '((john lennon) (paul mccartney) (george harrison) (ringo starr)))

(map even? '(9 8 7 6))

;(map (lambda (x) (word x x)) 'rain)

(filter (lambda (flavor) (member? 'swirl flavor))
        '((rum raisin) (root bear swirl) (rocky road) (fudge swirl)))

(filter word? '((ultra chocolate) ginger lychee (rasphberry sherbert)))

(filter (lambda (nums) (= (car nums) (cadr nums)))
        '((2 3) (4 4) (5 6) (7 8) (9 9)))

(reduce * '(4 5 6))

(reduce (lambda (list1 list2) (list (+ (car list1) (car list2))
                                    (+ (cadr list1) (cadr list2))))
        '((1 2) (30 40) (500 600)))

; other primitives for lists

(member 'd '(a b c d e f g))

(member 'h '(a b c d e f g))

; returns a list starting with the element equal to the first argument
; doesn't have a question mark because it returns values other than #t and #f

(d e f g)
(#f)

(list-ref '(happiness is a warm gun) 3)

; the equivilant of item is list-ref
; the equivilant of count is length and is the same as count except it doesn't work on words

; association lists

(assoc 'george
       '((john lennon) (paul mccartney) (george harrison) (ringo starr)))

(assoc 'x '((i 1) (v 5) (x 10) (l 50) (c 100) (d 500) (m 1000)))

(assoc 'ringo '((mick jagger) (keith richards) (brian jones) (charlie watts) (bill wyman)))

(define dictionary
  '((window fenetre) (book livre) (computer ordinateur)
                     (house maison) (closed ferme) (pate pate) (liver foie)
                     (faith foi) (weekend (fin de semaine))
                     ((practical joke) attrape) (pal copain)))

(define (translate wd)
  (let ((record (assoc wd dictionary)))
    (if record
        (cadr record)
        '(parlez-vous anglais?))))

(check-equal? (translate 'book) 'livre)

; functions that take variable numbers of arguments

; functions that take variable numbers of arguments

(define (increasing? number . rest-of-numbers)
  (cond ((null? rest-of-numbers) #t)
        ((> (car rest-of-numbers) number)
         (apply increasing? rest-of-numbers))
        (else #f)))

(trace increasing?)

(check-equal? (increasing? 4 12 82) #t)
(check-equal? (increasing? 12 4 82 107) #f)

(increasing? 4 12 82)

(increasing? 12 4 82 107)

(+ 3 4 5)
(apply + '(3 4 5))

(increasing? rest-of-numbers) ; doesn't work

; recursion on arbitrary structured lists

; the long way

(define (appearances-in-book wd book)
  (reduce + (map (lambda (chapter) (appearances-in-chapter wd chapter))
		 book)))

(define (appearances-in-chapter wd chapter)
  (reduce + (map (lambda (section) (appearances-in-section wd section))
		 chapter)))

(define (appearances-in-section wd section)
  (reduce + (map (lambda (paragraph)
		   (appearances-in-paragraph wd paragraph))
		 section)))

(define (appearances-in-paragraph wd paragraph)
  (reduce + (map (lambda (sent) (appearances-in-sentence wd sent))
		 paragraph)))

(define (appearances-in-sentence given-word sent)
  (length (filter (lambda (sent-word) (equal? sent-word given-word))
                  sent)))

; the short cut

(define (appearances-in-sentence wd sent)
  (reduce + (map (lambda (wd2) (appearances-in-word wd wd2))
                 sent)))

(define (appearances-in-word wd wd2)
  (if (equal? wd wd2) 1 0))

(define (deep-appearances wd structure)
  (if (word? structure)
      (if (equal? structure wd) 1 0)
      (reduce +
              (map (lambda (sublist) (deep-appearances wd sublist))
                   structure))))

(trace deep-appearances)

(deep-appearances
 'the
 '(((the man) in ((the) moon)) ate (the) potstickers))

(deep-appearances 'the '(the man in the moon ate the potstickers))

(deep-appearances 'mathematicians the-book-structure)

(deep-appearances 'foo '((a) b))

(define (deep-appearances wd structure)
  (cond ((equal? wd structure) 1)
        ((word? structure) 0)
        ((null? structure) 0)
        (else (+ (deep-appearances wd (car structure))
                 (deep-appearances wd (cdr structure))))))

(define (pigl wd)
  (if (member? (first wd) 'aeiou)
      (word wd 'ay)
      (pigl (word (butfirst wd) (first wd)))))

(define (deep-pigl structure)
  (cond ((word? structure) (pigl structure))
        ((null? structure) '())
        (else (cons (deep-pigl (car structure))
                    (deep-pigl (cdr structure))))))

(trace deep-pigl)

(deep-pigl '((this is (a structure of (words)) with) (a (peculiar) shape)))

; Compare deep-pigl with an every-pattern list recursion such as praise. Both look like
; (cons (something (car argument)) (something (cdr argument)))
