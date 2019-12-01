(print "Hello world")

(define atom?
  (lambda (x)
    (and (not (null? x))(not (pair? x)))))


(define lat?
  (lambda (l)
    (cond
      ((null? l) #t)
      ((atom? (car l))(lat? (cdr l)))
      (else #f))))

(print (lat? '(a b c d e)))
(print (lat? '(a (b c) d e)))

;(define rember
  ;(lambda (a l)
    ;(cond
      ;((null? l)(quote ()))
      ;((eq? a (car l))(cons

(define member?
  (lambda (a lat)
    (cond
      ((null? lat) #f)
      ((eq? a (car lat)) #t)
      (else (member? a (cdr lat))))))


(print (member? 'b '(a b c)))
(print (member? 'd '(a b c)))




;(print (rember 'b '(a b c)))
;(a c)