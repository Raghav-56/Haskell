-- && means a boolean and, || means a boolean or. not negates a True or a False.

-- In most imperative languages functions are called by writing the function name and then writing its parameters in parentheses, usually separated by commas. In Haskell, functions are called by writing the function name, a space and the parameters, separated by spaces( ).
{-
infix function: can be called by sandwiching it between arguments (usually numbers) x infix y. For calling as prefix we have to enclose it between brackets- (infix) x y. includes all functions comprised only of special characters
prefix functions: can be called by function name then arguments prefix x y. For calling as infix we have to enclose it between backticks- x `prefix` y.
-}


{- <>
* ghci> succ 8
9 
The succ function takes anything that has a defined successor and returns that successor.

* ghci> pred 8
7
The pred function takes anything that has a defined predecessor and returns that predecessor.
-}


{-
The functions min and max take two things that can be put in an order (like numbers!). min returns the one that's lesser and max returns the one that's greater.

* ghci> min 9 10
9
* ghci> max 100 101
101 
-}


--Function application (calling a function by putting a space after it and then typing out the parameters) has the highest precedence of them all.



--------------------------------------------------------------------------------



doubleMe x = x + x
doubleUs x y = x*2 + y*2
doubleus x y = doubleMe x + doubleMe y



doubleSmallNumber x = if x > 100
                        then x
                        else x*2 
-- if... then... else ...


doubleSmallNumber' x = (if x > 100 then x else x*2) + 1





--------------------------------------------------------------------------------
--------------------------------------------------------------------------------




{-
-- `compare`: The compare function takes two Ord members of the same type and returns an ordering. 
--            Ordering is a type that can be GT, LT or EQ, meaning greater than, lesser than and equal, respectively

{-
* ghci> "Abrakadabra" < "Zebra"
True
* ghci> "Abrakadabra" `compare` "Zebra"
LT
* ghci> 5 >= 2
True
* ghci> 5 `compare` 3
GT
-}



-- show: takes a value whose type is a member of Show and presents it to us as a string.

{-
* ghci> show 3
"3"
* ghci> show 5.334
"5.334"
* ghci> show True
"True"
-}


-- read (opposite of Show): takes a string and returns a type which is a member of Read.

{-
* ghci> read "True" || False
True
* ghci> read "8.2" + 3.8
12.0
* ghci> read "5" - 2
3
* ghci> read "[1,2,3,4]" ++ [3]
[1,2,3,4,3]
-}





-}



