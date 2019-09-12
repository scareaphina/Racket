(require racket/trace)
(require rackunit)

; lists

; (check-equal? (function variable(s)) desired result)

; longer but with detailed show and display

(define (same-arg-twice fn y)
  (show "outer")
  (display "outer y ")
  (show y)
  (lambda (arg)
    (show "inner")
    (display "inner y ")
    (show y)
    (fn arg y))
  )

(show 'preexecute)
(define square (same-arg-twice (lambda (x yi)
                                 (display "innnerest x ")
                                 (show x)
                                 (display "innerest yi ")
                                 (show yi)
                                 (* x yi))
                               7))
(show 'postexecute)
(square 5)
(square 7)
(square 9)

; using trace-define and trace-lambda

(trace-define (same-arg-twice fn y)
  (trace-lambda #:name innner (arg)
    (fn arg y))
  )

(show 'preexecute)
(define square (same-arg-twice (trace-lambda #:name innerest (x yi)
                                 (* x yi))
                               7))
(show 'postexecute)
(square 5)
(square 7)
(square 9)

((trace-define-syntax 'ab (lambda (x y) (* x y))) 5 4)
