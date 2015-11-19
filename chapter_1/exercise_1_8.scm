(define (cube-root-iter guess x)
  (if (good-enough? (improve guess x) guess)
      (improve guess x)
      (cube-root-iter (improve guess x)
                      x)))
(define (good-enough? new-guess old-guess)
  (< (abs (- 1 (/ new-guess old-guess))) 0.001))
(define (improve guess x)
  (/ (+ (/ x (* guess guess)) (* 2 guess)) 3))
(define (cube-root x)
  (cube-root-iter 1.0 x))

(cube-root 8)
(cube-root 27)
(cube-root 1.0e60)
(cube-root 1.0e-30)
