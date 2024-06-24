-- Pattern matching consists of specifying patterns to which some data should conform and then checking to see if it does and deconstructing the data according to those patterns.
--Should a pattern match fail, it will just move on to the next element.


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


--When making patterns, we should always include a catch-all pattern so that our program doesn't crash if we get some unexpected input. eg. x and n above.


--can also be used on tuples.

addVectors :: (Num a) => (a, a) -> (a, a) -> (a, a)
addVectors a b = (fst a + fst b, snd a + snd b)
-- this instead- 
addVectors' :: (Num a) => (a, a) -> (a, a) -> (a, a)
addVectors' (x1, y1) (x2, y2) = (x1 + x2, y1 + y2)


--In Triples(fst and snd extract the components of pairs),
first :: (a, b, c) -> a
first (x, _, _) = x

second :: (a, b, c) -> b
second (_, y, _) = y

third :: (a, b, c) -> c
third (_, _, z) = z

-- _ (same as in list comprehensions), means that we really don't care what that part is, so we just write a _.


--you can also pattern match in list comprehensions.
{-
* ghci> let xs = [(1,3), (4,3), (2,4), (5,3), (5,6), (3,1)]
* ghci> [a+b | (a,b) <- xs]
[4,7,6,8,11,4]
-}


--Lists themselves can also be used in pattern matching.
-- You can match with the empty list [] or any pattern that involves : and the empty list. 
--But since [1,2,3] is just syntactic sugar for 1:2:3:[], you can also use the former pattern. 
--A pattern like x:xs will bind the head of the list to x and the rest of it to xs, even if there's only one element so xs ends up being an empty list. Similarly, x:y:z:zs.

--implementation of the head function:
head' :: [a] -> a
head' [] = error "Can't call head on an empty list, dummy!"
head' (x:_) = x
--if you want to bind to several variables (even if one of them is  _ ), we have to surround them in parentheses. This is not for tuple !!

--error: function takes a string and generates a runtime error, using that string as information about what kind of error occurred. 
--It causes the program to crash, so it's not good to use it too much.


-- a trivial function that tells us some of the first elements of the list in (in)convenient English form.
tell :: (Show a) => [a] -> String
tell [] = "The list is empty"
tell (x:[]) = "The list has one element: " ++ show x
tell (x:y:[]) = "The list has two elements: " ++ show x ++ " and " ++ show y
tell (x:y:_) = "This list is long. The first two elements are: " ++ show x ++ " and " ++ show y
--(x:[]) and (x:y:[]) could be rewriten as [x] and [x,y], 


length' :: (Num b) => [a] -> b
length' [] = 0
length' (_:xs) = 1 + length' xs


sum' :: (Num a) => [a] -> a 
sum' [] = 0
sum' (x:xs) = x + sum' xs


-- patterns:(notice s) handy way of breaking something up according to a pattern and binding it to names whilst still keeping a reference to the whole thing.
-- by putting a name and an @ in front of a pattern, eg. xs@(x:y:ys)
--we use patterns to avoid repeating ourselves when matching against a bigger pattern, when we have to use the whole thing again in the function body.
--eg.
capital :: String -> String
capital "" = "Empty string, whoops!"
capital all@(x:xs) = "The first letter of " ++ all ++ " is " ++ [x]
{-
* ghci> capital "Dracula"
"The first letter of Dracula is D"
-}


--you can't use ++ in pattern matches. 
--If you tried to pattern match against (xs ++ ys), what would be in the first and what would be in the second list? It doesn't make much sense. 
--It would make sense to match stuff against (xs ++ [x,y,z]) or just (xs ++ [x]), but because of the nature of lists, you can't do that.



-- patterns are a way of making sure a value conforms to some form and deconstructing it
-- guards are a way of testing whether some property of a value (or several of them) are true or false.
-- cont.




