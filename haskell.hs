import Data.List

{-
ЗАДАНИЕ 3
Условие: Определите функцию, которая разделит исходный список из целых чисел на
два списка: список положительных чисел и список отрицательных чисел.

Код:
-}

new_split lst = (filter (\x -> x > 0) lst, filter (\x -> x < 0) lst)
   

{-
ЗАДАНИЕ 15
Условие: . Определите функцию (ПЕРВЫЙ-СОВПАДАюЩИЙ х у), которая возвращает первый
элемент, входящий в оба списка х и у, в противном случае NIL

Код:
-}

fin a b = head [x | x <- a, x `elem` b]
  

{-
ЗАДАНИЕ 5
Условие: Определите функцию, упаковывающую последовательные дубликаты списка
в подсписки вида (M N), где N - элемент списка, M - количество повторений. Например, [’a’, ’a’, ’a’, ’a’, ’b’, ’c’, ’c’, ’a’, ’a’, ’d’, ’e’,
’e’, ’e’, ’e’] должен быть переведен в [(4, ’a’), (1, ’b’), (2, ’c’),(2, ’a’), (1, ’d’), (4, ’e’)].

Код:
-}
encode [] = []
encode (x:xs) = (length $ x : takeWhile (==x) xs, x)
                 : encode (dropWhile (==x) xs)
      
      
{-
ЗАДАНИЕ 24
Условие: Определите функцию РАЗНОСТЬ, формирующую разность двух множеств, т.е.
удаляющую из первого множества все общие со вторым множеством элементы.

Код:
-}

dif x y = x \\ y

{-
ЗАДАНИЕ 4
Условие: Определите функцию, разделяющую исходный список на два подсписка. В первый из них должны попасть элементы с 
нечетными номерами, во второй - элементы с четными номерами.

Код:
-}

separ :: [Int] -> [[Int]]
separ [] = [[]]
separ [x] = [[x],[]]
separ (x:y:xs) = [x:xp, y:yp] where [xp, yp] = separ xs

main = do
    putStrLn "Тесты к задаче №3"
    print (new_split [-1, -2, -3, 1, 2, 3]) 
    print (new_split [1, 2, 3, 4, 5]) 
    print (new_split [-1, 1, 0, 2])
    putStrLn "Тесты к задаче 15"
    print (fin [2, 3] [1, 2, 0, 5])
    print (fin [43, 3, -1] [1, 2, 0, 5, -1])
    print (fin [1, 2, 3] [1])
    putStrLn "Тесты к задаче №5"
    print (encode ['a', 'a', 'a', 'b', 'b'])
    print (encode ['a', 'a', 'b', 'b', 'b', 'c', 'c'])
    print (encode ['a', 'a', 'a', 'b', 'b', 'b', 'c', 'c', 'c', 'a'])
    putStrLn "Тесты к задаче №24"
    print (dif [1, 2] [1, 2, 3])
    print (dif [1, 2, 3, 4, 5] [1, 2, 5, 1, 3])
    print (dif [1, 2] [1])
    putStrLn "Тесты к задаче №4"
    print (separ [1,2,3,4,5])
    print (separ [])
    print (separ [1])
