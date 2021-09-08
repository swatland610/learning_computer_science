;Exercise 1
; Determine Outcomes for following expressions

10 ;prints 10
(+ 5 3 4) ;prints 12
(- 9 1) ;prints 8
(/ 6 2) ;prints 3
(+ (* 2 4) (- 4 6)) ;prints 6

; definitions
(define a 3) ;prints name 'a', the value of a = 3
(define b (+ a 1)) ;prints name 'b', the value of b = 4

(+ a b (* a b)) ;prints 19
(= a b) ;prints #f (False)

; conditions
(if (and (> b a) (< b (* a b))) ; so if 4 > 3 AND 4 < (3 * 4)
    b ; returns this value of 4
    a) ; under current definitions, this will not run

(cond ((= a 4) 6) ; under current defs, this will not return 6
      ((= b 4) (+ 6 7 a)) ; under current defs, this will not return 16
      (else 25)) ; this will be returned

(+ 2 (if (> b a) b a)) ; so b > a is True, so b (4) is returned, then + 2 that value so, 6 is returned

(* (cond ((> a b) a) ; 'a' will not be returned
         ((< a b) b) ; 'b' will be returned here so (4)
         (else -1)) ; this will not be returned
    (+ a 1)) ; so this resolves to be 4, and we multiply the other 4, so 16 is returned. 


; Exercise 2
; Translate a compound expression in the book
(/ (+ 5 4 
        (- 2 
            (- 3 
                (+ 6
                    (/ 4 5)
                )
            )
        )
    )
    (* 3 
        (- 6 2)
        (- 2 7)
    )
)
; this returns -37/150

; Exercise 3
; I need to define a procedure that 
;   1. takes 3 numbers as args
;   2. returns the sum of squares of the two largest numbers

; first, let me define a square & sumSquare functions
(define (square x) 
    (* x x))

(define (sumSquare x y)
    (+ x y))

; now I'll compile the main function
(define (sumLargestSquare x y z) 
(cond ((and (<= x y) (<= x z)) (sumSquare (square y) (square z)))
      ((and (<= y x) (<= y z)) (sumSquare (square x) (square z))) 
      (else (sumSquare (square x) (square y)))
    )
)

; Exercise 4
; Describe what the following does
(define (a-plus-abs-b a b)
    ((if (> b 0) + -) a b))

    ; Essentially, the body checks if 'b' is greater than 0.
    ; if TRUE, then the expression reduces to the + symbol and adds the two integers together
    ; if FALSE, then the expression reduces to the - symbol. This means that 'b' is negative. So the expression looks like this: 
        ; (- a {-}b) => meaning that it returns the absolute value of 'b' and adds it to a

; Exercise 5
; Determine the outcomes if this procedure is interpreted using applicative-order evals vs normal-order.
(define (p) (p))
(define (test x y)
    (if (= x 0) 0 y))

; What happens if we run?
(test 0 (p))

; Applicative-Order
; Running in Applicative-Orders causes this to never finish running.
; Since Lisp will evaluate all arguments first, the function (p) causes an infinite loop. As it only relates to itself. 

; Normal-Order
; In Normal Order, running the procedure would result in a 0. Since it first evaluates 
; the IF statement, (which results in True). Lisp will not even try to evaluate what (p) is as it's currently an outcome that will not happen.
    
