;;;;ЗАДАНИЕ 10
;;;;Условие: Определите функцию, осуществляющую удаление указанного количества последних элементов исходного списка.

;;;Код:    
(defun del (lst m)
    (cond ((null lst) 0)
    ((eql (length lst) m) nil)
    (t (cons (car lst) (del (cdr lst) m)))))

(print (del '(1 2 3 4 5) 3))
(print (del '(1 2 3 4 5 6 7) 3))
(print (del '(5 5 5 5 5 5) 5))
(print (del '(1 1 1 1 1 1 1 1) 3))

;;;;ЗАДАНИЕ 11
;;;;Условие: Определите функцию, осуществляющую разделение исходного списка на два подсписка. 
;;;;В первый из них должно попасть указанное количество элементов с начала списка, во второй — оставшиеся элементы.

;;;Код:
(defun sps (lst m &optional (r nil))
    (cond ((null lst) 0)
    ((eql (- m 1) -1) (list (reverse r) lst))
    (t (sps (cdr lst) (- m 1) (cons (car lst) r)))))

(print (sps '(1 2 3 4 5 6 7) 3))
(print (sps '(k e r i m s u p e r) 5))
(print (sps '(a b c d e f g) 5))
(print (sps '(1 2 2 2 2 2 2 2) 1))

;;;;ЗАДАНИЕ 4
;;;;Определите функцию, порождающую по заданному натуральному числу N список, состоящий из натуральных чисел от 1 до N.

;;;Код:
(defun nl (N &optional (r 1))
    (cond ((< N 1) nil)
        ((eql (+ N 1) r) nil)
        (t(cons r (nl N (+ r 1))))))

(print (nl 10))
(print (nl 5))
(print (nl 3))
(print (nl 1))
(print (nl 0))
(print (nl -1))
(print (nl -10))

;;;;ЗАДАНИЕ 8
;;;; Определите функцию, которая разделит исходный список из целых чисел на два подсписка: список положительных чисел и список отрицательных чисел

;;;Код:
(defun separ (lst &optional l1 l2)
  (cond ((null lst) (list (reverse l1) (reverse l2)))
        ((>= (car lst) 0) (separ (cdr lst) l1 (cons (car lst) l2)))
        (t (separ (cdr lst) (cons (car lst) l1) l2))))


(print (separ '(1 2 3 -1 -2 -3)))
(print (separ '(1 -1 -2 2 -3 3 -4 4)))
(print (separ '(-1 -2 -3 -4 4 3 2 1)))
(print (separ '()))

;;;;ЗАДАНИЕ 9
;;;; Определите функцию, разделяющую исходный список на два подсписка. В первый из них должны попасть элементы с нечетными номерами, во второй — элементы с четными номерами.

;;;Код:
(defun div (lst &optional lst1 lst2 (n 1))
    (cond 
        ((null lst) (list (reverse lst1) (reverse lst2)))
        ((eql (REM n 2) 0) (div (cdr lst) lst1 (cons (car lst) lst2) (+ n 1)))
        (t (div (cdr lst) (cons (car lst) lst1) lst2 (+ n 1)))))


(print (div '(1 2 3 4 5 6 8 9)))
(print (div '(1 2 3 4 5)))
(print (div '(1 2 3)))

;;;;ЗАДАНИЕ 13
;;;; Определите функцию, удаляющую в исходном списке все повторные вхождения элементов.

;;;Код:
(defun find-delete (lst) 
 (cond
  ((null lst) nil)
  ((member (car lst) (cdr lst)) (find-delete (cdr lst)))
  (t (cons (car lst) (find-delete (cdr lst))))))

(print (find-delete '(1 2 3 1 2 3 1 4 1 5)))
(print (find-delete '(1 1 1 1 1 1)))
(print (find-delete '(1 1 1 1 2 2 2 3 4)))

;;;;ЗАДАНИЕ 14
;;;; Определите функцию, осуществляющую перестановку двух элементов списка с заданными номерами.

;;;Код:
(defun swap (lst n m)
 (cond ((> n 0) (cons (car lst) (swap (cdr lst) (1- n) (1- m))))
       ((> m 1)
            ((lambda (res) (cons (car res) (cons (cadr lst) (cdr res))))
            (swap (cons (car lst) (cddr lst)) (1- n) (1- m))))
       (t (cons (cadr lst) (cons (car lst) (cddr lst))))))

(print (swap '(1 2 3 4 5) 0 1))
(print (swap '(1 2 3 4 5) 1 4))
(print (swap '(1 2 3 4 5) 3 4))
