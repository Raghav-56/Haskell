-- $ function: function application
($) :: (a -> b) -> a -> b  
f $ x = f x  

--Whereas normal function application (putting a space between two things) has a really high precedence, the $ function has the lowest precedence. 
--Function application with a space is left-associative (so f a b c is the same as ((f a) b) c)), function application with $ is right-associative (so f a b c is the same as ((f (a (b c)).


--it's a convenient function so that we don't have to write so many parentheses. 
--When a $ is encountered, the expression on its right is applied as the parameter to the function on its left
-- you can imagine a $ being sort of the equivalent of writing an opening parentheses and then writing a closing one on the far right side of the expression. 
--lowest precedence, f (g (z x)) is equal to f $ g $ z x


-- function application can be treated just like another function. That way, we can, for instance, map function application over a list of (*partial) functions.
{-
ghci> map ($ 3) [(4+), (10*), (^2), sqrt]  
[7.0,30.0,9.0,1.7320508075688772] 
-}










