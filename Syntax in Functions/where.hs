--Repeating yourself (three times) while programming is about as desirable as getting kicked inna head.


bmiTell :: (RealFloat a) => a -> a -> String
bmiTell weight height
    | bmi <= skinny = "You're underweight, you emo, you!"
    | bmi <= normal = "You're supposedly normal. Pffft, I bet you're ugly!"
    | bmi <= fat    = "You're fat! Lose some weight, fatty!"
    | otherwise     = "You're a whale, congratulations!"
    where bmi = weight / height ^ 2
          skinny = 18.5
          normal = 25.0
          fat = 30.0

--We put the keyword where after the guards (usually it's best to indent it as much as the pipes are indented) 
--and then we define several names or functions.

--The names we define in the where section of a function are only visible to that function, so we don't have to worry about them polluting the namespace of other functions.

--all the names are aligned at a single column. If we don't align them nice and proper, Haskell gets confused because then it doesn't know they're all part of the same block.


--where bindings aren't shared across function bodies of different patterns(unlike guards). If you want several patterns of one function to access some shared name, you have to define it globally


--You can also use where bindings to pattern match!

bmiTell' :: (RealFloat a) => a -> a -> String
bmiTell' weight height
    | bmi <= skinny = "You're underweight, you emo, you!"
    | bmi <= normal = "You're supposedly normal. Pffft, I bet you're ugly!"
    | bmi <= fat    = "You're fat! Lose some weight, fatty!"
    | otherwise     = "You're a whale, congratulations!"
    where bmi = weight / height ^ 2
          (skinny, normal, fat) = (18.5, 25.0, 30.0)
-- single w and h s bmi func inside where has no parameters

--function where we get a first and a last name and give someone back their initials.
initials :: String -> String -> String
initials firstname lastname = [f] ++ ". " ++ [l] ++ "."
    where (f:_) = firstname
          (l:_) = lastname  
--though better-
initials' :: String -> String -> String
initials' (f:_) (l:_) = [f] ++ ". " ++ [l] ++ "."


--a function that takes a list of weight-height pairs and returns a list of BMIs.
calcBmis :: (RealFloat a) => [(a, a)] -> [a]
calcBmis xs = [bmi w h | (w, h) <- xs]
    where bmi w h = w / h ^ 2
-- multiple w and h s bmi inside where has them as parameters


--where bindings can also be nested. 
--It's a common idiom to make a function and define some helper function in its where clause and then to give those functions helper functions as well, each with its own where clause.















