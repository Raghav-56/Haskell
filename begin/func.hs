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