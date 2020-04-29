;;;;ЗАДАНИЕ 29
;;;;Условие: Определите функцию, вычисляющую глубину списка (самой глубокой ветви).

;;;Код:

(defun task-TW-NINE (lst)
    (cond
        ((null lst) 1)
        ((atom lst) 1)
        (T ((lambda (dep1 dep2) 
            (cond ((listp (car lst)) 
                   (cond ((> dep1 dep2) dep1) 
                         (T dep2)))
                  (T dep2))
            )(1+ (task-TW-NINE (car lst))) (task-TW-NINE (cdr lst))))))

(print (task-TW-NINE '(1) ))
(print (task-TW-NINE '(1(2)) ))
(print (task-TW-NINE '(1(2(3))(2)) ))
(print (task-TW-NINE '(1(2(3(4(5))))) ))

;;;;ЗАДАНИЕ 11
;;;;Условие: Определите функцию, осуществляющую разделение исходного списка на два подсписка. 
;;;;В первый из них должно попасть указанное количество элементов с начала списка, во второй — оставшиеся элементы.

;;;Код:
(defun del (lst num)
    (cond
        ((null lst) nil)
        ((< num 1) (list nil lst ))
        (t ((lambda(elem lst2)
                (cons (cons elem (car lst2)) (cdr lst2))) (car lst) (del (cdr lst) (1- num))))))

(print (del '(1 2 3 4 5 6 7) 3))
(print (del '(k e r i m s u p e r) 5))
(print (del '(a b c d e f g) 5))
(print (del '(1 2 2 2 2 2 2 2) 1))

;;;;ЗАДАНИЕ 14
;;;;Условие: Определите функцию, осуществляющую перестановку двух элементов списка с заданными номерами.

;;;Код:

(defun get-elem (lst pos)
    (cond
        ((null lst) nil)
        ((< pos 1) nil)
        ((= pos 1) (car lst))
        (t (get-elem (cdr lst) (- pos 1)))))

(defun set-elem (lst pos elem)
    (cond
        ((null lst) nil)
        ((< pos 1) lst)
        ((= pos 1) (cons elem (cdr lst)))
        (t (cons (car lst) (set-elem (cdr lst) (- pos 1) elem)))))

(defun swap-elems (lst x y)
    (set-elem (set-elem lst x (get-elem lst y)) y (get-elem lst x)))


(print (swap-elems '(1 2 3 4 5) 1 5))
(print (swap-elems '(1 2 3 4 5 6 7 8) 8 2))
(print (swap-elems '() 1 5))
(print (swap-elems '(1 2 3 4 5 6 7 8 9 10) 3 10))	


;;;;ЗАДАНИЕ 47
;;;;Условие: Определите функцию УДАЛИТЬ-ВСЕ-СВОЙСТВА, которая удаляет все свойства символа.

;;;Код:
(defun set-props (sym lst)
    (cond
        ((null lst) T)
        (t (setf (get sym (car lst)) (cadr lst))
           (set-props sym (cddr lst)))))      

(defun del-props (sym) 
    (setf (symbol-plist sym) nil)
)


(set-props 'sym '(a 1 b 2 c 3 d 4 e 5 f 6))
(print (symbol-plist 'sym))
(del-props 'sym)
(print (symbol-plist 'sym))
