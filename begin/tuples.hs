--used when you know exactly how many and of what type values you want to combine
--Type of Tuples  depends on how many components it has and the types of the components.

vectors = [(0,0),(1,0),(1,1),(0,1)]
name&age = [("raghav","gupta",18),("ram","sharma",18)]


--there's no such thing as a singleton tuple.


--tuples can be compared with each other if their components can be compared. 
--Only you can't compare two tuples of different sizes


{-
--these functions operate only on pairs

fst: takes a pair and returns its first component.
ghci> fst (8,11)
8
ghci> fst ("Wow", False)
"Wow"

snd: takes a pair and returns its second component.
ghci> snd (8,11)
11
ghci> snd ("Wow", False)
False


--Zip: Produces a list of pairs.
--It takes two lists and then zips them together into one list by joining the matching elements into pairs.
ghci> zip [1,2,3,4,5] [5,5,5,5,5]
[(1,5),(2,5),(3,5),(4,5),(5,5)]
ghci> zip [1 .. 5] ["one", "two", "three", "four", "five"]
[(1,"one"),(2,"two"),(3,"three"),(4,"four"),(5,"five")]

--if the lengths of the lists don't match, The longer list simply gets cut off to match the length of the shorter one.
ghci> zip [5,3,2,6,2,7,2,5,4,6,6] ["im","a","turtle"]
[(5,"im"),(3,"a"),(2,"turtle")]

--Because Haskell is lazy, we can zip finite lists with infinite lists:
ghci> zip [5,3,2,6,2,7,2,5,4,6,6] ["im","a","turtle"]
[(5,"im"),(3,"a"),(2,"turtle")]

-}



