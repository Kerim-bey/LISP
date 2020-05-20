;;;;ЗАДАНИЕ 1
;;;;Условие: Определите макрос, который возвращает свой вызов

;;;;Код:

(defmacro self (&rest arg)
 `(quote (self ,@arg)))
 
 (print (self 1 2 3))
 (print (self (+ 1 2)))



;;;;ЗАДАНИЕ 2
;;;;Условие: Определите макрос (POP стек), который читает из стека верхний элемент и
;;;;меняет значение переменной стека.

;;;;Код:

(defmacro pop-стек (stack)
  `(let ((head (car ,stack)))
     (setf ,stack (cdr ,stack))
     head))


(setq stack '(1 2 3 4 5 6))

(print (pop-стек stack))
(print (pop-стек stack))
(print (pop-стек stack))



;;;;ЗАДАНИЕ 3
;;;;Условие: Определите лисповскую форму (IF условие p q) в виде макроса

;;;;Код:


(defmacro new-if (new-cond new-true new-false)
   `(cond (,new-cond ,new-true)
          (t ,new-false)))
          
          
(print (new-if (< 3 5) 'false 'true))
(print (new-if (< 6 5) '! '!!!!))


;;;;ЗАДАНИЕ 4
;;;;Условие: Определите в виде макроса форму (FIF тест отр нуль полож).

;;;;Код:

(defmacro FIF (тест отр нуль полож)
    `(cond
     ((< ,тест 0) ,отр)
     ((= ,тест 0) ,нуль)
     (t ,полож)))
     
     
(print (FIF -5 'отр 'нуль 'пол))
(print (FIF 0 'отр 'нуль 'пол))
(print (FIF 1 'отр 'нуль 'пол))


;;;;ЗАДАНИЕ 5
;;;;Условие: Определите в виде макроса форму (REPEAT e UNTIL p) паскалевского типа.

;;;;Код:

(defmacro repeat (e until p)
    `(cond
        ((and ,p (print ,e) (repeat ,e until ,p)))))

(setq lst '(8 2 3 4))
(repeat (pop lst) until lst)
