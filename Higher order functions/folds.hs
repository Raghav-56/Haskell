-- In recursion, many of the recursive functions that operated on lists. Usually would have an edge case for the empty list. We'd introduce the x:xs pattern and then we'd do some action that involves a single element and the rest of the list. 
--This is a very common pattern, so a couple of very useful functions were introduced to encapsulate it- folds, 
--folds are sort of like the map function, only they reduce the list to some single value.

-- A fold takes a binary function, a starting value (the accumulator) and a list to fold up. 
--The binary function itself takes two parameters. The binary function is called with the accumulator and the first (or last) element and produces a new accumulator. Then, the binary function is called again with the new accumulator and the now new first (or last) element, and so on. 
--Once we've walked over the whole list, only the accumulator remains, which is what we've reduced the list to.


--The foldl function(fold left), folds the list up from the left side. The binary function is applied between the starting value and the head of the list. 

sum' :: (Num a) => [a] -> a
--sum' xs = foldl (\acc x -> acc + x) 0 xs
sum' = foldl (+) 0
--lambda function (\acc x -> acc + x) is the same as (+). (curried functions)
--We can omit the xs as the parameter because calling foldl (+) 0 will return a function that takes a list. (partial functions)

elem :: (Eq a) => a -> [a] -> Bool
elem x = foldl (\acc y-> (y == x) || acc) False


-- The right fold, foldr works in a similar way to the left fold, only the accumulator eats up the values from the right. 
--the left fold's binary function has the accumulator as the first parameter and the current value as the second one (so \acc x -> ...), 
--the right fold's binary function has the current value as the first parameter and the accumulator as the second one (so \x acc -> ...).

map' :: (a -> b) -> [a] -> [b]
map' f = foldr (\x acc -> f x : acc) []
-- much less expensive than foldl, map' f = foldl (\acc x -> acc ++ [f x]) []


-- If you reverse a list, you can do a right fold on it just like you would have done a left fold and vice versa. 
--Sometimes you don't even have to do that, eg sum function. 
--Right folds work on infinite lists, whereas left ones don't! 
--If you take an infinite list at some point and you fold it up from the right, you'll eventually reach the beginning of the list. If you take an infinite list at a point and you try to fold it up from the left, you'll never reach an end!


-- Folds can be used to implement any function where you traverse a list once, element by element, and then return something based on that. 
--folds, along with maps and filters, some of the most useful types of functions in functional programming.


--The foldl1 and foldr1 functions work much like foldl and foldr, only you don't need to provide them with an explicit starting value. 
--They assume the first (or last) element of the list to be the starting value and then start the fold with the element next to it.
--eg. 
maximum' :: (Ord a) => [a] -> a  
maximum' = foldr1 (\x acc -> if x > acc then x else acc)  

reverse' :: [a] -> [a]  
reverse' = foldl (\acc x -> x : acc) []  

product' :: (Num a) => [a] -> a  
product' = foldr1 (*)  

filter' :: (a -> Bool) -> [a] -> [a]  
filter' p = foldr (\x acc -> if p x then x : acc else acc) []  

head' :: [a] -> a
head' = foldr1 (\x _ -> x)  

last' :: [a] -> a
last' = foldl1 (\_ x -> x) 


-- doing a left fold over the list [3,4,5,6] with g as the binary function and z as the accumulator is the equivalent of g (g (g (g z 3) 4) 5) 6.
-- => flip (:) (flip (:) (flip (:) (flip (:) [] 3) 4) 5) 6

--scanl and scanr are like foldl and foldr, only they report all the intermediate accumulator states in the form of a list. 
-- scanl1 and scanr1, are analogous to foldl1 and foldr1.

--How many elements does it take for the sum of the roots of all natural numbers to exceed 1000? and whats the progression like?
sqrtSums :: Int  
sqrtSums = length (takeWhile (<1000) (scanl1 (+) (map sqrt [1..]))) + 1 
--We use takeWhile here instead of filter because filter doesn't work on infinite lists. Even though we know the list is ascending, filter doesn't, so we use takeWhile to cut the scanl off at the first occurrence of a sum greater than 1000. 







