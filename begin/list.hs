lostNumbers = [4,8,15,16,23,42]
ln = lostNumbers
h = ['H','e','l','l','o']
w = ['W','o','r','l','d']
r = "Raghav"
a = [1,2,3]
b = [4,5,6]


{-ghci> h++' ':r
"hello raghav"-}


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
