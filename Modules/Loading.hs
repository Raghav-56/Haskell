-- A Haskell module is a collection of related functions, types and typeclasses. 
-- A Haskell program is a collection of modules where the main module loads up the other modules and then uses the functions defined in them to do something

-- Having code split up into several modules has quite a lot of advantages. If a module is generic enough, the functions it exports can be used in a multitude of different programs. 
-- If your own code is separated into self-contained modules which don't rely on each other too much (loosely coupled), you can reuse them later on. It makes the whole deal of writing code more manageable by having it split into several parts, each of which has some sort of purpose.

--The Haskell standard library is split into modules, each of them contains functions and types that are somehow related and serve some common purpose.
-- modules for manipulating lists, concurrent programming, dealing with complex numbers, etc.
--All the functions, types and typeclasses that we've dealt with so far were part of the Prelude module, which is imported by default.


-- * syntax: import <module name>
-- must be done before defining any functions, so imports are usually done at the top of the file.
import Data.List 

-- When you do import all the functions that exports become available in the global namespace, meaning that you can call them from wherever in the script


{-
* GHCi syntax: ghci> :m <module name>
ghci> :m + Data.List Data.Map Data.Set  
-}

-- If we wanted to import only few functions from module, we'd do this:
-- * syntax: import <module name> (<, sep list of functions>)
import Data.List (nub, sort)

-- to import all of the functions of a module except a few select ones
-- * syntax: import <module name> hiding (<, sep list of functions>)
import Data.List hiding (nub)

-- to deal with name clashes, do qualified imports
-- * syntax: import qualified <module name>
import qualified Data.Map  
--if we want to reference Data.Map's filter function, we have to do Data.Map.filter
--But typing out Data.Map in front of every function from that module is kind of tedious.
-- * syntax: import qualified <module name> as <var name>
import qualified Data.Map as M  
--we just use M.filter

--https://downloads.haskell.org/ghc/latest/docs/libraries/
--https://hoogle.haskell.org/









