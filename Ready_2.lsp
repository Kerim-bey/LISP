;;;;ЗАДАНИЕ 1
;;;;Условие: Определите FUNCALL через функционал APPLY.

;;;Код:
(defun newfuncall (f &rest args)
              (apply f args))

(print(newfuncall '+ 1 2 3))
(print(newfuncall '- 1 2 3))
(print(newfuncall '* 1 2 3 4))

;;;;ЗАДАНИЕ 3
;;;;Условие: Определите функционал (APL-APPLY f x), который применяет каждую функцию fi списка
;;;;(f1 f2 ... fn)
;;;;к соответствующему элементу списка
;;;;x = (x1 x2 ... xn)
;;;; и возвращает список, сформированный из результатов.

;;;Код:
(defun APL-APPLY (f x)
	(mapcar 'apply f x))

(print (APL-APPLY '(+ - *) '((1 2) (4 5 -1) (5 5))))
(print (APL-APPLY '(+ - *) '((5 6) (10 6 7) (4 4))))
(print (APL-APPLY '(- + equal) '((1 2 3 4) (2 2) (1 1))))

;;;;ЗАДАНИЕ 7
;;;;Условие: Определите фильтр (УДАЛйЬ-ЕСЛИ-НЕ пред список), удаляющий из списка список
;;;;все элементы, которые не обладают свойством, наличие которого проверяет
;;;;предикат пред

;;;Код:
(defun removeIfNot (p w)
  (mapcan #'(lambda (a) (when (funcall p a) (list a))) w))
 
(print (removeIfNot 'evenp '(1 2 3 4)))
(print (removeIfNot 'oddp '(1 2 3 4)))