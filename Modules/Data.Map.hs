import qualified Data.Map as Map
import Data.IntMap.Lazy (fromList)

--Association lists (also called dictionaries) are lists, used to store key-value pairs where ordering doesn't matter.
-- Unordered list of ordered pairs (tuples,2)

--eg. phoneBook to store phone numbers, where phone numbers = values and people's names = keys.
phoneBook :: [(String, String)]
phoneBook = 
    [("amelia","555-2938")  
    ,("amelia","342-2492")  
    ,("freya","452-2928")
    ,("isabella","493-2928")  
    ,("isabella","943-2929")  
    ,("isabella","827-9162")  
    ,("neil","205-2928")  
    ,("roald","939-8282")  
    ,("tenzing","853-2492")  
    ,("tenzing","555-2111")  
    ] 


-- looking up some value by key
findKey' :: (Eq k) => k -> [(k,v)] -> v 
findKey' key = snd . head . filter (\(k,v) -> k == key)

findKey'' :: (Eq k) => k -> [(k,v)] -> Maybe v 
findKey'' key [] = Nothing
findKey'' key ((k,v):xs) =   if key == k
                            then Just v
                            else findKey'' key xs

-- The Maybe type encapsulates an optional value, which either contains a value of type a (represented as Just a), or it is empty (represented as Nothing). 
--Using Maybe is a good way to deal with errors or exceptional cases without resorting to drastic measures such as error.


-- ! Note: It's usually better to use folds for this standard list recursion pattern instead of explicitly writing the recursion because they're easier to read and identify. 
-- Everyone knows it's a fold when they see the foldr call, but it takes some more thinking to read explicit recursion.

findKey''' :: (Eq k) => k -> [(k,v)] -> Maybe v  
findKey''' key = foldr (\(k,v) acc -> if key == k then Just v else acc) Nothing  

{-
ghci> findKey "amelia" phoneBook  
Just "555-2938"  
ghci> findKey "christopher" phoneBook  
Nothing  
-}

-- lookup function from Data.List |^^| 
--maps <-=~ association lists.


-- The fromList function takes an association list (in the form of a list) and returns a map with the same associations.
{-
ghci> Map.fromList [("amelia","555-2938"),("freya","452-2928"),("neil","205-2928")]  
fromList [("amelia","555-2938"),("freya","452-2928"),("neil","205-2928")]  
ghci> Map.fromList [(1,2),(3,4),(3,2),(5,5)]  
fromList [(1,2),(3,2),(5,5)] 
-}
--If there are duplicate keys in the original association list, the duplicates are just discarded. 

-- * Map.fromList :: (Ord k) => [(k, v)] -> Map.Map k v


-- ! You should always use Data.Map for key-value associations unless you have keys that aren't part of the Ord typeclass.


--empty represents an empty map. It takes no arguments, it just returns an empty map.
{-  ghci> Map.empty  
    fromList []     -}


--insert takes a key, a value and a map and returns a new map that's just like the old one, only with the key and value inserted.
{-
ghci> Map.insert 3 100 Map.empty  
fromList [(3,100)]  
ghci> Map.insert 5 600 (Map.insert 4 200 ( Map.insert 3 100  Map.empty))  
fromList [(3,100),(4,200),(5,600)]  
ghci> Map.insert 5 600 . Map.insert 4 200 . Map.insert 3 100 $ Map.empty  
fromList [(3,100),(4,200),(5,600)]  
-}

fromList' :: (Ord k) => [(k,v)] -> Map.Map k v
fromList' = foldl (\acc (k,v) -> Map.insert k v acc) Map.empty


--null checks if a map is empty.
{-
ghci> Map.null Map.empty  
True  
ghci> Map.null $ Map.fromList [(2,3),(5,5)]  
False  
-}

--size reports the size of a map.
{-
ghci> Map.size Map.empty  
0  
ghci> Map.size $ Map.fromList [(2,4),(3,3),(4,2),(5,4),(6,4)]  
5  
-}


--singleton takes a key and a value and creates a map that has exactly one mapping.
{-
ghci> Map.singleton 3 9  
fromList [(3,9)]  
ghci> Map.insert 5 9 $ Map.singleton 3 9  
fromList [(3,9),(5,9)]
-}


-- lookup works like the Data.List lookup, only it operates on maps. It returns Just something if it finds something for the key and Nothing if it doesn't.

-- member is a predicate that takes a key and a map and reports whether the key is in the map or not.

--map and filter work much like their list equivalents.
{-
ghci> Map.map (*100) $ Map.fromList [(1,1),(2,4),(3,9)]  
fromList [(1,100),(2,400),(3,900)]  
ghci> Map.filter isUpper $ Map.fromList [(1,'a'),(2,'A'),(3,'b'),(4,'B')]  
fromList [(2,'A'),(4,'B')]  
-}


-- toList is the inverse of fromList.
{-
ghci> Map.toList . Map.insert 9 2 $ Map.singleton 4 3  
[(4,3),(9,2)]  
-}

--keys and elems return lists of keys and values respectively. 
--keys is the equivalent of map fst . Map.toList and 
--elems is the equivalent of map snd . Map.toList.


--fromListWith acts like fromList, only it doesn't discard duplicate keys but it uses a function supplied to it to decide what to do with them.

--eg. for ppl with multiple phone numbers
phoneBookToMap :: (Ord k) => [(k, String)] -> Map.Map k String  
phoneBookToMap = Map.fromListWith $ \number1 number2 -> number1 ++ ", " ++ number2

phoneBookToMap' :: (Ord k) => [(k, a)] -> Map.Map k [a] 
phoneBookToMap' = Map.fromListWith (++) . map (\(k,v) -> (k,[v])) 

{-
ghci> Map.lookup "isabella" $ phoneBookToMap phoneBook  
["827-9162","943-2929","493-2928"] 

ghci> Map.fromListWith max [(2,3),(2,5),(2,100),(3,29),(3,22),(3,11),(4,22),(4,15)]  
fromList [(2,100),(3,29),(4,22)] 
ghci> Map.fromListWith (+) [(2,3),(2,5),(2,100),(3,29),(3,22),(3,11),(4,22),(4,15)]  
fromList [(2,108),(3,62),(4,37)] 
-}


--insertWith is to insert what fromListWith is to fromList. It inserts a key-value pair into a map, but if that map already contains the key, it uses the function passed to it to determine what to do.
{-
ghci> Map.insertWith (+) 3 100 $ Map.fromList [(3,4),(5,103),(6,339)]  
fromList [(3,104),(5,103),(6,339)]  
-}

-- <> https://hackage.haskell.org/package/containers/docs/Data-Map.html











