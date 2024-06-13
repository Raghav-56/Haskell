lostNumbers = [4,8,15,16,23,42]
ln = lostNumbers
h = ['H','e','l','l','o']
w = ['W','o','r','l','d']
r = "Raghav"
a = [1,2,3]
b = [4,5,6]


{-ghci> h++' ':r
"Hello Raghav"-}


{-
head takes a list and returns its head. The head of a list is basically its first element.

ghci> head [5,4,3,2,1]
5 
tail takes a list and returns its tail. In other words, it chops off a list's head.

ghci> tail [5,4,3,2,1]
[4,3,2,1] 
last takes a list and returns its last element.

ghci> last [5,4,3,2,1]
1 
init takes a list and returns everything except its last element.

ghci> init [5,4,3,2,1]
[5,4,3,2] 
-}


{-
length takes a list and returns its length, obviously.

ghci> length [5,4,3,2,1]
5
null checks if a list is empty. If it is, it returns True, otherwise it returns False. Use this function instead of xs == [] (if you have a list called xs)

ghci> null [1,2,3]
False
ghci> null []
True
-}


{-
reverse reverses a list.

ghci> reverse [5,4,3,2,1]
[1,2,3,4,5]
-}


{-
concat concatenates two lists.

ghci> concat [1,2,3] [4,5,6]
[1,2,3,4,5,6]
-}


{-
take takes number and a list. It extracts that many elements from the beginning of the list. Watch.

ghci> take 3 [5,4,3,2,1]
[5,4,3]
ghci> take 1 [3,9,3]
[3]
ghci> take 5 [1,2]
[1,2]
ghci> take 0 [6,6,6]
[]


drop works in a similar way, only it drops the number of elements from the beginning of a list.

ghci> drop 3 [8,4,2,1,5,6]
[1,5,6]
ghci> drop 0 [1,2,3,4]
[1,2,3,4]
ghci> drop 100 [1,2,3,4]
[] 
-}


{-
maximum takes a list of stuff that can be put in some kind of order and returns the biggest element.

minimum returns the smallest.

ghci> minimum [8,4,2,1,5,6]
1
ghci> maximum [1,9,2,3,4]
9 
-}


{-
sum takes a list of numbers and returns their sum.

product takes a list of numbers and returns their product.

ghci> sum [5,2,1,6,3,2,5,7]
31
ghci> product [6,2,1,2]
24
ghci> product [1,2,5,6,7,9,2,0]
0
-}


{-
elem takes a thing and a list of things and tells us if that thing is an element of the list. It's usually called as an infix function because it's easier to read that way.

ghci> 4 `elem` [3,4,5,6]
True
ghci> 10 `elem` [3,4,5,6]
False
-}


-- http://learnyouahaskell.com/modules#data-list