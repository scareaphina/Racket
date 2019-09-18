https://people.eecs.berkeley.edu/~bh/ssch10/ttt.html

; tic tac toe

; we number the squares of the board this way:

; 1 - 2 - 3
; 4 - 5 - 6
; 7 - 8 - 9

; (ttt '__o_xox_x 'o)
; Here is a sample game:

; > (ttt '____x____ 'o)                   ; Human goes first in square 5
; 1                                       ; Computer moves in square 1
; > (ttt 'o__xx____ 'o)                   ; Human moves in square 4
; 6                                       ; Computer blocks in square 6
; > (ttt 'o_xxxo___ 'o)                   ; Human moves in square 3
; 7                                       ; Computer blocks again
; > (ttt 'o_xxxoox_ 'o)
; 2

; defining set of choices in terms of a large cond expression

;(define (ttt position me)
;  (cond ((i-can-win?)
;         (choose-winning-move))
;        ((opponent-can-win?)
;         (block-opponent-win))
;        ((i-can-win-next-time?)
;         (prepare-win))
;        (else (whatever))))



; the first step: triples

; (1xo 4x6 o89 14o xx8 o69 1x9 oxo)
; tells us everything we need to know about a board that looks like this:

; 1 x o
; 4 x 6
; o 8 9

; we can see the info in the diagram above, the sentence proceeding it, and also in this word:

;_xo_x_o__

; data can be displayed in multiple ways and the challenge is in finding what makes creating the program easiest



; finding the triples

; our program will start with this sentence of all the winning combinations:

; (123 456 789 147 258 369 159 357)

; and a position word such as _xo_x_o__ that will return a sentence of triples:

; (1xo 4x6 o89 14o xx8 o69 1x9 oxo)

; all that is necessary is to replace some of the numbers with xs and os

