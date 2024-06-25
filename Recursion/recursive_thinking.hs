-- you define an edge case 
--and then you define a function/ pattern that does something between some element and the function applied to the rest. 
--It doesn't matter if it's a list, a tree or any other data structure. 

--A sum is the first element of a list plus the sum of the rest of the list. 
--A product of a list is the first element of the list times the product of the rest of the list. 
--The length of a list is one plus the length of the tail of the list.

--The edge case is some scenario where a recursive application doesn't make sense. 
--When dealing with lists, the edge case is most often the empty list. 
--If you're dealing with trees, the edge case is usually a node that doesn't have any children.

--when you're dealing with numbers recursively. Usually it has to do with some number and the function applied to that number modified.

--Often the edge case value turns out to be an identity. 
--The identity for Addition is 0 because if you Add something by 0, you get that something back.
--The identity for Multiplication is 1 because if you multiply something by 1, you get that something back.


{-
So when trying to think of a recursive way to solve a problem, 
--try to think of when a recursive solution doesn't apply and see if you can use that as an edge case, 
--think about identities and think about whether you'll break apart the parameters of the function 
(for instance, lists are usually broken into a head and a tail via pattern matching) and 
--on which part you'll use the recursive call.
-}









