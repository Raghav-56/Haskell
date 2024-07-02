module Shapes  
( Point(..)  
, Shape(..)  
, surface  
, nudge  
, baseCircle  
, baseRect  
) where 

--By doing Shape(..), we exported all the value constructors for Shape, whoever imports our module can make shapes by using the Rectangle and Circle value constructors, same as writing --Shape (Rectangle, Circle).

--We could also opt not to export any value constructors for Shape by just writing Shape in the export statement. 
--That way, someone importing our module could only make shapes by using the auxiliary functions baseCircle and baseRect.

--Data.Map uses that approach
--You can't create a map by doing Map.Map [(1,2),(3,4)] because it doesn't export that value constructor. 
--However, you can make a mapping by using one of the auxiliary functions like Map.fromList

-- ! value constructors are just functions that take the fields as parameters and return a value of some type (like Shape) as a result.
--when we choose not to export them, we just prevent the person importing our module from using those functions, but if some other functions that are exported return a type, we can use them to make values of our custom data types.


-- Not exporting the value constructors of a data types makes them more abstract in such a way that we hide their implementation. Also, whoever uses our module can't pattern match against the value constructors.










data Point = Point Float Float deriving (Show)  

data Shape = Circle Point Float | Rectangle Point Point deriving (Show) 

surface :: Shape -> Float  
surface (Circle _ r) = pi * r ^ 2  
surface (Rectangle (Point x1 y1) (Point x2 y2)) = abs (x2 - x1) * abs (y2 - y1)  

nudge :: Shape -> Float -> Float -> Shape  
nudge (Circle (Point x y) r) a b = Circle (Point (x+a) (y+b)) r  
nudge (Rectangle (Point x1 y1) (Point x2 y2)) a b = Rectangle (Point (x1+a) (y1+b)) (Point (x2+a) (y2+b))  

baseCircle :: Float -> Shape  
baseCircle = Circle (Point 0 0)

baseRect :: Float -> Float -> Shape  
baseRect width height = Rectangle (Point 0 0) (Point width height) 











