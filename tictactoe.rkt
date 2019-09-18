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
