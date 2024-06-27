-- Map takes a function and a list and applies that function to every element in the list, producing a new list. 
map' :: (a -> b) -> [a] -> [b]
map' _ [] = []
map' f (x:xs) = f x : map' f xs

{-
ghci> map (replicate 3) [3..6]
[[3,3,3],[4,4,4],[5,5,5],[6,6,6]]
ghci> map (map (^2)) [[1,2],[3,4,5,6],[7,8]]
[[1,4],[9,16,25,36],[49,64]]
ghci> map fst [(1,2),(3,5),(6,3),(2,6),(2,5)]
[1,3,6,2,2]
-}


-- filter is a function that takes a predicate (a function that tells whether something is true or not, so in our case, a function that returns a boolean value) and a list 
--and then returns the list of elements that satisfy the predicate. 
filter' :: (a -> Bool) -> [a] -> [a]
filter' _ [] = []
filter' f (x:xs)
    | f x = x: filter' f xs  
    | otherwise = filter' f xs

{-
ghci> filter even [1..10]
[2,4,6,8,10]
ghci> let notNull x = not (null x) in filter notNull [[1,2,3],[],[3,4,5],[2,2],[],[],[]]
[[1,2,3],[3,4,5],[2,2]]
ghci> filter (`elem` ['a'..'z']) "u LaUgH aT mE BeCaUsE I aM diFfeRent"
"uagameasadifeent"
ghci> filter (`elem` ['A'..'Z']) "i lauGh At You BecAuse u r aLL the Same"
"GAYBALLS"
-}

notNullLst :: [[a]] -> [[a]]
notNullLst = filter (not . null)


-- All of this could also be achieved with list comprehensions by the use of predicates. 
--The filter equivalent of applying several predicates in a list comprehension is either filtering something several times or joining the predicates with the logical && function.


quicksort'' :: (Ord a) => [a] -> [a]
quicksort'' [] = []
quicksort'' (x:xs) =
    let smallerSorted = quicksort'' (filter (<=x) xs)
        biggerSorted = quicksort'' (filter (>x) xs) 
    in  smallerSorted ++ [x] ++ biggerSorted


-- The largest number under 100,000 that's divisible by 3829. 
largestDivisible :: (Integral a) => a
largestDivisible = head (filter p [100000,99999..])
    where p x = x `mod` 3829 == 0

--The sum of all odd squares that are smaller than 10,000
sum' :: (Integral a) => a
sum' = sum (takeWhile (<10000) li)
    where   li = map (^2) [1,3..] --can use odd x

sum'' :: Integer
sum'' = sum (takeWhile (<10000) lio)
    where lio = [n^2 | n <- [1..], odd (n^2)]


--Collatz sequences; We take a natural number, 
--If that number is even, we divide it by two. If it's odd, we multiply it by 3 and then add 1 to that. 
--We take the resulting number and apply the same thing to it, which produces a new number and so on. In essence, we get a chain of numbers. 
--It is thought that for all starting numbers, the chains finish at the number 1.

--Collatz sequences generator-
chain :: (Integral a) => a -> [a]
chain 1 = [1]
chain x 
    | even x = x: chain fromIntegral(x `div` 2)
    | odd x = x: chain (x*3+1)

-- for all starting numbers between 1 and 100, how many chains have a length greater than 15?
-- numLongChains instead of nch15
numLongChains :: Int
numLongChains = length ali
    where   ali = filter isLong li
            isLong = (15 <) . length -- (f . g) x = f (g x) --// isLong xl = length xl >15
            li = map chain [1..100]

-- remember fromIntegral
intnch15 :: (Num a) => a
intnch15 = fromIntegral numLongChains


-- List of partial function
multByN :: (Num a, Enum a) => [a -> a]
--multByN = map (\n -> (*) n) [0..]
multByN = map (*) [0..]

-- == [(0*),(1*),(2*),(3*),(4*),(5*)...}]

{-ghci> let listOfFuns = map (*) [0..]
ghci> (listOfFuns !! 4) 5 -- index 4
20-}










