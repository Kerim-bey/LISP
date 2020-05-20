;;;;ЗАДАНИЕ 1
;;;;Условие: Определите макрос, который возвращает свой вызов

;;;;Код:
```
(defmacro self (&rest arg)
 `(quote (self ,@arg)))
 
 (print (self 1 2 3))
 (print (self (+ 1 2)))
```


;;;;ЗАДАНИЕ 2
;;;;Условие: Определите макрос (POP стек), который читает из стека верхний элемент и
;;;;меняет значение переменной стека.

;;;;Код:
```
(defmacro pop-стек (stack)
  `(let ((head (car ,stack)))
     (setf ,stack (cdr ,stack))
     head))


(setq stack '(1 2 3 4 5 6))

(print (pop-стек stack))
(print (pop-стек stack))
(print (pop-стек stack))

```
