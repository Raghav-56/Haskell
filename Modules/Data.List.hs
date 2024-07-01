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
and' :: (Bool a) => [a] -> a
and' [] = True
and' = foldr1 &&
{-ghci> and $ map (>4) [5,6,7,8]  
True  
ghci> and $ map (==4) [4,4,4,3,4]  
False  -}

--or is like and, only it returns True if any of the boolean values in a list is True.
or' :: (Bool a) => [a] -> a --?
or' [] = False
or' = foldr1 ||
{-ghci> or $ map (==4) [2,3,4,5,6,1]  
True  
ghci> or $ map (>4) [1,2,3]  
False -}


--any and all take a predicate and then check if any or all the elements in a list satisfy the predicate
any' :: (a -> bool) -> [a] -> Bool
any' p = or . map p
all' :: (a -> bool) -> [a] -> Bool
all' p = and . map p
{-ghci> any (==4) [2,3,5,6,1,4]  
True  
ghci> all (>4) [6,9,10]  
True  
ghci> all (`elem` ['A'..'Z']) "HEYGUYSwhatsup"  
False  
ghci> any (`elem` ['A'..'Z']) "HEYGUYSwhatsup"  
True -}
-- instead of mapping over a list, 


--iterate takes a function and a starting value. It applies the function to the starting value, then it applies that function to the result and continues... It returns all the results in the form of an infinite list.
iterate :: (a -> a) -> a -> [a]
iterate f x = f x : iterate f $ f x
{-
ghci> take 10 $ iterate (*2) 1  
[1,2,4,8,16,32,64,128,256,512]  
ghci> take 3 $ iterate (++ "haha") "haha"  
["haha","hahahaha","hahahahahaha"]  
-}


--splitAt takes a number and a list. It then splits the list at that many elements, returning the resulting two lists in a tuple.
splitAt' :: Int -> [a] -> ([a],[a])
splitAt' n xs = (take n xs, drop  n xs)
{-
ghci> splitAt 3 "heyman"  
("hey","man")  
ghci> splitAt 100 "heyman"  
("heyman","")  
ghci> splitAt (-3) "heyman"  
("","heyman")  
ghci> let (a,b) = splitAt 3 "foobar" in b ++ a  
"barfoo" 
-}


--takeWhile takes elements from a list while the predicate holds and then when an element is encountered that doesn't satisfy the predicate, it's cut off.
takeWhile' :: (a -> bool) -> [a] -> [a] 
takeWhile' p (x:xs)
    | p x = x : takeWhile' p xs
    | otherwise = []
{-
ghci> takeWhile (>3) [6,5,4,3,2,1,2,3,4,5,4,3,2,1]  
[6,5,4]  
ghci> takeWhile (/=' ') "This is a sentence"  
"This"
ghci> sum $ takeWhile (<10000) $ map (^3) [1..]  
53361  
-}

-- dropWhile drops all the elements while the predicate is true. Once predicate equates to False, it returns the rest of the list
dropWhile' :: (a -> bool) -> [a] -> [a] 
dropWhile' p (x:xs)
    | p x = [] : dropWhile' p xs
    | otherwise = xs
{-
ghci> dropWhile (/=' ') "This is a sentence"  
" is a sentence"  
ghci> dropWhile (<3) [1,2,2,2,3,4,5,4,3,2,1]  
[3,4,5,4,3,2,1]  

ghci> let stock = [(994.4,2008,9,1),(995.2,2008,9,2),(999.2,2008,9,3),(1001.4,2008,9,4),(998.3,2008,9,5)]  
ghci> head $ dropWhile (\(val,y,m,d) -> val < 1000) stock 
(1001.4,2008,9,4) 
-}


--span is kind of like takeWhile, only it returns a pair of lists. The first list contains everything the resulting list from takeWhile would contain if it were called with the same predicate and the same list. The second list contains the part of the list that would have been dropped
span' :: (a -> bool) -> [a] -> ([a],[a])
-- span' p xs = (takeWhile p xs, dropWhile p xs)
span' _ [] = []
span' p xs@(x:xs') =
    | p x = let (ys,zs) = span p xs' in (x:ys,zs)
    | otherwise = ([],xs)
{-
ghci> let (fw, rest) = span (/=' ') "This is a sentence" in "First word:" ++ fw ++ ", the rest:" ++ rest  
"First word: This, the rest: is a sentence" 
ghci> span (/=4) [1,2,3,4,5,6,7]  
([1,2,3],[4,5,6,7])  
-}

--break breaks the list when the predicate is first true. 
--break p == span (not . p)
-- the second list in the result will start with the first element that satisfies the predicate.
{-
ghci> break (==4) [1,2,3,4,5,6,7]  
([1,2,3],[4,5,6,7])  
-}


