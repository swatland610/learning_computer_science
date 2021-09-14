; this example in the book really blew my mind. So I just need to write out 
; to better understand it. 

; Formalized process in plain english
; 
; this is Newton's methods of successive approximation. 
; Whenever we have a guess of y for square root of x, we can get a better guess by average y with (x/y)
; 
; Initial Parameters
;   1. Number for the radicand -> Value who's square root we are trying to compute
;   2. Guess -> Value that we use as our initial guess (which some how get's magically updated without a loop)

; It's worth noting that I'm copying the exact procedure from book. Just to better understand. 

; Outer Procedure
(define (sqrt-iter guess x)
    ; this good-enough? procedure checks to see if it's within an acceptable level of the radicand (0.0001)
    (if (good-enough? guess x)
        guess
        (sqrt-iter (improve guess x) x)))

(define (improve guess x)
    (average guess (/ x guess)))

(define (average x y)
    (/ (+ x y) 2)

(define (good-enough? guess x)
    (< (abs(- (square guess) x)) 0.0001)

; Now finally define the usable procedure
(define (sqrt x)
    (sqrt-iter 1.0 x))

; Alright, I see now what's going on. This is possible without looping syntax through recursion.
