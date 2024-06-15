-- Haskell has a `static type system`: The type of every expression is known at compile time, safer code!
--Everything in Haskell has a type(lable of category).
--Types are written in capital case
--Type inference: we don't have to explicitly write out the types of our functions and expressions to get things done. It can infer that on its own


-- doing :t on an expression prints out the expression followed by :: and its type.
{-
ghci> :t 'a'
'a' :: Char
ghci> :t True
True :: Bool
ghci> :t "HELLO!"
"HELLO!" :: [Char]
ghci> :t (True, 'a')
(True, 'a') :: (Bool, Char)
ghci> :t 4 == 5
4 == 5 :: Bool
-}

-- :: is read as "has type of".

-- Functions also have types(Functions are expressions too).
--When writing our own functions, we can give them an explicit type declaration. good practice except when writing very short functions.


--The parameters are separated with -> and there's no special distinction between the parameters and the return type.
--The return type is the last item in the declaration and the parameters are the first.



--Int stands for integer. It's used for whole numbers. Int is bounded, which means that it has a minimum and a maximum value.
--Integer stands for, er … also integer. It's not bounded so it can be used to represent really really big numbers.
--Efficiency int>integer

-- Float is a real floating point with single precision.
-- Double is a real floating point with double the precision!

--Bool is a boolean type. It can have only two values: True and False.

--Char represents a character. It's denoted by single quotes: '*char' .
--A list of characters is a string. "*string"==['char'] .

--Tuples are types but they are dependent on their length as well as the types of their components, 
--so there is theoretically an infinite number of tuple types
--The empty tuple () is also a type which can only have a single value: ()


--eg.

factorial :: Integer -> Integer
factorial n = product [1..n]

circumference :: Float -> Float
circumference r = 2 * pi * r
--ghci> circumference 4.0
--25.132742


