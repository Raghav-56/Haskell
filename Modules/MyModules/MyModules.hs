--to split your code up into several files

--it's good practice to take functions and types that work towards a similar purpose and put them in a module.
--easily reuse those functions in other programs by just importing your module.

import Geometry

--Geometry.hs has to be in the same folder that the program that's importing it is in


--Modules can also have a hierarchical structure. Each module can have a number of submodules and they can have submodules of their own.


import qualified Geometry.Sphere as Sphere  
import qualified Geometry.Cuboid as Cuboid  
import qualified Geometry.Cube as Cube 

--And then we can call Sphere.area, Sphere.volume, Cuboid.area, etc. and each will calculate the area or volume for their corresponding object.


--The next time you find yourself writing a file that's really big and has a lot of functions, try to see which functions serve some common purpose and then see if you can put them in their own module. You'll be able to just import your module the next time you're writing a program that requires some of the same functionality.










