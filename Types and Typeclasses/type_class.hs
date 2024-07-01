{-

--A typeclass: is a sort of interface that defines some behavior. (class of type). Apply constraints to type variables.
--If a type is a part of a typeclass, that means that it supports and implements the behavior the typeclass describes.

-}

{-
--If a function is comprised only of special characters, it's considered an infix function by default. 
--eg ==, +, *, -, / and pretty much all operators
--If we want to examine their type, pass them on to another function or call it as a prefix function, we have to surround it in parentheses.
-}


{-
--* ghci> :t (==)
--(==) :: (Eq a) => a -> a -> Bool

--Everything before the => symbol is called a class constraint.
--We can read the previous type declaration like this: the equality function takes any two values that are of the same type and returns a Bool. The type of those two values must be a member of the Eq class (this was the class constraint).


--The Eq: typeclass provides an interface for testing for equality. Any type where it makes sense to test for equality between two values of that type should be a member of the Eq class.
--All standard Haskell types except for IO (the type for dealing with input and output) and functions are a part of the Eq typeclass.


--Ord: is for types that have an ordering.

--* ghci> :t (>)
--(>) :: (Ord a) => a -> a -> Bool

--All the types we covered so far except for functions are part of Ord. Ord covers all the standard comparing functions such as >, <, >= and <=.
--The `compare` function takes two Ord members of the same type and returns an ordering. Ordering is a type that can be GT, LT or EQ, meaning greater than, lesser than and equal, respectively.

--To be a member of Ord, a type must first be Eq.


--Members of Show: can be presented as strings.
--All types covered so far except for functions are a part of Show. 
--show(function.): takes a value whose type is a member of Show(typeclass) and presents it to us as a string.
--* ghci> :t show
--show :: Show a => a -> String

-- Read (opposite of Show).
--read(function): takes a string and returns a type which is a member of Read(typeclass).
--* ghci> :t read
--read :: Read a => String -> a


{-
Most expressions are such that the compiler can infer what their type is by itself. 
But sometimes, the compiler doesn't know whether to return a value of type Int or Float for an expression like read "5". 
To see what the type is, Haskell would have to actually evaluate read "5". 
But since Haskell is a statically typed language, it has to know all the types before the code is compiled (or in the case of * GHCI, evaluated). 
So we have to tell Haskell: "Hey, this expression should have this type, in case you don't know!".


Type annotations, are a way of explicitly saying what the type of an expression should be. 
We do that by adding :: at the end of the expression and then specifying a type.

* ghci> read "5" :: Int
5
* ghci> read "5" :: Float
5.0
* ghci> (read "5" :: Float) * 4
20.0
* ghci> read "[1,2,3,4]" :: [Int]
[1,2,3,4]
* ghci> read "(3, 'a')" :: (Int, Char)
(3, 'a')
-}


--Enum: members are sequentially ordered types — they can be enumerated.
--We can use its types in list ranges. 
--They also have defined successors and predecessors, which you can get with the succ and pred functions. 
--Types in this class: (), Bool, Char, Ordering, Int, Integer, Float and Double.


--Bounded: members have an upper and a lower bound.
{-
* ghci> minBound :: Int
-2147483648
* ghci> maxBound :: Char
'\1114111'
* ghci> maxBound :: Bool
True
* ghci> minBound :: Bool
False
-}
--minBound and maxBound are interesting because they have a type of (Bounded a) => a. In a sense they are polymorphic constants.
--All tuples are also part of Bounded if the components are also in it.


--Num: is a numeric typeclass. Its members have the property of being able to act like numbers.
--whole numbers are also polymorphic constants.
{-
* ghci> 20 :: Int
20
* ghci> 20 :: Integer
20
* ghci> 20 :: Float
20.0
* ghci> 20 :: Double
20.0
-}
--If we examine the type of *, we'll see that it accepts all numbers.
--* ghci> :t (*)
--(*) :: (Num a) => a -> a -> a

--To join Num, a type must already be friends with Show and Eq.

--Integral: is also a numeric typeclass. Num includes all numbers, including real numbers and integral numbers, Integral includes only integral (whole) numbers. In this typeclass are Int and Integer.
-- ! not Interger Integral

--Floating includes only floating point numbers, so Float and Double.


--takes Integral gives Num
fromIntegral :: (Num b, Integral a) => a -> b
-- fromIntegral a = a

-- length :: [a] -> Int   --not, length :: (Num b) =>  [a] -> b   (historical reasons)

{-
* ghci> (length [1,2,3,4]) + 3.2

<interactive>:3:22: error:
    • No instance for (Fractional Int) arising from the literal ‘3.2’
    • In the second argument of ‘(+)’, namely ‘3.2’
      In the expression: (length [1, 2, 3, 4]) + 3.2
      In an equation for ‘it’: it = (length [1, 2, 3, ....]) + 3.2

* ghci> fromIntegral (length [1,2,3,4]) + 3.2
7.2
-}



--several class constraints are separated by commas inside the parentheses.

-}



-------------------------------------------------------------------------------



-- The Maybe type encapsulates an optional value, which either contains a value of type a (represented as Just a), or it is empty (represented as Nothing). 
--Using Maybe is a good way to deal with errors or exceptional cases without resorting to drastic measures such as error.