--sort simply sorts a list. The type of the elements in the list has to be part of the Ord typeclass, otherwise the list can't be sorted.
sort' :: Ord a => [a] -> [a]
sort' = sortBy' compare
sortBy' :: (a -> a -> Ordering) -> [a] -> [a]
sortBy' cmp = mergeAll . sequences
    where
        sequences :: (a -> a -> Ordering) -> [a] -> [[a]]
        sequences (a:b:xs)
            | a `cmp` b == GT = descending b [a]  xs
            | otherwise       = ascending  b (a:) xs
        sequences xs = [xs]

        descending :: (a -> a -> Ordering) -> a -> [a] -> [a] -> [[a]]
        descending a as (b:bs)
            | a `cmp` b == GT = descending b (a:as) bs
        descending a as bs  = (a:as): sequences bs

        ascending :: (a -> a -> Ordering) -> a -> ([a] -> [a]) -> [a] -> [[a]]
        ascending a as (b:bs)
            | a `cmp` b /= GT = ascending b (\ys -> as (a:ys)) bs
        ascending a as bs   =   let !x = as [a]
                                in x : sequences bs

        mergeAll :: [[a]] -> [a] -- list of merged pairs in acs order from a list of lists
        mergeAll [x] = x
        mergeAll xs  = mergeAll (mergePairs xs)

        mergePairs :: [[a]] -> [[a]] 
        mergePairs (a:b:xs) =   let !x = merge a b
                                in x : mergePairs xs
        mergePairs xs       = xs

        merge :: (a -> a -> Ordering) -> [a] -> [a] -> [a]
        merge as@(a:as') bs@(b:bs') -- merges 2 lists in ascending order
            | a `cmp` b == GT = b:merge as  bs'
            | otherwise       = a:merge as' bs
        merge [] bs         = bs
        merge as []         = as
{-
ghci> sort [8,5,3,2,1,6,4,2]  
[1,2,2,3,4,5,6,8]  
ghci> sort "This will be sorted soon"  
"    Tbdeehiillnooorssstw"  
-}


--group takes a list and groups adjacent elements into sublists if they are equal.
group' :: (Eq a) => [a] -> [[a]]
group' [] = []
group' (x:xs)
    | x == xs = (x:ys) : group' zs
        where (ys,zs) = span (== x) ys
--If we sort a list before grouping it, we can find out how many times each element appears in the list.


--inits and tails are like init and tail, only they recursively apply that to a list until there's nothing left.
inits' :: [a] -> [[a]]
inits' [] == [[]]
inits xs = [] : zipWith take [1..] $ repeat xs
--inits' = scanl (\acc x -> (acc ++ x)) []
tails' :: [a] -> [[a]]
tails' [] = [[]]
tails' xs = zipWith drop [0..] (repeat xs) ++ [[]]

{-
ghci> let w = "w00t" in zip (inits w) (tails w)  
[("","w00t"),("w","00t"),("w0","0t"),("w00","t"),("w00t","")]  
-}


--fold to implement searching a list for a sublist
search :: (Eq a) => [a] -> [a] -> Bool
search xs ys = 
    let xsl = length xs  
    in  foldl (\acc x -> take xsl x == xs || acc) False $ tails 
    --if take xsl x == xs then True else acc

--isInfixOf searches for a sublist within a list and returns True if the sublist we're looking for is somewhere inside the target list. -- above similar search
--isPrefixOf and isSuffixOf search for a sublist at the beginning and at the end of a list, respectively. foldl & foldr


--elem and notElem check if an element is or isn't inside a list.


--partition takes a list and a predicate and returns a pair of lists. The first list in the result contains all the elements that satisfy the predicate, the second contains all the ones that don't.
partition' :: (a -> Bool) -> [a] -> ([a],[a])
partition' p = foldr (select p) ([],[])
    where select p x ~(ts,fs)
        | p x = (x:ts,fs)
        | otherwise = (ts,x:fs)


{-
-- find takes a list and a predicate and returns the first element that satisfies the predicate
find' (a -> Bool) -> [a] -> Maybe a
find p = listToMaybe . filter p
-- returns that element wrapped in a Maybe value.
-- a Maybe value can either be Just something or Nothing
-- eg. find (\(val,y,m,d) -> val > 1000) stock,


-- todo https://hackage.haskell.org/package/ghc-internal-9.1001.0/docs/src/GHC.Internal.Data.OldList.html#find
-- todo https://hackage.haskell.org/package/base-4.20.0.1/docs/Data-List.html#v:elemIndex


-- elemIndex is like elem, only it doesn't return a boolean value. It either returns, the index of the element we're looking for or If that isn't in our list, Nothing.
-- Todo elemIndex' :: (Eq a) => a -> [a] -> Maybe Int

--elemIndices is like elemIndex, only it returns a list of indices, in case the element we're looking for crops up in our list several times. Because we're using a list to represent the indices, we don't need a Maybe type, because failure can be represented as the empty list, which is very much synonymous to Nothing


--findIndex is like find, but it maybe returns the index of the first element that satisfies the predicate. findIndices returns the indices of all elements that satisfy the predicate in the form of a list.

-}


