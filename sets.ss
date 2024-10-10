;; Eli Werstler
;; Prof. King
;; CSCI 324
;; Set Fun
;; setOps

(define (setOps L1 L2)
   
  ;; checks if a digit is contained in a list
  (define (contains? a list)
    (cond
      ;; base case
      [(null? list) false]
      [(eq? a (car list)) true]
      [else (contains? a (cdr list))]))
  ;; returns set that contains all elements of A that also belong to B (or equivalently,
  ;; all elements of B that also belong to A), but no other elements.
  (define (intersection a b)
    (cond
      ;; base case
      [(null? a) '()]
      [(contains? (car a) b) (cons (car a) (intersection (cdr a) b))]
      [else (intersection (cdr a) b)]))
  ;; returns set of elements that are in A, in B, or in both A and B.
  (define (union a b)
    (cond
      ;; base case
      [(null? a) b]
      [(contains? (car a) b) (union (cdr a) b)]
      [else (cons (car a) (union(cdr a) b))]))
  ;; returns set of elements in A but not in B.
  (define (difference a b)
    (cond
      ;; base case
      [(null? a) '()]
      [(contains? (car a) b) (difference (cdr a) b)]
      [else (cons (car a) (difference (cdr a) b))]))
      
  (begin
    
    (display "Set 1: ")
    (display L1)
    (newline)
    (display "Set 2: ")
    (display L2)
    (newline)
    (display "____________Set Operations_____________")
    (newline)
    ;; code here to call functions and display
    ;; the resulting sets
    (display(intersection L1 L2))
    (newline)
    (display(union L1 L2))
    (newline)
    (display(difference L1 L2))
    (newline)
   )
)

(setOps '(1 2 3 4 7 8) '(0 2 3 5))
(setOps '(6 7 8) '(2 3))
(setOps '() '(2 3 5))

;; Discussion log: I worked alone on this project and did not consult outside resources.