-- patterns are a way of making sure a value conforms to some form and deconstructing it
-- guards are a way of testing whether some property of a value (or several of them) are true or false.


-- similar to if statements

--guards are more readable when you have several conditions and they play really nicely with patterns.

--eg.
bmiTell :: (RealFloat a) => a -> String
bmiTell bmi
    | bmi <= 18.5 = "You're underweight, you emo, you!"
    | bmi <= 25.0 = "You're supposedly normal. Pffft, I bet you're ugly!"
    | bmi <= 30.0 = "You're fat! Lose some weight, fatty!"
    | otherwise   = "You're a whale, congratulations!"

--Guards are indicated by pipes(|) that follow a function's name and its parameters.
-- Usually, they're indented a bit to the right and lined up. 

--A guard is basically a boolean expression. If it evaluates to True, then the corresponding function body is used. If it evaluates to False, checking drops through to the next guard and so on.

--Many times, the last guard is otherwise. otherwise: is defined simply as otherwise = True and catches everything. 

--This is very similar to patterns, only they check if the input satisfies a pattern but guards check for boolean conditions.

--If all the guards of a function evaluate to False (and we haven't provided an otherwise catch-all guard), evaluation falls through to the next pattern. That's how patterns and guards play nicely together. 
--If no suitable guards or patterns are found, an error is thrown.


--we can use guards with functions that take as many parameters as we want.
bmiTell' :: (RealFloat a) => a -> a -> String
bmiTell' weight height
    | weight / height ^ 2 <= 18.5 = "You're underweight, you emo, you!"
    | weight / height ^ 2 <= 25.0 = "You're supposedly normal. Pffft, I bet you're ugly!"
    | weight / height ^ 2 <= 30.0 = "You're fat! Lose some weight, fatty!"
    | otherwise                 = "You're a whale, congratulations!"
--there's no = right after the function name and its parameters, before the first guard


--max function:
max' :: (Ord a) => a -> a -> a
max' a b 
    | a > b     = a
    | otherwise = b
--Guards can also be written inline, eg.:
--max' a b | a > b = a | otherwise = b


--compare function:
myCompare :: (Ord a) => a -> a -> Ordering
a `myCompare` b
    | a > b     = GT
    | a == b    = EQ
    | otherwise = LT
--Not only can we call functions as infix with `backticks`, we can also define them using backticks(``). 
--Sometimes it's easier to read that way





