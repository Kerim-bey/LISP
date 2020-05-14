;;;;ЗАДАНИЕ 13
;;;;Условие: Определите функцию, которая возвращает в качестве значения свое определение (лямбда-выражение).

;;;Код:

(setq trueform
    '((lambda (x) (list x (list 'quote x)))
        '(lambda (x) (list x (list 'quote x)))))
 

(print trueform)
(print(eval trueform))
(print(eval(eval trueform)))
(print (eval (eval (eval trueform))))
