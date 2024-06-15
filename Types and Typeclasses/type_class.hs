{-

--A typeclass: is a sort of interface that defines some behavior. 
--If a type is a part of a typeclass, that means that it supports and implements the behavior the typeclass describes.

{-
--If a function is comprised only of special characters, it's considered an infix function by default. 
--eg ==, +, *, -, / and pretty much all operators
--If we want to examine their type, pass them on to another function or call it as a prefix function, we have to surround it in parentheses.
-}


{-
--ghci> :t (==)
--(==) :: (Eq a) => a -> a -> Bool

--Everything before the => symbol is called a class constraint.
--We can read the previous type declaration like this: the equality function takes any two values that are of the same type and returns a Bool. The type of those two values must be a member of the Eq class (this was the class constraint).
--The Eq typeclass provides an interface for testing for equality. Any type where it makes sense to test for equality between two values of that type should be a member of the Eq class. All standard Haskell types except for IO (the type for dealing with input and output) and functions are a part of the Eq typeclass.


--Ord is for types that have an ordering.

--ghci> :t (>)
--(>) :: (Ord a) => a -> a -> Bool

--All the types we covered so far except for functions are part of Ord. Ord covers all the standard comparing functions such as >, <, >= and <=, `compare`.

--To be a member of Ord, a type must first have membership in Eq club.







-}




-}


