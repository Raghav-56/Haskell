--replicate: takes an Int and some element and returns a list that has several repetitions of the same element.

replicate' :: (Num i, Ord i) => i -> a -> [a]
replicate' n x
    | n <= 0    = []
    | otherwise = x:replicate' (n-1) x

--Note: Num is not a subclass of Ord. That means that what constitutes for a number doesn't really have to adhere to an ordering. 
--So that's why we have to specify both the Num and Ord class constraints when doing addition or subtraction and also comparison.
----However, typically, for replication, the Integral type class is more appropriate than Num because Num includes fractional types (e.g., Float or Double), which are not typically used for counting.

-- The type signature allows n to be any numeric type that is also ordered, which is compatible with the logic used in the function. 


--take: takes a certain number of elements from a list.

take' :: (Num i, Ord i) => i -> [a] -> [a]
take' n _
    | n <= 0 = []
take' _ [] = []
take' n (x:xs) = x:take' (n-1) xs


--reverse: simply reverses a list.

reverse' :: [a] -> [a]
reverse' [] = []
reverse' (x:xs) = reverse' xs ++ [x]


--repeat: takes an element and returns an infinite list that just has that element.

repeat' :: a -> [a]
repeat' x = x:repeat' x

{- --// replicate 2:

//replicate'' :: Int -> a -> [a]
//replicate'' n a = take n (repeat' a) -}


--zip: takes two lists and zips them together.

zip' :: [a] -> [a] -> [(a,a)]
zip' [] _ = []
zip' _ [] = []
zip' (x:xs) (y:ys) = (x,y): zip' xs ys


--elem: takes an element and a list and sees if that element is in the list.

elem' :: (Eq a) => a -> [a] -> Bool
elem' _ [] = False
elem' a (x:xs) 
    | a == x = True
    | otherwise = elem' a xs











