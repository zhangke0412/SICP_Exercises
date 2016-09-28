(define (make-table same-key?)
  (let ((local-table (list '*table*)))
    (define (assoc key records)
      (cond ((null? records) #f)
            ((same-key? key (caar records)) (car records))
            (else (assoc key (cdr records)))))
    (define (lookup key-list)
      (define (iter keys table)
        (if (null? (cdr keys))
            (let ((record (assoc (car keys) (cdr table))))
              (if record
                  (cdr record)
                  #f))
            (let ((subtable (assoc (car keys) (cdr table))))
              (if subtable
                  (iter (cdr keys) subtable)
                  #f))))
      (if (null? key-list)
          #f
          (iter key-list local-table)))
    (define (insert! key-list value)
      (define (make-insert-table keys)
        (if (null? (cdr keys))
            (cons (car keys) value)
            (list (car keys) (make-insert-table (cdr keys)))))
      (define (iter keys table)
        (if (null? (cdr keys))
            (let ((record (assoc (car keys) (cdr table))))
              (if record
                  (set-cdr! record value)
                  (set-cdr! table
                            (cons (cons (car keys) value)
                                  (cdr table)))))
            (let ((subtable (assoc (car keys) (cdr table))))
              (if subtable
                  (iter (cdr keys) subtable)
                  (set-cdr! table
                            (cons (make-insert-table keys)
                                  (cdr table)))))))
      (cond ((null? key-list)
             (error "Can insert value into table with a null key-list -- INSTER!"))
            (else
             (iter key-list local-table)
             'ok)))
    (define (dispatch m)
      (cond ((eq? m 'lookup-proc) lookup)
            ((eq? m 'insert-proc!) insert!)
            (else (error "Unknown operation -- TABLE" m))))
    dispatch))

(define table1 (make-table equal?))
(define get (table1 'lookup-proc))
(define put (table1 'insert-proc!))

(get '(1 1.1 1.1.1))
(put '(1 1.1 1.1.1) 'a)
(get (list 'A 'a))
(put '(A a) 'A-a)
(get '(one))
(put '(one) 1)
