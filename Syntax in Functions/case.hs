--case syntax:  taking a variable and then executing blocks of code for specific values of that variable and then maybe including a catch-all block of code in case the variable has some value for which we didn't set up a case.


--case expressions are, well, expressions, much like if else expressions and let bindings. 
--Not only can we evaluate expressions based on the possible cases of the value of a variable, we can also do pattern matching.


--the syntax for case expressions is pretty simple:
{-}
case expression of  pattern -> result
                    pattern -> result
                    pattern -> result
                    ...
-}                
head' :: [a] -> a
head' xs = case xs of   [] -> error "No head for empty lists!"
                        (x:_) -> x

--the first pattern that matches the expression is used. If it falls through the whole case expression and no suitable pattern is found, a runtime error occurs.

--Whereas pattern matching on function parameters can only be done when defining functions, case expressions can be used pretty much anywhere.

describeList :: [a] -> String
describeList xs = "The list is " ++ case xs of  [] -> "empty."
                                                [x] -> "a singleton list." 
                                                xs -> "a longer list."
--useful for pattern matching against something in the middle of an expression. 

describeList' :: [a] -> String
describeList' xs = "The list is " ++ what xs
    where   what [] = "empty."
            what [x] = "a singleton list."
            what xs = "a longer list."






