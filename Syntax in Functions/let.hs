--Where bindings are a syntactic construct that let you bind to variables at the end of a function and the whole function can see them, including all the guards.
--Let bindings let you bind to variables anywhere and are expressions themselves, but are very local, so they don't span across guards.


--Just like any construct in Haskell that is used to bind values to names, let bindings can be used for pattern matching.


--function that gives us a cylinder's surface area based on its height and radius
cylinder :: (RealFloat a) => a -> a -> a
cylinder r h =
    let sideArea = 2 * pi * r * h
        topArea = pi * r ^2
    in  sideArea + 2 * topArea

--The form is let <bindings> in <expression>. The names that you define in the let part are accessible to the expression after the in part.


--let puts the bindings first and the expression that uses them later whereas where is the other way around.
--The difference is that let bindings are expressions themselves. where bindings are just syntactic constructs.

-- reminder: if else statement is an expression and you can cram it in almost anywhere, if.. then .. else ..


--let bindings can also be used to introduce functions in a local scope:
{-ghci> [let square x = x * x in (square 5, square 3, square 2)]
[(25,9,4)]-}

--If we want to bind to several variables inline, we can separate them with semicolons.
{-ghci> (let a = 100; b = 200; c = 300 in a*b*c, let foo="Hey "; bar = "there!" in foo ++ bar)
(6000000,"Hey there!")-}
--You don't have to put a semicolon after the last binding but you can if you want.


-- you can pattern match with let bindings. They're very useful for quickly dismantling a tuple into components and binding them to names and such.
{-ghci> (let (a,b,c) = (1,2,3) in a+b+c) * 100
600-}

-- You can also put let bindings inside list comprehensions.
calcBmis :: (RealFloat a) => [(a, a)] -> [a]
calcBmis xs = [bmi | (w, h) <- xs, let bmi = w / h ^ 2]
--We include a let inside a list comprehension much like we would a predicate, only it doesn't filter the list, it only binds to names. 

--The names defined in a let inside a list comprehension are visible to the output function (the part before the |) as well as all predicates and sections that come after of the binding.
-- it is not visible to part between | and the let binding.

--We omitted the in part of the let binding when we used them in list comprehensions because the visibility of the names is already predefined there.
--we could use a let in binding in a predicate and the names defined would only be visible to that predicate.

--The in part can also be omitted when defining functions and constants directly in GHCi. 
--If we do that, then the names will be visible throughout the entire interactive session.
{-ghci> let zoot x y z = x * y + z
ghci> zoot 3 9 2
29
ghci> let boot x y z = x * y + z in boot 3 4 2
14
ghci> boot
<interactive>:1:0: Not in scope: `boot'-}


--since let bindings are expressions and are fairly local in their scope, they can't be used across guards.
--Some people also prefer where bindings because the names come after the function they're being used in. That way, the function body is closer to its name and type declaration and to some that's more readable.






