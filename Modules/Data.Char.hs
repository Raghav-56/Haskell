import Data.Char
import Data.Binary (encode)

--The Data.Char module+ exports functions that deal with characters. 
--It's helpful when filtering and mapping over strings because they're just lists of characters.

--Data.Char exports a bunch of predicates over characters. That is, functions that take a character and tell us whether some assumption about it is true or false.


{-
-- ! List of predicates

-- isControl checks whether a character is a control character.

-- isSpace checks whether a character is a white-space characters. That includes spaces, tab characters, newlines, etc.

-- isLower checks whether a character is lower-cased.

-- isUpper checks whether a character is upper-cased.

-- isAlpha checks whether a character is a letter.

-- isAlphaNum checks whether a character is a letter or a number.

-- isPrint checks whether a character is printable. Control characters, for instance, are not printable.

-- isDigit checks whether a character is a digit.

-- isOctDigit checks whether a character is an octal digit.

-- isHexDigit checks whether a character is a hex digit.

-- isLetter checks whether a character is a letter.

-- isMark checks for Unicode mark characters. Those are characters that combine with preceding letters to form letters with accents. Use this if you are French.

-- isNumber checks whether a character is numeric.

-- isPunctuation checks whether a character is punctuation.

-- isSymbol checks whether a character is a fancy mathematical or currency symbol.

-- isSeparator checks for Unicode spaces and separators.

-- isAscii checks whether a character falls into the first 128 characters of the Unicode character set.

-- isLatin1 checks whether a character falls into the first 256 characters of Unicode.

-- isAsciiUpper checks whether a character is ASCII and upper-case.

-- isAsciiLower checks whether a character is ASCII and lower-case.

-}

--All these predicates have a type signature of Char -> Bool. 
--Most of the time you'll use this to filter out strings or something like that. 

-- ! all takes a predicate and a list and returns True only if that predicate holds for every element in the list.


{-
ghci> all isAlphaNum "eddy the fish!"  
False 

ghci> words "hey folks its me"  
["hey","folks","its","me"]  
ghci> groupBy ((==) `on` isSpace) "hey folks its me"  
["hey"," ","folks"," ","its"," ","me"] 
ghci> filter (not . any isSpace) . groupBy ((==) `on` isSpace) $ "hey folks its me"  
["hey","folks","its","me"]  

-}


--The Ordering type can have a value of LT, EQ or GT. It's a sort of enumeration. It describes a few possible results that can arise from comparing two elements.
--The GeneralCategory from Data.Char type is also an enumeration. It presents us with a few possible categories that a character can fall into. 
--The main function for getting the general category of a character is generalCategory. 
--It has a type of generalCategory :: Char -> GeneralCategory. 
--There are about 31 categories: Basics, Data Types, Type Classes, Functions, Pattern Matching, Recursion, Higher-Order Functions, Modules, Lists, Tuples, Maybe, Either, Monads, Functor, Applicative, IO, Error Handling, State, Random, Parsing, Concurrency, Testing, Performance, Laziness, Type Inference, Type Families, GADTs (Generalized Algebraic Data Types), Lens, Template Haskell, Data Structures, Libraries and Tools.
{-
ghci> map generalCategory " \t\nA9?|"  
[Space,Control,Control,UppercaseLetter,DecimalNumber,OtherPunctuation,MathSymbol] 
-}


-- toUpper converts a character to upper-case. Spaces, numbers, and the like remain unchanged.

-- toLower converts a character to lower-case.

-- toTitle converts a character to title-case. For most characters, title-case is the same as upper-case.


-- digitToInt converts a character to an Int. To succeed, the character must be in the ranges '0'..'9', 'a'..'f' or 'A'..'F'.

-- intToDigit is the inverse function of digitToInt. It takes an Int in the range of 0..15 and converts it to a lower-case character.


--The ord and chr functions convert characters to their corresponding numbers and vice versa. --! Unicode 


---------------------------------------------------------------------------------------------

--The Caesar cipher is a primitive method of encoding messages by shifting each character in them by a fixed number of positions in the alphabet.

encode' :: Int -> String -> String
encode' n = map $ \x -> chr (ord x + n)

encode'' :: Int -> String -> String
encode''  shift msg =
    let ords = map ord msg
        shifted = map (+ shift) ords
    in  map chr shifted

encode''' :: Int -> String -> String
encode''' n = map $ chr . (+n) . ord

{-
ghci> encode 5 "Marry Christmas! Ho ho ho!"  
"Rfww~%Hmwnxyrfx&%Mt%mt%mt&"
-}

decode' :: Int -> String -> String
decode' n = map $ chr . subtract n . ord
--or
decode'' :: Int -> String -> String
decode'' n = encode' (negate n) 










