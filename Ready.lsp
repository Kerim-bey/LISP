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
    ((eql (- m 1) -1) (list r lst))
    (t (sps (cdr lst) (- m 1) (append r (list (car lst)))))))

(print (sps '(1 2 3 4 5 6 7) 3))
(print (sps '(k e r i m s u p e r) 5))
(print (sps '(a b c d e f g) 5))
(print (sps '(1 2 2 2 2 2 2 2) 1))


;;;;ЗАДАНИЕ 18
;;;;Условие: пределите предикат, проверяющий, является ли аргумент одноуровневым списком.

;;;Код:

(defun sing-level(lst)
    (cond
        ((null lst) T)
        ((listp (car lst)) NIL)
        (T (sing-level (cdr lst)))))

(print (sing-level '(a b c d) ))
(print (sing-level '((b) (a)) ))
(print (sing-level '() ))
(print (sing-level '(a (b) c d) ))


;;;;ЗАДАНИЕ 22
;;;;Условие: Определите функцию, которая обращает список (а b с) и разбивает его на уровни (((с) b) а).

;;;Код:

(defun task-TW-TW(lst)
    (cond
        ((null (cdr lst)) lst)
        (T (list (task-TW-TW(cdr lst)) (car lst)))))

(print (task-TW-TW '(а b с) ))
(print (task-TW-TW '() ))
(print (task-TW-TW '(1 2 3 4 5) ))

;;;;ЗАДАНИЕ 26
;;;;Условие: Определите функцию, разбивающую список (a b с d...) на пары ((а b) (с d)...).


;;;Код:

(defun task-TW-SIX(lst)
    (cond
        ((null lst) lst)
        ((null (cdr lst)) (cons lst ()))
        (T (cons (list (car lst) (cadr lst)) (task-TW-SIX (cddr lst ))))))

(print (task-TW-SIX '() ))
(print (task-TW-SIX '(1 2 3 4 5 6 7 8 9 10 ) ))
(print (task-TW-SIX '(1 2 3) ))
(print (task-TW-SIX '(1 ) ))

;;;;ЗАДАНИЕ 27
;;;;Условие: Определите функцию, которая, чередуя элементы списков (a b...) и (1 2...), образует новый список (a 1 b 2 ...).

;;;Код:

(defun task-TW-SEVEN (lst1 lst2)
    (cond
        ((null lst1) lst2)
        ((null lst2) lst1)
        (T (cons (car lst1) (cons (car lst2) (task-TW-SEVEN (cdr lst1) (cdr lst2)))))))


(print (task-TW-SEVEN '(a b c d e) '(1 2 3 4 5) ))
(print (task-TW-SEVEN '(1 3 5 7 9) '(2 4 6 8 0) ))
(print (task-TW-SEVEN '(1 2 3 4 5) '(a b c d e) ))

;;;;ЗАДАНИЕ 29
;;;;Условие: Определите функцию, которая, чередуя элементы списков (a b...) и (1 2...), образует новый список (a 1 b 2 ...).

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

;;;;ЗАДАНИЕ 46
;;;;Условие: Предположим, что отец и мать некоторого лица, хранятся как   
;;;;значения соответствующих свойств у символа, обозначающего это лицо. Напишите функцию
;;;;(РОДИТЕЛИ x), которая возвращает в качестве значения родителей, и предикат (СЕСТРЫ-БРАТЬЯ x1 x2),
;;;;который истинен в случае, если x1 и x2 — сестры или братья, родные или с одним общим родителем.

;;;Код:

(defun get-parents(x)
    (list (get x 'mother) (get x 'father)))

(defun set-parents(x mother father)
    (setf (get x 'mother) mother)
    (setf (get x 'father) father))

(defun sisters-brothers(x y)
    (cond
        ((eq (get x 'mother) (get y 'mother)) T)
        ((eq (get x 'father) (get y 'father)) T)
        (t nil)))

;
;---------------------------------
;    A   B     E   F      L   M    
;     \ /       \ /        \ /     
;     C D      G H K      N Q R    

(set-parents 'C 'A 'B)
(set-parents 'D 'A 'B)

(set-parents 'G 'E 'F)
(set-parents 'H 'E 'F)
(set-parents 'K 'E 'F)

(set-parents 'N 'L 'M)
(set-parents 'Q 'L 'M)
(set-parents 'R 'L 'M)

(print (get-parents 'C) )
(print (get-parents 'Q) )
(print (sisters-brothers 'C 'D) )
(print (sisters-brothers 'G 'K) )
(print (sisters-brothers 'K 'N) )
(print (sisters-brothers 'C 'R) )        

;;;;ЗАДАНИЕ 47
;;;;Условие: Определите функцию УДАЛИТЬ-ВСЕ-СВОЙСТВА, которая удаляет все свойства символа.

;;;Код:

(defun set-props (sym lst)
    (cond
        ((null lst) T)
        (t (setf (get sym (car lst)) (cadr lst))
           (set-props sym (cddr lst)))))      

(defun del-props (sym) 
    ((lambda (props) 
        (cond
            ((null props) T)
            (t (remprop sym (car props))
               (del-props sym)))
      ) (symbol-plist sym))
)


(set-props 'X '(a 1 b 2 c 3 d 4 e 5 f 6))
(print (symbol-plist 'X))
(del-props 'X)
(print (symbol-plist 'X))

;;;;ЗАДАНИЕ 14
;;;;Условие: Определите функцию, осуществляющую перестановку двух элементов списка с заданными номерами.

;;;Код:

(defun get-elem (lst pos)
    (cond
        ((null lst) nil)
        ((< pos 1) nil)
        ((= pos 1) (car lst))
        (t ( get-elem (cdr lst) (- pos 1)))))

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
