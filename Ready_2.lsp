;;;;ЗАДАНИЕ 9
;;;;Условие: Напишите генератор порождения чисел Фибоначчи: 0, 1, 1, 2, 3, 5, ..

;;;Код:
(defun fib ()
    (let ((a 0) (b 1))
        (lambda ()
            (setq n a
                a (+ b a)
                b n
             )
         )
    )
)
(setq fib1 (fib))

(print (funcall fib1))
(print (funcall fib1))
(print (funcall fib1))
(print (funcall fib1))
(print (funcall fib1))
(print (funcall fib1))


;;;;ЗАДАНИЕ 11
;;;;Условие: Определите фукнционал МНОГОФУН, который использует функции, являющиеся
;;;;аргументами, по следующей схеме:
;;;;(МНОГОФУН ’(f g ... h) x) ⇔ (LIST (f x) (g x) ... (h x))

;;;Код:

(defun multi-fun (func-arg x)
  (mapcar #'(lambda (f) (funcall f x)) func-arg))


(print (multi-fun '(sin cos tan) 1))
(print (multi-fun '(oddp evenp) 2))
