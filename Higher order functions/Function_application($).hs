-- $ function: function application
($) :: (a -> b) -> a -> b  
f $ x = f x  

--Whereas normal function application (putting a space between two things) has a really high precedence, the $ function has the lowest precedence. 
--Function application with a space is left-associative (so f a b c is the same as ((f a) b) c)), function application with $ is right-associative (so f a b c is the same as ((f (a (b c)).


--it's a convenience function so that we don't have to write so many parentheses. 
--When a $ is encountered, the expression on its right is applied as the parameter to the function on its left









