-- Pattern matching consists of specifying patterns to which some data should conform and then checking to see if it does and deconstructing the data according to those patterns.


-- When defining functions, you can define separate function bodies for different patterns.


--we wanted a function that says the numbers from 1 to 5 and says "Not between 1 and 5" for any other number:
sayMe :: (Integral a) => a -> String
sayMe 1 = "One!"
sayMe 2 = "Two!"
sayMe 3 = "Three!"
sayMe 4 = "Four!"
sayMe 5 = "Five!"
sayMe x = "Not between 1 and 5"


--factorial function recursively:
factorial :: (Integral a) => a -> a
factorial 0 = 1
factorial n = n * factorial (n - 1) 

--In Triples(fst and snd extract the components of pairs),
first :: (a, b, c) -> a
first (x, _, _) = x

second :: (a, b, c) -> b
second (_, y, _) = y

third :: (a, b, c) -> c
third (_, _, z) = z

-- _ ( same thing in list comprehensions), means that we really don't care what that part is, so we just write a _.


--implementation of the head function
head' :: [a] -> a
head' [] = error "Can't call head on an empty list, dummy!"
head' (x:_) = x

--if you want to bind to several variables (even if one of them is  _ ), we have to surround them in parentheses.

--error: function: takes a string and generates a runtime error, using that string as information about what kind of error occurred. It causes the program to crash, so it's not good to use it too much.


-- a trivial function that tells us some of the first elements of the list in (in)convenient English form.

tell :: (Show a) => [a] -> String
tell [] = "The list is empty"
tell (x:[]) = "The list has one element: " ++ show x
tell (x:y:[]) = "The list has two elements: " ++ show x ++ " and " ++ show y
tell (x:y:_) = "This list is long. The first two elements are: " ++ show x ++ " and " ++ show y
--(x:[]) and (x:y:[]) could be rewriten as [x] and [x,y] (because its syntatic sugar


length' :: (Num b) => [a] -> b
length' [] = 0
length' (_:xs) = 1 + length' xs


sum' :: (Num a) => [a] -> a 
sum' [] = 0
sum' (x:xs) = x + sum' xs


-- patterns: handy way of breaking something up according to a pattern and binding it to names whilst still keeping a reference to the whole thing.
-- by putting a name and an @ in front of a pattern, eg. xs@(x:y:ys)
--we use patterns to avoid repeating ourselves when matching against a bigger pattern.


{-
you can't use ++ in pattern matches. 
If you tried to pattern match against (xs ++ ys), what would be in the first and what would be in the second list? It doesn't make much sense. 
It would make sense to match stuff against (xs ++ [x,y,z]) or just (xs ++ [x]), but because of the nature of lists, you can't do that.
-}


-- patterns are a way of making sure a value conforms to some form and deconstructing it
-- guards are a way of testing whether some property of a value (or several of them) are true or false.





