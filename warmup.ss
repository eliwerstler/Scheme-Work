;; Eli Werstler
;; Prof. King
;; CSCI 324
;; Warmup
;; sumAdd

(define (sumAdd list)
  (cond
    [(null? list) 0] ;; Base case: checks to see if the list is empty. Returns 0 if so.
    [(not (list? list)) list] ;; Checks to see if list is a single number. Returns it if so.
    [(number? (car list)) (+ (car list) (sumAdd (cdr list)))] ;; Checks to make sure the value at front of list is number. If so, recursively adds it to the total.
    [(list? (car list)) (+ (sumAdd (car list)) (sumAdd (cdr list)))] ;; If front value is another list, recurively add that list with the rest of the list.
    [else (sumAdd (cdr list))] ;; If front value is no a nuber or list, recursively add the rest of the list.
    )
  )
(sumAdd '(4 5 0 1))
(sumAdd '(4 5 ((44 31 5) ()) x ((((10))) (5 (5))) 0 1))
(sumAdd '87)

;; Collaboration Log: I worked alone on this project