#lang racket

;; simple definitions and expressions

(define pie 3) ; defines pie to be 3
(define (piece str) ;defines piece as a function of one argument
  (substring str 0 pie))

pie ; returns 3
(piece "key lime") ; returns "key"

(define (bake flavor)
  (printf "preheating oven...\n")
  (string-append flavor " pie"))

(bake "apple")

(define (nobake flavor)
  (printf "mixing packet...\n")
  (string-append flavor "jello"))

(nobake "green")

;; indentation note - racket lets you know you've left something out by indenting severely when you have forgotten a parenthesis

(define (halfbake flavor
                  (string-append flavor "creme brulee"))

(string-append "rope" "twine" "yarn") ; append strings

(substring "corduroys" 0 4) ; extract a substring

(string-length "shoelace") ; get a string's length

(string? "Ceci n'est pas une string.") ; recognize strings

(string? 1)

(sqrt 16) ; find a square root

(sqrt -16)

(+ 1 2) ; add numbers

(- 2 1) ; subtract numbers

> (< 2 1) ; compare numbers

> (>= 2 1)

(number? "c'est une number") ; recognize numbers

(number? 1)

(equal? 6 "half dozen") ; compare anything

(equal? 6 6)

(equal? "half dozen" "half dozen")


; if expression evaluates the first <expr> and then, if that is not true, evaluates the second and prints the result

(if (< 2 3) 
    "bigger"
    "smaller")

(if (< 34 3)
    "bigger"
    "smaller")

(if (< .2 .52)
    "bigger"
    "smaller")

(define (reply s)
  (if (string? s)
      (if (equal? "hello" (substring s 0 5))
          "hi!"
          "huh?")
      "huh?"))

(reply "hello racket")
(reply "this is a test to see if this won't work")

; same, without repeating "huh?"
(define (reply s)
  (if (if (string? s)
          (equal? "hello" (substring s 0 5))
          #f)
      "hi!"
      "huh?"))

(define (reply s)
  (if (and (string? s)
           (>= (string-length s) 5)
           (equal? "hello" (substring s 0 5)))
      "hi!"
      "huh?"))

(reply "hello racket")
(reply "22")

; nested ifs
(define (reply-more s)
  (if (equal? "hello" (substring s 0 5))
      "hi!"
      (if (equal? "goodbye" (substring s 0 7))
          "bye!"
          (if (equal? "?" (substring s (- (string-length s) 1)))
              "I don't know"
              "huh?"))))
 
; cond

(define (reply-more s)
  (cond
    [(equal? "hello" (substring s 0 5))
     "hi!"]
    [(equal? "goodbye" (substring s 0 7))
     "bye!"]
    [(equal? "?" (substring s (- (string-length s) 1)))
     "I don't know"]
    [else "huh?"]))

(reply-more "hello racket")
(reply-more "goodbye cruel world")
(reply-more "what is your favorite color?")
(reply-more "mine is lime green")

; more function calls

(define (double v)
  ((if (string? v) string-append +) v v))

(double "mnah")
(double 5)

; define and use twice

(define (twice f v)
  (f (f v)))

(twice sqrt 16)

(define (louder s)
  (string-append s "!"))

(twice louder "hello")

; lambda

(define (twice f v)
  (f (f v)))

(lambda (s) (string-append s "!"))

(twice (lambda (s) (string-append s "!"))
       "hello")

(twice (lambda (s) (string-append s "?!"))
       "hello")

(define (make-add-suffix s2)
  (lambda (s) (string-append s s2)))

(twice (make-add-suffix "!") "hello")
(twice (make-add-suffix "?!") "hello")
(twice (make-add-suffix "...") "hello")

; returns #<procedure:...nts/SICP/1.1.rkt:8:0>
; "hello!!"
; "hello?!?!"
; "hello!!"
; "hello?!?!"
; "hello......"

(define louder
  (lambda (s)
    (string-append s "!")))

louder

; returns #<procedure:louder>

; random exercises

(* 2 (+ 4 5))

(= 3 (+ 1 3))

(car '(elmer fudd daffy duck))
(cdr '(elmer fudd daffy duck))

(and (= 1 2) (= 10 (/ 1 0)))

; find the squid!

(define y '(clam squid octopus))

(car (cdr y))

(define z '(clam starfish (squid octopus) mollusk))

(car (caddr z))

(define (average x y)
  (/ (+ x y) 2))

(average 3 5)
(average 150 200)

; design a recursive procedure that adds together all the numbers in a list

(define (sum sent)
  (if (empty? sent)
      0
      (+ (first sent)
         (sum (bf sent)))))

(sum '(1 4 5 6 7 8))
(sum '(1 1 1 1 1 1))
(sum '(1 2 3 4 5 6))

; define a procedure to find the length of a list

(define (mylength sent)
  (if (empty? sent)
      0
      (count sent)))

(mylength '(lucy in the sky with diamonds))
(mylength '(killin it))
(mylength 'bike)
(mylength '(1 5 42 9 129492))

; define a function that returns an integer plus 1

(define (inc n)
  (+ n 1))

; Create the function "mean2" which returns the average of its two numeric arguments.

(define (mean2 x y)
  (/ (+ x y) 2))
  
 ; Create the function "circle-area" that will be given the radius of a circle and will return its area. Use 3.14159 as the value of PI. 
 
 (define (square n)
  (* n n))

(define (circle-area radius)
  (* 3.14159 (square radius)))

; Create the function "max2" which will return the larger of its two numerical arguments, or either of them if they're equal.

(define (max2 a b)
  (cond ((> a b) a)
        ((> b a) b)
        (else a)))

