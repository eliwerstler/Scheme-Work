;; Eli Werstler
;; Prof. King
;; CSCI 324
;; Arithmatic Parser
;; parse

(define (operation op) ;; Returns the correct operation to be used
  (cond
    [(eq? (cadr op) '+) +]
    [(eq? (cadr op) '-) -]
    [(eq? (cadr op) '*) *]
    [(eq? (cadr op) '/) /]))

(define parse
  (lambda (input)
    (cond
      [(null? input) '()] ;; Returns empty list if input is empty
      [(number? input) input] ;; Returns number if input is single number
      [(and (not (list? input)) (not (number? input))) 1] ;; Returns 1 if input is not list
                                                          ;; or number (ie. letter)
      [(null? (cdr input)) (parse (car input))] ;; If the rest of the list is empty, only
                                                ;; focus on first item (helps with scope
                                                ;; for operation function)
      [else ((operation input) (parse (car input)) (parse (cdr(cdr input))))]))) ;; Uses
                                                ;; return from operation function as operator
                                                ;; on first item and items after operator

(parse '5)
(parse '(6))
(parse '(5 + 6 + 7))
(parse '(5 - 6 - 7))
(parse '(5 - (6 - 7)))
(parse '((5 - 6) - 7))
(parse '(36 / 6 / 2 - 5 - a + 7))

;; Discussion Log: I worked alone on this project