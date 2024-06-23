{-
--From this to that == [this..that]

* ghci> [1..100]
[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100]   

* ghci> ['a'..'z']
"abcdefghijklmnopqrstuvwxyz"

* ghci> ['A'..'Z']
"ABCDEFGHIJKLMNOPQRSTUVWXYZ"


--you can also specify one and only one 'step', 
--first,second...last.

* ghci> [1,3..20]
[1,3,5,7,9,11,13,15,17,19]
* ghci> [2,4..20]
[2,4,6,8,10,12,14,16,18,20]


* ghci> [20..1]
[]
* ghci> [20,19..1]
[20,19,18,17,16,15,14,13,12,11,10,9,8,7,6,5,4,3,2,1]


Watch out when using floating point numbers in ranges! Because they are not completely precise (by definition), their use in ranges can yield some pretty funky results.

* ghci> [0.1, 0.3 .. 1]
[0.1,0.3,0.5,0.7,0.8999999999999999,1.0999999999999999]


--You can also use ranges to make infinite lists by just not specifying an upper limit.

--get the first 24 multiples of 13. [13,26..24*13] == take 24 [13,26..].
--Because Haskell is lazy, it won't try to evaluate the infinite list immediately because it would never finish. It'll wait to see what you want to get out of that infinite lists. And here it sees you just want the first 24 elements and it gladly obliges.

--cycle takes a list and cycles it into an infinite list.
* ghci> take 10 (cycle [1,2,3])
[1,2,3,1,2,3,1,2,3,1]
--not just list
* ghci> take 3*4 (cycle "LOL ")
"LOL LOL LOL "

--repeat takes an element and produces an infinite list of just that element
* ghci> take 10 (repeat 5)
[5,5,5,5,5,5,5,5,5,5]

--repeat takes an number and element and produces an list of just that element that no. of times


-}
