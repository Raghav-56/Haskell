-- creating a data type that describes a person
-- The info that we want to store about that person is: first name, last name, age, height, phone number, and favorite ice-cream flavor. 

data Person = Person String String Int Float String String deriving (Show)

{-
ghci> let guy = Person "Buddy" "Finklestein" 43 184.2 "526-2928" "Chocolate"  
ghci> guy  
Person "Buddy" "Finklestein" 43 184.2 "526-2928" "Chocolate"  
-}

-- Separate functions to get separate info from a person, one for first name, another for last name, etc.

firstName :: Person -> String  
firstName (Person firstname _ _ _ _ _) = firstname  

lastName :: Person -> String  
lastName (Person _ lastname _ _ _ _) = lastname  

age :: Person -> Int  
age (Person _ _ age _ _ _) = age  

height :: Person -> Float  
height (Person _ _ _ height _ _) = height  

phoneNumber :: Person -> String  
phoneNumber (Person _ _ _ _ number _) = number  

flavor :: Person -> String  
flavor (Person _ _ _ _ _ flavor) = flavor  

{-
ghci> let guy = Person "Buddy" "Finklestein" 43 184.2 "526-2928" "Chocolate"  
ghci> firstName guy  
"Buddy"  
ghci> height guy  
184.2  
ghci> flavor guy  
"Chocolate"  
-}

data Person' = Person' { firstName' :: String,  
                        lastName' :: String, 
                        age' :: Int, 
                        height' :: Float,  
                        phoneNumber' :: String,  
                        flavor' :: String  
                    } deriving (Show)  

-- record syntax
-- we use curly brackets, write the name of the field, for instance, firstName and then we write a double colon :: (also called Paamayim Nekudotayim, haha) and then we specify the type. 
-- Haskell automatically creates functions that lookup fields in the data type.

--When we derive Show for the type, it displays it differently if we use record syntax to define and instantiate the type.
data Car = Car String String Int deriving (Show)  
{-ghci> Car "Ford" "Mustang" 1967  
Car "Ford" "Mustang" 1967  -}
data Car' = Car' {company :: String, model :: String, year :: Int} deriving (Show)
{-ghci> Car' {company="Ford", model="Mustang", year=1967}  
Car' {company = "Ford", model = "Mustang", year = 1967} -}
--When making a new car, we don't have to necessarily put the fields in the proper order, as long as we list all of them. But if we don't use record syntax, we have to specify them in order.
--Use record syntax when a constructor has several fields and it's not obvious which field is which. and other when it's pretty obvious that what the fields are the components of.










