#lang racket

;;; Student Name: Bonnie Ishiguro
;;;
;;; Check one:
;;; [x] I completed this assignment without assistance or external resources.
;;; [ ] I completed this assignment with assistance from ___
;;;     and/or using these external resources: ___

(define (my-assq key alist)
	(if (null? alist)
		#f
		(if (eq? key (first (first alist)))
			(first alist)
			(my-assq key (rest alist)))))

(define (DEFINE? exp)
	(if (list? exp)
			(if (= 3 (length exp))
				(if (symbol? (second exp))
					#t
					#f)
				#f)
			#f))

(define (LAMBDA? exp)
	(if (list? exp)
		(if (= 3 (length exp))
			(if (and (list? (second exp)) (list? (third exp)))
				#t
				#f)
			#f)
		#f))

(define (def name body lst)
	(repl (list (list name (calculate body lst)) lst))) ;; FIXME: can only save one new variable at a time, environment not persisted?

(define (lam params body lst)
	(lambda (params) body))

(define (calculate x lookup-list) ;; built upon my evaluator from hw2.rkt
  (if (symbol? x)
  	(second (my-assq x lookup-list))
	(if (or (boolean? x) (number? x))
	  	x
		(cond 
			;;[(not (list? x)) x] ; return number values, base case for expression arguments
		  	[(eq? (first x) 'ADD) (+ (calculate (second x) lookup-list) (calculate (third x) lookup-list))]
		  	[(eq? (first x) 'SUB) (- (calculate (second x) lookup-list) (calculate (third x) lookup-list))]
		  	[(eq? (first x) 'MUL) (* (calculate (second x) lookup-list) (calculate (third x) lookup-list))]
		  	[(eq? (first x) 'DIV) (/ (calculate (second x) lookup-list) (calculate (third x) lookup-list))]

		  	[(eq? (first x) 'GT) (> (calculate (second x) lookup-list) (calculate (third x) lookup-list))]
		  	[(eq? (first x) 'LT) (< (calculate (second x) lookup-list) (calculate (third x) lookup-list))]
		  	[(eq? (first x) 'GE) (>= (calculate (second x) lookup-list) (calculate (third x) lookup-list))]
		  	[(eq? (first x) 'LE) (<= (calculate (second x) lookup-list) (calculate (third x) lookup-list))]
		  	[(eq? (first x) 'EQ) (= (calculate (second x) lookup-list) (calculate (third x) lookup-list))]
		  	[(eq? (first x) 'NEQ) (not (= (calculate (second x) lookup-list) (calculate (third x) lookup-list)))]

			[(eq? (first x) 'ANND)(and (calculate (second x) lookup-list) (calculate (third x) lookup-list))]
			[(eq? (first x) 'ORR) (or (calculate (second x) lookup-list) (calculate (third x) lookup-list))]
			[(eq? (first x) 'NOTT) (not (calculate (second x) lookup-list))]

			[(eq? (first x) 'IPH) (if (calculate (second x) lookup-list) (calculate (third x) lookup-list) (calculate (fourth x) lookup-list))]
			[(eq? (first x) 'DEFINE) (if (DEFINE? x) (def (second x) (third x) lookup-list) (display "Invalid definition."))]
			[(eq? (first x) 'LAMBDA) (if (LAMBDA? x) (lam (second x) (third x) lookup-list) (display "Invalid lambda."))]))))
			;; return closure - params and body of original lambda, current env
(define operator-list
	  (list (list 'ADD +)
	        (list 'SUB -)
	        (list 'MUL *)
	        (list 'DIV /)
	        (list 'GT >)
	        (list 'LT <)
	        (list 'GE >=)
	        (list 'LE <=)
	        (list 'EQ =)
	        (list 'NEQ (lambda (x y) (not (= x y))))
	        (list 'ANND (lambda (x y) (and x y)))
	        (list 'ORR (lambda (x y) (or x y)))
	        (list 'NOTT not)))

(define (run-repl)
  (display "welcome to my repl.  type some scheme-ish")
  (repl operator-list))

(define (repl operator-list)
  (display "> ")
  (display (calculate (read) operator-list))
  (newline)
  (repl operator-list))

(run-repl)