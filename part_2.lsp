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

;;;;ЗАДАНИЕ 5
;;;;Условие: Определите функциональный предикат (НЕКОТОРЫй пред список), который ис
;;;;тинен, когда, являющейся функциональным аргументом предикат пред истинен хотя бы для одного элемента списка список

;;;Код:
(defun НЕКОТОРЫЙ (fun args)
		(not (null (mapcan fun args)))
)

(print (НЕКОТОРЫЙ `oddp `(1 3 5)))
(print (НЕКОТОРЫЙ `evenp `(1 3 5)))

;;;;ЗАДАНИЕ 7
;;;;Условие: Определите фильтр (УДАЛйЬ-ЕСЛИ-НЕ пред список), удаляющий из списка список
;;;;все элементы, которые не обладают свойством, наличие которого проверяет
;;;;предикат пред

;;;Код:
(defun УДАЛИТЬ_ЕСЛИ_НЕ (p w)
  (mapcan #'(lambda (a) (when (funcall p a) (list a))) w))
 
(print (УДАЛИТЬ_ЕСЛИ_НЕ 'evenp '(1 2 3 4)))
(print (УДАЛИТЬ_ЕСЛИ_НЕ 'oddp '(1 2 3 4)))

