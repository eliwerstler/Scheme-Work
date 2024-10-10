;; Eli Werstler
;; Prof. King
;; CSCI 324
;; Jagged Matrix Qs
;; matrixFun
(define (question? n matrix)
  ;; Checks if list (row of matrix) is in sorted order
  (define (sortedHelper? list)
    (cond
      [(null? list) true]
      [(null? (cdr list)) true]
      [(< (car list) (cadr list)) (sortedHelper? (cdr list))]
      [else false]))

  ;; Checks if each row of matrix is in sorted order
  (define (sorted? matrix)
    (cond
      [(null? matrix) true]
      ;; Checks if row is sorted and the rest of rows are sorted
      [(and (sortedHelper? (car matrix)) (sorted? (cdr matrix))) true]
      [else false]))

  ;; Returns value at position n (first column is n = 0) within a row of a matrix
  (define (sumColumnHelper n list)
    (cond
      [(null? list) 0]
      ;; If n = 0, the value at the front of list is returned
      [(= n 1) (car list)]
      ;; Recursively finds value at n by checking rest of list and decrementing n by 1
      [else (sumColumnHelper (- n 1) (cdr list))]))
  ;; Returns the sum of values in column n of a matrix
  (define (sumColumn n matrix)
     (cond
       [(null? matrix) 0]
       [else (+ (sumColumnHelper n (car matrix)) (sumColumn n (cdr matrix)))]))
       
  (begin
    (newline)
    (display "__________________________________")
    (newline)
    (display matrix)
    (newline)
    (cond
      ((sorted? matrix)
       (begin
         (display "Every Row is in sorted order.")
         (newline)
         (display "The sum of column ")
         (display n)
         (display " is ")
         (display (sumColumn n matrix))
         ) ;; end begin
       ) ;; end sorted
      (else (display "The rows are not sorted."))
      ) ;; end cond
    (newline)
    ) ;; end begin  
  ) ;; end question?
(question? 3 '((1 2 3) (2 3) (1 2 4 5)))
(question? 4 '((1 2 3 4 5 6 7) (1 2 3) (5 4) ()))
(question? 2 '((2 4 6 8 10 12) () (3) () ()))
(question? 6 '((1 2 3) (2 3) (1 2 4 5)))

;; Discussion Log: I worked with Tom on various parts of each problem for about an hour and a half.