--Every function in Haskell officially only takes one parameter.

--All the functions that accepted several parameters so far have been curried functions. 
{- eg.
Doing max 4 5 first creates a function that takes a parameter and returns either 4 or that parameter, depending on which is bigger. 
Then, 5 is applied to that function and that function produces our desired result. 

The following two calls are equivalent:
ghci> max 4 5
5
ghci> (max 4) 5
5
-}
--the type of max is max :: (Ord a) => a -> a -> a. That can also be written as max :: (Ord a) => a -> (a -> a). 
--That could be read as: max takes an a and returns (that's the ->) a function that takes an a and returns an a. 
--That's why the return type and the parameters of functions are all simply separated with arrows. 

--Putting a space between two things is simply function application. 
--The space is sort of like an operator and it has the highest precedence.


--Partial application: calling a function with too few parameters, we get back a partially applied function, meaning a function that takes as many parameters as we left out. 
-- # too few parameters == no. parameters (given when calling < asked in definition))
--Using partial application is a neat way to create functions on the fly so we can pass them to another function or to seed them with some data.

--eg.
multThree :: (Num a) => a -> a -> a -> a
multThree x y z = x * y * z
{-
ghci> let multTwoWithNine = multThree 9

ghci> multTwoWithNine 2 3
54
ghci> let multWithEighteen = multTwoWithNine 2
ghci> multWithEighteen 10
180
-}


--Infix functions can also be partially applied by using sections. 
--To section an infix function, simply surround it with parentheses and only supply a parameter on one side. That creates a function that takes one parameter and then applies it to the side that's missing an operand.
{-
divideByTen :: (Floating a) => a -> a
divideByTen = (/10)
--Calling, say, divideByTen 200 is equivalent to doing 200 / 10, as is doing (/10) 200.
-}


--if we try to just do Partial application in GHCI directly instead of binding it to a name with a let or passing it to another function, 
--It will tell us that the expression produced a function of type a -> a but it doesn't know how to print it to the screen. 
-- GHCi passes everything to the show function by default.
--Functions aren't instances of the Show typeclass, so we can't get a neat string representation of a function.















