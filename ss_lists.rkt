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

(define (first sent)
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

; higher-order functions

(define (square n)
  (* n n))

(map square '(9 8 7 6))
(map (lambda (x) (se x x)) '(rocky raccoon))
(every (lambda (x) (se x x)) '(rocky raccoon))
(map car '((john lennon) (paul mccartney) (george harrison) (ringo starr)))
(map even? '(9 8 7 6))
; (map (lambda (x) (word x x)) 'rain)

(filter (lambda (flavor) (member? 'swirl flavor))
        '((rum raisin) (root beer swirl) (rocky road) (fudge swirl)))

(filter word? '((ultra chocolate) ginger lychee (raspberry sherbert)))

(filter (lambda (nums) (= (car nums) (cadr nums)))
        '((2 3) (4 4) (5 6) (7 8) (9 9)))

(reduce * '(4 5 6))
(reduce (lambda (list1 list2) (list (+ (car list1) (car list2))
                                    (+ (cadr list1) (cadr list2))))
        '((1 2) (30 40) (500 600)))

; other primatives for lists

(member 'd '(a b c d e f g))
(member 'h '(a b c d e f g))

(list-ref '(happiness is a warm gun) 3)

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

; functions that take variable numbers of arguments

(define (increasing? number . rest-of-numbers)
  (cond ((null? rest-of-numbers) #t)
        ((> (car rest-of-numbers) number)
         (apply increasing? rest-of-numbers))
        (else #f)))

(trace increasing?)

(increasing? 4 12 82)
(increasing? 12 4 82 107)

(+ 3 4 5)
(apply + '(3 4 5))