(define (find-triples position)
  (every substitute-triple '(123 456 789 147 258 369 159 357)))

;(define (substitute-triple combination)
;  (every (substitute-letter combination)))

; but we want to return a word, so:

(define (substitute-triple combination)
  (accumulate word (every substitute-letter combination)))

(define (substitute-letter square)
  (if (equal? '_ (item square position))
      square
      (item square position)))

; at this point, position is unbound, so we'll have to solve that



; using every with two-argument procedures

; we need to give substitute-letter access to position, so we bind it to the substitute-letter function thus:

(define (substitute-letter square position)
  (if (equal? '_ (item square position))
      square
      (item square position)))

(substitute-letter 5 '_xo_x_o__)
(substitute-letter 8 '_xo_x_o__)

; so now we have to modify substitute-triple to invoke substitute-letter with two arguments

; lambda to the rescue! this lambda takes a square as its argument and returns the contents of the position at that square

; (lambda (square) (substitute-letter square position))

; final version of subsitute-triple

(define (substitute-triple combination position)
  (accumulate word
              (every (lambda (square)
                       (substitute-letter square position))
                     combination)))

(substitute-triple 456 '_xo_x_o__)
(substitute-triple 147 '_xo_x_o__)
(substitute-triple 357 '_xo_x_o__)

(define (find-triples position)
  (every (lambda (comb) (substitute-triple comb position))
         '(123 456 789 147 258 369 159 357)))

(find-triples '_xo_x_o__)
(find-triples 'x_____oxo)

; so we've written these three procedures:

; Substitute-letter  	finds the letter in a single square.
; Substitute-triple	finds all three leters corresponding to three squares.
; Find-triples	        finds all the letters in all eight winning combinations.

(define (ttt position me)
  (ttt-choose (find-triples position) me))

(define (ttt-choose triples me)
  (cond ((i-can-win? triples me)
         (choose-winning-move triples me))
        ((opponent-can-win? triples me)
         (block-opponent-win triples me))
        ...))



; can the computer win on this move?

; so we need a function that takes a word and a letter as arguments and counts how many times the letter appears in the word. for this we can use appearances.

(appearances 'o 'oo7)
(appearances 'x 'oo7)

(define (my-pair? triple me)
  (and (= (appearances me triple) 2)
       (= (appearances (opponent me) triple) 0)))

(define (opponent letter)
  (if (equal? letter 'x) 'o 'x))

(opponent 'x)
(opponent 'o)

(my-pair? 'oo7 'o)
(my-pair? 'xo7 'o)
(my-pair? 'oox 'o)

(define (i-can-win? triples me)
  (not (empty?
        (keep (lambda (triple) (my-pair? triple me))
              triples))))

(i-can-win? '("1xo" "4x6" o89 "14o" xx8 o69 "1x9" oxo) 'x)
(i-can-win? '("1xo" "4x6" o89 "14o" xx8 o69 "1x9" oxo) 'o)



; if so, in which square?

; i can win can return true, but then we have to find the particular square that will win the game for us

;(define (choose-winning-move triples me)
;  (keep number? (first (keep (lambda (triple) (my-pair? triple me))
;                             triples))))

; kludgy solution, where cond accepts a clause containing a single expression instead of the usual two. so we can say the following where each cond invokes a semipredicate

;(define (ttt-choose triples me)
;  (cond ((i-can-win? triples me))
;        ((opponent-can-win triples me))
;        ...))

; then we modify i-can-win? to have desired behavior

(define (i-can-win? triples me)
  (choose-win
   (keep (lambda (triple) (my-pair? triple me))
         triples)))

(define (choose-win winning-triples)
  (if (empty?  winning-triples)
      #f
      (keep number? (first winning-triples))))

(i-can-win? '("1xo" "4x6" o89 "14o" xx8 o69 "1x9" oxo) 'x)
(i-can-win? '("1xo" "4x6" o89 "14o" xx8 o69 "1x9" oxo) 'o)



; second verse, same as the first

; have to deal with the possibility that the computer can't win on this move, but can win unless we block a triple

(define (opponent-can-win? triples me)
  (i-can-win? triples (opponent me)))

(opponent-can-win? '("1xo" "4x6" o89 "14o" xx8 o69 "1x9" oxo) 'x)
(opponent-can-win? '("1xo" "4x6" o89 "14o" xx8 o69 "1x9" oxo) 'o)



; now the strategy gets complicated

; if we assume pivots as a function we can write in a moment, writing a function that returns two possible winning moves is straightforward

(define (i-can-fork? triples me)
  (first-if-any (pivots triples me)))

(define (first-if-any sent)
  (if (empty? sent)
      #f
      (first sent)))



; finding the pivots

; pivots should return a sentence containing the pivot numbers. start with the triples

; (xo3 4x6 78o x47 ox8 36o xxo 3x7)

; keep the ones that have an x and two numbers

; (4x6 x47 3x7)

; mash those into one word

;4x6x473x7

; sort the digits into nine 'buckets,' one for each digit

; ("" "" 3 44 "" 5 77 "" "")

; we can see here that four and seven are the pivot squares, so we write procedures that carry out this plan. it has to find all the triples with one computer-owned square and two free squares, then extract the square numbers that appear in more than one triple

; repeated-numbers takes a sentence of triples as its argument and returns a sentence of all the numbers that appear in more than one triple

(define (repeated-numbers sent)
  (every first
         (keep (lambda (wd) (>= (count wd) 2))
               (sort-digits (accumulate word sent)))))

(define (pivots triples me)
  (repeated-numbers (keep (lambda (triple) (my-single? triple me))
                          triples)))

(define (my-single? triple me)
  (and (= (appearances me triple) 1)
       (= (appearances (opponent me) triple) 0)))

; my-single? is just like my-pair? except that it looks for one apeparance of the letter isntead of two

(my-single? "4x6" 'x)
(my-single? 'xo3 'x)
(keep (lambda (triple) (my-single? triple 'x))
      (find-triples 'xo__x___o))

; we use accumulate word to make the triples into one long word, then look for the digits that appear more than once

(accumulate word '("4x6" x47 "3x7"))

; so now we find all the copies of a particular digit

(define (extract-digit desired-digit wd)
  (keep (lambda (wd-digit) (equal? wd-digit desired-digit)) wd))

(extract-digit 7 "4x6x473x7")
(extract-digit 2 "4x6x473x7")

; now we want a sentence where the first word is all the 1s, the second word all the 2s, etc.

(define (sort-digits number-word)
  (every (lambda (digit) (extract-digit digit number-word))
         '(1 2 3 4 5 6 7 8 9)))

; sort-digit takes a word full of numbers and returns a sentence whose first word is all the ones, second is all the twos, etc.

(sort-digits 123456789147258369159357)
(sort-digits "4x6x473x7")

; looking at repeated-numbers again

(define (repeated-numbers sent)
  (every first
         (keep (lambda (wd) (>= (count wd) 2))
               (sort-digits (accumulate word sent)))))

(repeated-numbers '("4x6" x47 "3x7"))
(keep (lambda (wd) (>= (count wd) 2))
      '("" "" 3 44 "" 6 77 "" ""))
(every first '(44 77))




; taking the offensive

; the final version of ttt-chose with all clauses shown

(define (ttt-chose triples me)
  (cond ((i-can-win? triples me))
        ((opponent-can-win? triples me))
        ((i-can-fork? triples me))
        ((i-can-advance? triples me))
        (else (best-free-square triples))))

(define (opponent-can-fork? triples me)
  (i-can-fork? triples (opponent me)))

(define (i-can-advance? triples me)
  (best-move (keep (lambda (triple) (my-single? triple me)) triples)
             triples
             me))

(define (best-move my-triples all-triples me)
  (if (empty? my-triples)
      #f
      (best-square (first my-triples) all-triples me)))

; best-move doe sthe same job as first-if-any, except it also invokes best-square on the first triple if there is one

(define (best-square my-triple triples me)
  (best-square-helper (pivots triples (opponent me))
                      (keep-number? my-triple)))

(define (best-square-helper opponent-pivots pair)
  (if (member? (first pair) opponent-pivots)
      (first pair)
      (last pair)))

(best-square "78o" (find-triples 'xo__x___o) 'o)
(best-square "36o" (find-triples 'xo__x___o) 'o)
(best-move '("78o" "36o") (find-triples 'xo__x___o) 'o)
(i-can-advance? (find-triples 'xo__x___o) 'o)




; leftovers

; if all else fails, just pick a square. some are better than others! pick the center if it's free, then corner, then edge

(define (best-free-square triples)
  (first-choice (accumulate word triples)
                '(5 1 3 7 9 2 4 6 8)))

(define (first-choice possibilities preferences)
  (first (keep (lambda (square) (member? square possibilities))
               preferences)))

(first-choice 123456789147258369159357 '(5 1 3 7 9 2 4 6 8))
(first-choice "1xo4x6o8914oxx8o691x9oxo" '(5 1 3 7 9 2 4 6 8))
(best-free-square (find-triples '_________))
(best-free-square (find-triples '____x____))
