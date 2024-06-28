import Data.List 
-- all about lists


numUniques :: (Eq a) => [a] -> Int  
numUniques = length . nub  
--nub is a function defined in Data.List that, takes a list and weeds out duplicate elements.

-- Prelude module exports some functions from Data.List eg. map and filter


--intersperse takes an element and a list and then puts that element in between each pair of elements in the list.
intersperse' :: a -> [a] -> [a]
intersperse' _ [] = []
intersperse' sep (x:xs) = x:sep: intersperse' sep xs
{-
ghci> intersperse '.' "MONKEY"  
"M.O.N.K.E.Y"  
ghci> intersperse 0 [1,2,3,4,5,6]  
[1,0,2,0,3,0,4,0,5,0,6]  
-}

-- intercalate takes a list and a list of lists. It then inserts that list in between all those lists and then flattens the result.
intercalate' :: [a] -> [[a]] -> [a]
intercalate' sep xxs = concat $ intersperse sep xxs

{-
ghci> intercalate " " ["hey","there","folks"]  
"hey there folks"  
ghci> intercalate [0,0,0] [[1,2,3],[4,5,6],[7,8,9]]  
[1,2,3,0,0,0,4,5,6,0,0,0,7,8,9]  
-}

--transpose transposes a list of lists. If you look at a list of lists as a 2D matrix, the columns become the rows and vice versa.
transpose' :: [[a]] -> [[a]]
transpose' [] = []
transpose' ([]:_) = []
transpose' x = map head x : transpose' (map tail x)
{-
ghci> transpose [[1,2,3],[4,5,6],[7,8,9]]  
[[1,4,7],[2,5,8],[3,6,9]]  
ghci> transpose ["hey","there","folks"]  
["htf","eho","yel","rk","es"] 
-}

{-
Say we have the polynomials 3x2 + 5x + 9, 10x3 + 9 and 8x3 + 5x2 + x - 1 and we want to add them together. We can use the lists [0,3,5,9], [10,0,0,9] and [8,5,1,-1] to represent them in Haskell. Now, to add them, all we have to do is this:

ghci> map sum $ transpose [[0,3,5,9],[10,0,0,9],[8,5,1,-1]]  
[18,8,6,17] 
-}

{-
foldl' and foldl1' are stricter versions of their respective lazy incarnations. 
When using lazy folds on really big lists, you might often get a stack overflow error, due to the lazy nature of the folds, the accumulator value isn't actually updated as the folding happens. 
What actually happens is that the accumulator kind of makes a promise that it will compute its value when asked to actually produce the result (also called a thunk). That happens for every intermediate accumulator and all those thunks overflow your stack. 
The strict folds aren't lazy and actually compute the intermediate values as they go along instead of filling up your stack with thunks. 
So if you ever get stack overflow errors when doing lazy folds, try switching to their strict versions.
-}


--concat flattens a list of lists into just a list of elements.
concat' :: [[a]] ->  [a]
concat' [] = []
concat' xxs = foldl1 (++) xxs


--and takes a list of boolean values and returns True only if all the values in the list are True
{-ghci> and $ map (>4) [5,6,7,8]  
True  
ghci> and $ map (==4) [4,4,4,3,4]  
False  -}

--or is like and, only it returns True if any of the boolean values in a list is True.
{-ghci> or $ map (==4) [2,3,4,5,6,1]  
True  
ghci> or $ map (>4) [1,2,3]  
False -}


--any and all take a predicate and then check if any or all the elements in a list satisfy the predicate
{-ghci> any (==4) [2,3,5,6,1,4]  
True  
ghci> all (>4) [6,9,10]  
True  
ghci> all (`elem` ['A'..'Z']) "HEYGUYSwhatsup"  
False  
ghci> any (`elem` ['A'..'Z']) "HEYGUYSwhatsup"  
True -}
-- instead of mapping over a list, 






