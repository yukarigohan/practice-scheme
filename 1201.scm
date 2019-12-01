(define atom?
  (lambda (x)
    (and (not (pair? x))(not (null? x)))))

(print (atom? 'apple))
(print (atom? '(apple)))

(define lat?
  (lambda (l)
    (cond
      ((null? l) #t)
      ((atom? (car l))(lat? (cdr l)))
      (else #f))))

(print (lat? '(a b c)))
(print (lat? '((a) b c)))

(define member?
  (lambda (a lat)
    (cond
      ((null? lat) #f)
      (else (or (eq? a (car lat))(member? a (cdr lat)))))))

;cdr=リストの中の最初のS式を取り除いたリスト

(print (member? 'apple '(banana apple orange)))
(print (member? 'a '(b c d e)))

(define rember
  (lambda (a lat)
    (cond
      ((null? lat)(quote ()))
      ((eq? a (car lat))(cdr lat))
      (else (cons (car lat)(rember a (cdr lat)))))))

(print (rember 'c '(a b c d e)))
(print (rember 'f '(a b c d e)))

(define firsts
  (lambda (l)
    (cond
      ((null? l)(quote ()))
      (else (cons (car (car l))(firsts (cdr l)))))))

(print (firsts '((a b)(c d)(e f))))
(print (firsts '(((a b) c)(d e))))

(define insertR
  (lambda (new old lat)
    (cond
      ((null? lat)(quote ()))
      ((eq? old (car lat))(cons old (cons new (cdr lat))))
      (else (cons (car lat)(insertR new old (cdr lat)))))))

(print (insertR 'e 'd '(a b c d f g)))
(print (insertR 'apple 'banana '(orange strawberry banana)))

(define insertL
  (lambda (new old lat)
    (cond
      ((null? lat)(quote ()))
      (else (cond ((eq? old (car lat))(cons new (cons old (cdr lat))))
        (else (cons (car lat)(insertL new old (cdr lat)))))))

(print (insertR 'd 'e '(a b c e f g)))
(print (insertR 'apple 'banana '(orange strawberry banana)))