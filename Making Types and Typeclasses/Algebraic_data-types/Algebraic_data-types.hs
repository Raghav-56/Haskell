-- data types. Bool, Int, Char, Maybe, etc.

-- To make our own Data types,
-- we can use the data keyword to define a type.

data Bool' = False | True  
-- So we can read this as: the Bool type can have a value of True or False.

-- data, means that we're defining a new data type. 
-- type, is The part before the = . 
-- value constructors, the parts after the = , specify the different values that this type can have.
-- The | is read as or. 
-- Both the type name and the value constructors have to be capital cased.

-- data Int' = -2147483648 | -2147483647 | ... | -1 | 0 | 1 | 2 | ... | 2147483647
--not actually defined like this, the ellipses are here because we omitted a heapload of numbers.

-- The first and last value constructors are the minimum and maximum possible values


data Shape = Circle Float Float Float | Rectangle Float Float Float Float  
--The Circle value constructor has three fields, which take floats. the first and second fields are the coordinates of the circle's center and the third field is the radius.
--The Rectangle value constructor has four fields which accept floats. The first two are the coordinates to its upper left corner and the second two are coordinates to its lower right one.

-- fields == parameters

--  Value constructors are functions that return a value of a data type. 
{-
-- type signature
ghci> :t Circle  
Circle :: Float -> Float -> Float -> Shape  
ghci> :t Rectangle  
Rectangle :: Float -> Float -> Float -> Float -> Shape 
-}

surface :: Shape -> Float  
surface (Circle _ _ r) = pi * r ^ 2  
surface (Rectangle x1 y1 x2 y2) = (abs $ x2 - x1) * (abs $ y2 - y1)  

-- Circle is a function and Shape a type
-- like True is a function and Book a type

--we can pattern match against constructors
--we pattern matched against values like [] or False or 5, only those values didn't have any fields. We just write a constructor and then bind its fields to names

-- if we try to just print out Circle 10 20 5 in the prompt, we'll get an error.
-- Haskell doesn't know how to display our data type as a string (yet).

-- !  when we try to print a value out in the prompt, Haskell first runs the show function to get the string representation of our value and then it prints that out to the terminal. 

data Shape' = Circle Float Float Float | Rectangle Float Float Float Float deriving (Show)  

-- if we add deriving (Show) at the end of a data declaration, Haskell automatically makes that type part of the Show typeclass. 


--Value constructors are functions, so we can map them and partially apply them and everything.
--list of concentric circles with different radii
{-
ghci> map (Circle 10 20) [4,5,6,6]  
[Circle 10.0 20.0 4.0,Circle 10.0 20.0 5.0,Circle 10.0 20.0 6.0,Circle 10.0 20.0 6.0]  
-}

data Point = Point Float Float deriving (Show)  
data Shape'' = Circle Point Float | Rectangle Point Point deriving (Show) 

--when defining a point, we used the same name for the data type and the value constructor. This has no special meaning, although it's common to use the same name as the type if there's only one value constructor.

surface' :: Shape -> Float  
surface' (Circle _ r) = pi * r ^ 2  
surface' (Rectangle (Point x1 y1) (Point x2 y2)) = (abs $ x2 - x1) * (abs $ y2 - y1)  


--a function that nudges a shape. takes a shape, the amount to move it on the x axis and the amount to move it on the y axis and then returns a new shape that has the same dimensions, only it's located somewhere else.
nudge :: Shape -> Float -> Float -> Shape  
nudge (Circle (Point x y) r) a b = Circle (Point (x+a) (y+b)) r  
nudge (Rectangle (Point x1 y1) (Point x2 y2)) a b = Rectangle (Point (x1+a) (y1+b)) (Point (x2+a) (y2+b))  

--If we don't want to deal directly with points, we can make some auxiliary functions that create shapes of some size at the zero coordinates and then nudge those.

baseCircle :: Float -> Shape  
baseCircle r = Circle (Point 0 0) r  

baseRect :: Float -> Float -> Shape  
baseRect width height = Rectangle (Point 0 0) (Point width height) 












