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
