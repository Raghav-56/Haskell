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












