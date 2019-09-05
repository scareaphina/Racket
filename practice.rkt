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
