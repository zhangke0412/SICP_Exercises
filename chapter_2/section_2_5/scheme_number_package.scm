(define (install-scheme-number-package)
  (define (tag x) (attach-tag 'scheme-number x))
  (put 'add
       '(scheme-number scheme-number)
       (lambda (x y) (tag (+ x y))))
  (put 'sub
       '(scheme-number scheme-number)
       (lambda (x y) (tag (- x y))))
  (put 'mul
       '(scheme-number scheme-number)
       (lambda (x y) (tag (* x y))))
  (put 'div
       '(scheme-number scheme-number)
       (lambda (x y) (tag (/ x y))))
  (put 'make
       'scheme-number
       (lambda (x) (tag x)))
  ;; exercise 2.79
  (put 'equ?
       '(scheme-number scheme-number)
       =)
  ;; exercise 2.80
  (put '=zero?
       '(scheme-number)
       (lambda (x) (= x 0)))
  ;; for exercise 2.82
  (put 'add
       '(scheme-number scheme-number scheme-number)
       (lambda (x y z) (tag (+ x y z))))
  ;; exercise 2.86
  (put 'sine
       '(scheme-number)
       (lambda (x) (tag (sin x))))
  (put 'cosine
       '(scheme-number)
       (lambda (x) (tag (cos x))))
  (put 'arctan
       '(scheme-number scheme-number)
       (lambda (y x) (tag (atan y x))))
  (put 'square
       '(scheme-number)
       (lambda (x) (tag (* x x))))
  (put 'square-root
       '(scheme-number)
       (lambda (x) (tag (sqrt x))))
  ;; exercise 2.88
  (put 'negation
       '(scheme-number)
       (lambda (x) (tag (- x))))
  'done)

(define (make-scheme-number n)
  ((get 'make 'scheme-number) n))