--zip and zipWith, zip together two lists, either in a tuple or with a binary function
-- if we want to zip together 3,4,..,7(n) lists or 3,4,..,7(n) lists with a function that takes 3,4,..,7(n) parameters, we have zip(n) and zipWith(n) etc.
--//There's also a very clever way for zipping infinite numbers of lists
{-
ghci> zipWith3 (\x y z -> x + y + z) [1,2,3] [4,5,2,2] [2,2,3]  
[7,9,8]  
ghci> zip4 [2,3,3] [2,2,2] [5,5,3] [2,2,2]  
[(2,2,5,2),(3,2,5,2),(3,2,3,2)] 
-}
-- lists that are longer than the shortest list that's being zipped are cut down to size


--lines takes a string and returns every line of that string as separate element of a list. useful function when dealing with files or input from somewhere
--'\n' is the character for a unix newline. Backslashes have special meaning in Haskell strings and characters.
--unlines is the inverse function of lines. It takes a list of strings and joins them together using a '\n'.
{-
ghci> lines "first line\nsecond line\nthird line"  
["first line","second line","third line"]
ghci> unlines ["first line", "second line", "third line"]  
"first line\nsecond line\nthird line\n" 
-}


--words and unwords are for splitting a line of text into words or joining a list of words into a text. Lists(strings) sep by ,
{-
ghci> words "hey these           are    the words in this\nsentence"  
["hey","these","are","the","words","in","this","sentence"]  
ghci> unwords ["hey","there","mate"]  
"hey there mate" 
-}


--nub, takes a list and weeds out the duplicate elements, returning a list whose every element is a unique.
{-
ghci> nub [1,2,3,4,3,2,1,2,3,4,3,2,1]  
[1,2,3,4]  
ghci> nub "Lots of words and stuff"  
"Lots fwrdanu" 
-}


--delete takes an element and a list and deletes the first occurrence of that element in the list.
{-
ghci> delete 'h' "hey there ghang!"  
"ey there ghang!"  
ghci> delete 'h' . delete 'h' $ "hey there ghang!"  
"ey tere ghang!" 
-}


-- \\ is the list difference function (acts like a set difference). For every element in the right-hand list, it removes a matching element in the left one.
{-
ghci> [1..10] \\ [2,5,9]  -- == delete 2 . delete 5 . delete 9 $ [1..10]
[1,3,4,6,7,8,10]  
ghci> "Im a big baby" \\ "big"  
"Im a  baby"
-}

--union (like a function on sets),returns the union of two lists. It goes over every element in the second list and appends it to the first one if it isn't already in yet. 
{-
ghci> "hey man" `union` "man what's up"  
"hey manwt'sup"  
ghci> [1..7] `union` [5..10]  
[1,2,3,4,5,6,7,8,9,10] 
-}

--If we use insert to insert into a sorted list, the resulting list will be kept sorted.
--intersect works like set intersection. It returns only the elements that are found in both lists.
{-
ghci> insert 4 [3,5,1,2,8,2]  
[3,4,5,1,2,8,2]
ghci> insert 4 [1,2,3,5,6,7]  
[1,2,3,4,5,6,7] 
-}


--length, take, drop, splitAt, !! and replicate have in common is that they take an Int as one of their parameters (or return an Int), even though they could be more generic and usable if they just took any type that's part of the Integral or Num typeclasses (depending on the functions).
--That's why Data.List has their more generic equivalents(with Num), named genericLength, genericTake, genericDrop, genericSplitAt, genericIndex and genericReplicate

--The nub, delete, union, intersect and group functions all have their more general counterparts called nubBy, deleteBy, unionBy, intersectBy and groupBy
--The difference between them is that the first set of functions use == to test for equality, whereas the By ones also take an equality function and then compare them by using that equality function. group is the same as groupBy (==)

-- eg.  we want is to group them by whether they are negative or not.
{-
ghci> let values = [-4.3, -2.4, -1.2, 0.4, 2.3, 5.9, 10.5, 29.1, 5.3, -2.4, -14.5, 2.9, 2.3]  
ghci> groupBy (\x y -> (x > 0) == (y > 0)) values  
[[-4.3,-2.4,-1.2],[0.4,2.3,5.9,10.5,29.1,5.3],[-2.4,-14.5],[2.9,2.3]] 
-}


--on function from Data.Function. 
on :: (b -> b -> c) -> (a -> b) -> a -> a -> c  
f `on` g = \x y -> f (g x) (g y)  
{-
ghci> groupBy ((==) `on` (> 0)) values  
[[-4.3,-2.4,-1.2],[0.4,2.3,5.9,10.5,29.1,5.3],[-2.4,-14.5],[2.9,2.3]] 
-}


--Similarly, the sort, insert, maximum and minimum also have their more general equivalents, sortBy, insertBy, maximumBy and minimumBy which take a function that determine if one element is greater, smaller or equal to the other


--Lists can be compared, they are lexicographically. If we have a list of lists and we want to sort it not based on the inner lists' contents but on their lengths-
{-
ghci> let xs = [[5,4,5,4,4],[1,2,3],[3,5,4,3],[],[2],[2,2]]  
ghci> sortBy (compare `on` length) xs  
[[],[2],[2,2],[1,2,3],[3,5,4,3],[5,4,5,4,4]]  
-}


--When you're dealing with By functions that take an equality function, you usually do (==) `on` something and when you're dealing with By functions that take an ordering function, you usually do compare `on` something.















