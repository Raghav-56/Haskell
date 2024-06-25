-- Lambdas are anonymous functions used because we need some functions only once. Normally, we make a lambda with the sole purpose of passing it to a higher-order function.
-- To make a lambda, we write a \ and write the parameters, separated by spaces. After that comes -> and then the function body.
-- We usually surround them by parentheses, because otherwise they extend all the way to the right.


chain :: (Integral a) => a -> [a]
chain 1 = [1]
chain x 
    | even x = x: chain (x `div` 2)
    | odd x = x: chain (x*3+1)

numLongChains :: Int
numLongChains = length (filter (\xs -> length xs > 15) (map chain [1..100]))

-- ! Lambdas are expressions

-- like normal functions, you can pattern match in lambdas. The only difference is that you can't define several patterns for one parameter, like making a [] and a (x:xs) pattern for the same parameter and then having values fall through, or using guards.
-- If a pattern matching fails in a lambda, a runtime error occurs!

--Lambdas are normally surrounded by parentheses unless we mean for them to extend all the way to the right.
addThree :: (Num a) => a -> a -> a -> a
--addThree x y z = x + y + z
addThree = \x -> \y -> \z -> x + y + z
-- There are three ->'s in both the type declaration and the equation. A gimmick to illustrate currying.
-- ( = \_) & ( -> \_) can replace space

flip' :: (a -> b -> c) -> b -> a -> c
flip' f = \x y -> f y x
--f x y = f y x
--The most common use case with flip is calling it with just the function parameter and then passing the resulting function on to a map or a filter.
--you can use lambdas in this way when you want to make it explicit that your function is mainly meant to be partially applied and passed on to a function as a parameter.












