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
