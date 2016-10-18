#lang racket

;;;;;;;;;;
;;; Day 3 in class work

;;;;;;;;;;
;; 0.  Implement factorial both recursively and tail recursively.
;;     Hint:  The tail recursive version will use a helper function.

(define (factorial x)
	(if (> x 0)
		(if (< x 2)
			1
			(* x (factorial (- x 1))))
		(display "Must be greater than 0")))

(define (tail-factorial product n)
	(if (< n 2)
		product
		(tail-factorial (* n product) (- n 1) )))

;(factorial 6)
;(tail-factorial 1 2)

;;;;;;;;;;;
;; 1.  Filter is built in to scheme.

;; (filter even? '(1 2 3 4 5 6))  --> '(2 4 6)  ;; using the built-in even?
;; (filter teen? '(21 17 2 13 4 42 2 16 3)) --> '(17 13 16)
                        ;; assuming (define (teen x) (and (<= 13 x) (<= x 19)))))
;; (filter list? '(3 (3 2 1) symbol (4 2) (1 (2) 3)) --> '((3 2 1) (4 2) (1 (2) 3))

;; Implement it anyway.  You might want to call it my-filter?  What arguments does it take?

(define (my-filter tst lst)
	(if (null? lst)
		lst
		(if (tst (first lst))
			(cons (first lst) (my-filter tst (rest lst)))
			(my-filter tst (rest lst)))))

;(my-filter even? '(2 3 5))

;;;;;;;;;;;
;; 2.  Map is also built in to scheme.

;; (map double '(1 2 3))  --> '(4 5 6)  ;; assuming (define (double x) (* 2 x))
;; (map incr '(1 2 3)) --> '(2 3 4)     ;; assuming (define (incr x) (+ x 1))
;; (map last '((3 2 1) (4 2) (1 2 3)) --> '(1 2 3)
                                        ;; assuming (define (last lst)
                                        ;;            (if (null? (rest lst))
                                        ;;                (first lst)
                                        ;;                (last (rest lst))))

;; Implement it as well.  You might want to call it my-map.  What arguments does it take?

(define (double x) 
	(* 2 x))

(define (my-map fil lst)
	(if (null? lst)
		lst
		(cons (fil (first lst)) (my-map fil (rest lst)))))

;(my-map double '(2 3 5))

;;;;;;;;;;;
;; 3.  While we're reimplementing built-ins, implement my-append (just like built in append)
;;     It takes two lists and returns a list containing all of the elements of the originals, in order.
;;     Note that it is purely functional, i.e., it doesn't MODIFY either of the lists that it is passed.

;; (append '(1 2 3) '(4 5 6)) --> '(1 2 3 4 5 6)

;; You might want to draw out the box and pointer structures for the original two lists
;; as well as for the new list.  Confirm with a member of the instructional staff....

#| FIXME
(define (my-append a b lst)
	(if (null? a)
		lst
		;(my-append (rest a) b (cons lst (first a)))))

;(my-append '(1 2 3) '(4 5 6) '()) ; --> '(1 2 3 4 5 6)
|#

;;;;;;;;;;;
;; 4.  zip takes two lists, and returns a list of elements of size two, until one of the lists runs out.

;; (zip '(1 2 3) '(a b c d e f g)) ;; --> '((1 a) (2 b) (3 c))
;; (zip '(1 2 3) '(4 5 6)) ;; --> '((1 4) (2 5) (3 6))


;; Implement `zip`.

#|
(define (zip a b lst)
	;;(if (or ( = (length a) (length lst)) (= (length b) (length lst)))
	(if (or (null? a) (null? b))
		lst
		(zip (rest a) (rest b) (cons (first a) (first b) lst))))
|#

;;;;;;;;;;;;
;; 5.  Last built-in (for now):  (my-)reverse.
;;     Takes a list, returns a new list with the elements reversed.

;; (reverse '(1 2 3)) --> '(3 2 1)



;;;;;;;;;;;;
;; More puzzles:
;;
;;  - (count elt lst) returns the number of times that elt appears in lst
;;  - (remove-dups lst) returns a new list that contains the elements of lst but without repeats
;;       (remove-dups '(1 2 3 1 4 5 2 4 6)) --> '(1 2 3 4 5 6)
;;  - reverse reverses a list, but doesn't reverse sublists in a tree.  (Try it and see.)
;;    Write deep-reverse, which reverses all sublists as well.
;;  - Which of these can you implement using tail recursion?
