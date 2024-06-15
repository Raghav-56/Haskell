doubleMe x = x + x
doubleUs x y = x*2 + y*2
doubleus x y = doubleMe x + doubleMe y



doubleSmallNumber x = if x > 100
                        then x
                        else x*2 


doubleSmallNumber' x = (if x > 100 then x else x*2) + 1


-- && means a boolean and, || means a boolean or. not negates a True or a False.

{-
infix function: we call it by sandwiching it between arguments (usually numbers).
prefix functions: In most imperative languages functions are called by writing the function name and then writing its parameters in parentheses, usually separated by commas. In Haskell, functions are called by writing the function name, a space and then the parameters, separated by spaces.
-}


{-
ghci> succ 8
9 
The succ function takes anything that has a defined successor and returns that successor.
-}


{-
The functions min and max take two things that can be put in an order (like numbers!). min returns the one that's lesser and max returns the one that's greater.

ghci> min 9 10
9
ghci> max 100 101
101 
-}


--Function application (calling a function by putting a space after it and then typing out the parameters) has the highest precedence of them all.




--------------------------------------------------------------------------------


{-
-- `compare`: The compare function takes two Ord members of the same type and returns an ordering. 
--            Ordering is a type that can be GT, LT or EQ, meaning greater than, lesser than and equal, respectively

ghci> "Abrakadabra" < "Zebra"
True
ghci> "Abrakadabra" `compare` "Zebra"
LT
ghci> 5 >= 2
True
ghci> 5 `compare` 3
GT
-}
