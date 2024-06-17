--The maximum function takes a list of things that can be ordered (e.g. instances of the Ord typeclass) and returns the biggest of them.

maximum' :: (Ord a) => [a] -> a
maximum' [] = error "maximum of empty list"
maximum' [x] = x
maximum' (x:xs) 
    | x > maxTail = x
    | otherwise = maxTail
    where maxTail = maximum' xs

-- max is a function that takes two numbers and returns the bigger of them. the maximum of a list is the max of the first element and the maximum of the tail

maximum'' :: (Ord a) => [a] -> a
maximum'' [] = error "maximum of empty list"
maximum'' [x] = x
maximum'' (x:xs) = max x (maximum' xs)











