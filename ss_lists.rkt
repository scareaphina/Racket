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

(trace translate)

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
