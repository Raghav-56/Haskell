-- in mathematics (f o g)(x) == (f(g(x)))
-- ? which == f $ g  x

-- (.) :: (b -> c) -> (a -> b) -> a -> c  
-- f . g = \x -> f (g x) 
-- ? == f $ g  
-- ! no  f . g x == \x -> f (g x) and f $ g x == f (g x)
-- !  (f . g) x == f $ g x = f(g(x))


--One of the uses for function composition is making functions on the fly to pass to other functions. clearer and more concise than using lambdas.

-- if we want to use functions that take several parameters in function composition, we usually have to partially apply them just so much that each function takes just one parameter. 
-- eg-
--sum (replicate 5 (max 6.7 8.9)) can be rewritten as (sum . replicate 5 . max 6.7) 8.9 or as sum . replicate 5 . max 6.7 $ 8.9
-- if you want to rewrite an expression with a lot of parentheses by using function composition, you can start by putting the last parameter of the innermost function after a $ and then just composing all the other function calls, writing them without their last parameter and putting dots between them.
--If you have replicate 100 (product (map (*3) (zipWith max [1,2,3,4,5] [4,5,6,7,8]))), you can write it as replicate 100 . product . map (*3) . zipWith max [1,2,3,4,5] $ [4,5,6,7,8]. 





-- Another common use of function composition is defining functions in the so-called point free style (also called the pointless style).
--  point free style: getting rid of the main attribute in the function definition, defining as a partial function 
{-eg-
fn x = ceiling (negate (tan (cos (max 50 x)))) 
fn = ceiling . negate . tan . cos . max 50  
-}


--The preferred style is to use let bindings to give labels to intermediary results or split the problem into sub-problems and then put it together so that the function makes sense to someone reading it instead of just making a huge composition chain.


-- sum of all odd squares that are smaller than 10,000
--solution when put into a function
oddSquareSum :: Integer  
oddSquareSum = sum (takeWhile (<10000) (filter odd (map (^2) [1..]))) 

-- function composition
oddSquareSum' :: Integer
oddSquareSum' = sum . takeWhile (<10000) . filter odd . map (^2) $ [1..] 

--Standard with best readability
oddSquareSum'' :: Integer
oddSquareSum'' = 
    let oddSquares = filter odd $ map (^2) [1..]  
        belowLimit = takeWhile (<10000) oddSquares
    in  sum belowLimit  











