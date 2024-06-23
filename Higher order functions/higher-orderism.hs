--Functions can take functions as parameters and also return functions.


--a function that takes a function and then applies it twice to something!
applyTwice :: (a -> a) -> a -> a
applyTwice f x = f (f x)

{- type declaration: 
Before, we didn't need parentheses because -> is naturally right-associative. However, here, they're mandatory. 
They indicate that the first parameter is a function that takes something and returns that same thing. The second parameter is something of that type also and the return value is also of the same type. 
Not said in curried way here, this function takes two parameters and returns one thing. 
The first parameter is a function (of type a -> a) and the second is that same a. 
The function can also be Int -> Int or String -> String or whatever. But then, the second parameter to also has to be of that type. -}

--For simplicity's sake, we say- that functions take several parameters despite each function actually taking only one parameter and returning partially applied functions until we reach a function that returns a solid value.

--If our function requires us to pass it a function that takes only one parameter, we can just partially apply a function to the point where it takes only one parameter and then pass it.


--zipWith: takes a function and two lists as parameters and then joins the two lists by applying the function between corresponding elements. 
zipWith' :: (a -> b -> c) -> [a] -> [b] -> [c]
zipWith' _ [] _ = []
zipWith' _ _ [] = []
zipWith' f (x:xs) [y,ys] = f x y : zipWith' f xs [ys]

{-ghci> zipWith' (zipWith' (*)) [[1,2,3],[3,5,6],[2,3,4]] [[3,2,2],[3,4,5],[5,4,3]]
[[3,4,6],[9,20,30],[10,12,12]]-}


--Flip: takes a function and returns a function that is like our original function, only the first two arguments are flipped.
flip' :: (a -> b -> c) -> b -> a -> c
flip'  f x y = f y x




--or f = g
--      where g y x = f x y






