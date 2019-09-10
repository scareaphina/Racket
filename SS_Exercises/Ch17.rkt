; 17.1

(car '(rod chris colin hugh paul))

(cadr '(rod chris colin hugh paul))

(cdr '(rod chris colin hugh paul))

(car '(rod))

(cons '(rod argent) '(chris white))

(append '(rod argent) '(chris white))

(list '(rod argent) '(chris white))

(caadr '((rod argent) (chris white) (colin blunstone) (hugh grundy) (paul atkinson)))

(assoc 'colin '((rod argent) (chris white) (colin blunstone) (hugh grundy) (paul atkinson)))

(assoc 'argent '((rod argent) (chris white) (colin blunstone) (hugh grundy) (paul atkinson)))

; 17.4

(define (mystery lst)
  (mystery-helper lst '()))

(define (mystery-helper lst other)
  (if (null? lst)
      other
      (mystery-helper (cdr lst) (cons (car lst) other))))

(check-equal? (mystery '(1 2 3)) '(3 2 1))
(check-equal? (mystery '(a l p h a b e t)) '(t e b a h p l a))

(mystery '(1 2 3))
(mystery '(a l p h a b e t))

; this function returns the reverse of a list it is given

; 17.5

(define (max2 a b)
  (if (> b a) b a))

(define (max num . sent)
  (if (null? sent)
      num
      (apply max
             (cons (max2 (car sent))
                   (cdr sent)))))
