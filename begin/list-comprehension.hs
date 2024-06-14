{-
--All numbers from 50 to 100 whose remainder when divided with the number 7 is 3?

ghci> [ x | x <- [50..100], x `mod` 7 == 3]
[52,59,66,73,80,87,94] 

--In list comprehension, [x*2 | x <- [1..10]]. x is drawn from list [1..10] and for every element in [1..10] (which we have bound to x), we get that element, only doubled.

--Predicates(condition) go after the binding parts and are separated from them by a comma.we have multiple predicates in list comprehensions
--Weeding out lists by predicates is also called filtering. The element is included in the list only if all the predicates evaluate to True.
ghci> [3*x|x<-[2,4..100],50<x*3,x*3<100]
[54,60,66,72,78,84,90,96]

--we can also draw from several lists. When drawing from several lists, comprehensions produce all combinations of the given lists and then join them by the output function we supply. 
ghci> [ x*y | x <- [2,5,10], y <- [8,10,11], x*y > 50]
[55,80,100,110] 

ghci> let nouns = ["hobo","frog","pope"]
ghci> let adjectives = ["lazy","grouchy","scheming"]
ghci> [adjective ++ " " ++ noun | adjective <- adjectives, noun <- nouns]
["lazy hobo","lazy frog","lazy pope","grouchy hobo","grouchy frog",
"grouchy pope","scheming hobo","scheming frog","scheming pope"]
-}

length' xs = sum [1 | _ <- xs]

-- _ means that we don't care what we'll draw from the list

{-
ghci> let xxs = [[1,3,5,2,3,1,2,4,5],[1,2,3,4,5,6,7,8,9],[1,2,4,2,1,6,3,1,3,2,3,6]]
ghci> [ [ x | x <- xs, even x ] | xs <- xxs]
[[2,2,4],[2,4,6,8],[2,4,2,6,2,6]]
-}