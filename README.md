# Ninety-Nine-Erlang-Problems

[![Build Status](https://semaphoreci.com/api/v1/romaniukvadim/ninety-nine-erlang-problems/branches/master/badge.svg)](https://semaphoreci.com/romaniukvadim/ninety-nine-erlang-problems)

Original 99 Lisp problems source
https://www.ic.unicamp.br/~meidanis/courses/mc336/2006s2/funcional/L-99_Ninety-Nine_Lisp_Problems.html


Also in each Lesson I include Makefile and test.erl. You can run all tests in terminal with "make test" command, or test single file with "make test_N", where N number of file. 

Working with lists
-------------
**P01 (*) Find the last box of a list.**  
Example:

    1> p01:last([a,b,c,d,e,f]).
    [f]

**P02 (*) Find the last but one box of a list.**  
Example:

    1> p02:but_last([a,b,c,d,e,f]).
    [e,f]

**P03 (*) Find the K'th element of a list.**  
The first element in the list is number 1.  
Example:

    1> p03:element_at([a,b,c,d,e,f], 4).
    d
    2> p03:element_at([a,b,c,d,e,f], 10).
    undefined

**P04 (*) Find the number of elements of a list.**  
Example:

    1> p04:len([]).
    0
    2> p04:len([a,b,c,d]).
    4

**P05 (*) Reverse a list.**  
Example:

    1> p05:reverse([1,2,3]).
    [3,2,1]

**P06 (*) Find out whether a list is a palindrome.**  
A palindrome can be read forward or backward; e.g. (x a m a x).  
Example:

    1> p06:is_palindrome([1,2,3,2,1]).
    true

**P07 (\*\*) Flatten a nested list structure.**  
Transform a list, possibly holding lists as elements into a `flat' list by replacing each list with its elements (recursively).  
Example:

    1> p07:flatten([a,[b,[c,d],e]]).
    [a,b,c,d,e]

**P08 (\*\*) Eliminate consecutive duplicates of list elements.**  
If a list contains repeated elements they should be replaced with a single copy of the element. The order of the elements should not be changed.  
Example:

    1> p08:compress([a,a,a,a,b,c,c,a,a,d,e,e,e,e]).
    [a,b,c,a,d,e]

**P09 (\*\*) Pack consecutive duplicates of list elements into sublists.**  
If a list contains repeated elements they should be placed in separate sublists.  
Example:

    1> p09:pack([a,a,a,a,b,c,c,a,a,d,e,e,e,e]).
    [ [a,a,a,a],[b],[c,c],[a,a],[d],[e,e,e,e]]

