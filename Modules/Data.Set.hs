import qualified Data.Set as Set









-- The Data.Set module offers us, sets. 
--Like sets from mathematics, Sets are kind of like a cross between lists and maps. 
--All the elements in a set are unique and ordered (internally implemented with trees (much like maps in Data.Map))


--Checking for membership, inserting, deleting, etc. is much faster than doing the same thing with lists. 


text1 = "I just had an anime dream. Anime... Reality... Are they so different?"  
text2 = "The old man left his garbage can out and now his trash is all over my lawn!"


--The fromList function works much like you would expect. It takes a list and converts it into a set.

{-
ghci> let set1 = Set.fromList text1  
ghci> let set2 = Set.fromList text2  
ghci> set1  
fromList " .?AIRadefhijlmnorstuy"  
ghci> set2  
fromList " !Tabcdefghilmnorstuvwy"  

-- the items are ordered and each element is unique.
-}

{-
--intersection function 
ghci> Set.intersection set1 set2  
fromList " adefhilmnorstuy"

--the difference function to see which letters are in the first set but aren't in the second one and vice versa.
ghci> Set.difference set1 set2  
fromList ".?AIRj"  
ghci> Set.difference set2 set1  
fromList "!Tbcgvw"  

-- see all the unique letters used in both sentences by using union.
ghci> Set.union set1 set2  
fromList " !.?AIRTabcdefghijlmnorstuvwy"  

--The null, size, member, empty, singleton, insert and delete functions all work like you'd expect them to.
ghci> Set.null Set.empty  
True  
ghci> Set.null $ Set.fromList [3,4,5,5,4,3]  
False  
ghci> Set.size $ Set.fromList [3,4,5,3,4,5]  
3  
ghci> Set.singleton 9  
fromList [9]  
ghci> Set.insert 4 $ Set.fromList [9,3,8,1]  
fromList [1,3,4,8,9]  
ghci> Set.insert 8 $ Set.fromList [5..10]  
fromList [5,6,7,8,9,10]  
ghci> Set.delete 4 $ Set.fromList [3,4,5,4,3,4,5]  
fromList [3,5]  


--We can also check for subsets or proper subset.
-- Set A is a subset of set B if B contains all the elements that A does. 
-- Set A is a proper subset of set B if B contains all the elements that A does but has more elements.
ghci> Set.fromList [2,3,4] `Set.isSubsetOf` Set.fromList [1,2,3,4,5]  
True  
ghci> Set.fromList [1,2,3,4,5] `Set.isSubsetOf` Set.fromList [1,2,3,4,5]  
True  
ghci> Set.fromList [1,2,3,4,5] `Set.isProperSubsetOf` Set.fromList [1,2,3,4,5]  
False  
ghci> Set.fromList [2,3,4,8] `Set.isSubsetOf` Set.fromList [1,2,3,4,5]  
False  

--We can also map over sets and filter them.
ghci> Set.filter odd $ Set.fromList [3,4,5,6,7,2,3,4]  
fromList [3,5,7]  
ghci> Set.map (+1) $ Set.fromList [3,4,5,6,7,2,3,4]  
fromList [3,4,5,6,7,8] 

-}


-- Sets are often used to weed a list of duplicates from a list by first making it into a set with fromList and then converting it back to a list with toList. 
--The Data.List function nub already does that, but weeding out duplicates for large lists is much faster if you cram them into a set and then convert them back to a list than using nub.
-- But using nub only requires the type of the list's elements to be part of the Eq typeclass, whereas if you want to cram elements into a set, the type of the list has to be in Ord.

{-
ghci> let setNub xs = Set.toList $ Set.fromList xs  
ghci> setNub "HEY WHATS CRACKALACKIN"  
" ACEHIKLNRSTWY"  
ghci> nub "HEY WHATS CRACKALACKIN"  
"HEY WATSCRKLIN"  
-}

setNub :: Ord a => [a] -> [a]
setNub = Set.toList . Set.fromList

--setNub is generally faster than nub on big lists but as you can see, nub preserves the ordering of the list's elements, while setNub does not.









