# Ninety-Nine-Erlang-Problems

[![Build Status](https://semaphoreci.com/api/v1/romaniukvadim/ninety-nine-erlang-problems/branches/master/badge.svg)](https://semaphoreci.com/romaniukvadim/ninety-nine-erlang-problems)

Original 99 Lisp problems source
https://www.ic.unicamp.br/~meidanis/courses/mc336/2006s2/funcional/L-99_Ninety-Nine_Lisp_Problems.html


Also in each Lesson I include Makefile and test.erl. You can run all tests in terminal with "make test" command, or test single file with "make test_N", where N number of file. 

Working with lists (Lesson 2)
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

**P10 (\*) Run-length encoding of a list.**

Use the result of problem P09 to implement the so-called run-length encoding data compression method.
Consecutive duplicates of elements are encoded as lists (N E) where N is the number of duplicates of the element E.
Example:

    1> p10:encode([a,a,a,a,b,c,c,a,a,d,e,e,e,e]).
    [{4,a},{1,b},{2,c},{2,a},{1,d},{4,e}]

**P11(\*) Modified run-length encoding.**

Modify the result of problem P10 in such a way that if an element has no duplicates it is simply copied into the result list. Only elements with duplicates are transferred as (N E) lists.
Example:

    1> p11:encode_modified([a,a,a,a,b,c,c,a,a,d,e,e,e,e]).
    [{4,a},b,{2,c},{2,a},d,{4,e}]
    
**P12(\*\*) Decode a run-length encoded list.**

Given a run-length code list generated as specified in problem P11. Construct its uncompressed version.
Example:

    1> p12:decode_modified([{4,a},b,{2,c},{2,a},d,{4,e}]).
    [a,a,a,a,b,c,c,a,a,d,e,e,e,e]
    
**P13(\*\*) Run-length encoding of a list (direct solution).**

Implement the so-called run-length encoding data compression method directly.
I.e. don't explicitly create the sublists containing the duplicates, as in problem P09, but only count them.
As in problem P11, simplify the result list by replacing the singleton lists (1 X) by X.
Example:

    1> p13:decode([{4,a},{1,b},{2,c},{2,a},{1,d},{4,e}]).
    [a,a,a,a,b,c,c,a,a,d,e,e,e,e]

**P14(\*) Duplicate the elements of a list.**

Example:

    1> p14:duplicate([a,b,c,c,d]).
    [a,a,b,b,c,c,c,c,d,d]

**P15(\*\*) Replicate the elements of a list a given number of times.**

Example:

    1> p15:replicate([a,b,c], 3).
    [a,a,a,b,b,b,c,c,c]

Binary (Lesson 3)
-------------

**bs01: Extract first word from text **

Example:

    1> BinText = <<"Some text">>.
    <<"Some Text">>
    2> bs01:first_word(BinText).
    <<"Some">>

**bs02: Split a string into words:**

Example:

    1> BinText = <<"Text with four words">>.
    <<"Text with four words">>
    2> bs02:words(BinText).
    [<<"Text">>, <<"with">>, <<"four">>, <<"words">>]

**bs03:Divide the line into parts, with an explicit delimiter**

Example:

    1> BinText = <<"Col1-:-Col2-:-Col3-:-Col4-:-Col5">>.
    <<"Col1-:-Col2-:-Col3-:-Col4-:-Col5">>
    2> bs03:split(BinText, "-:-").
    [<<"Col1">>, <<"Col2">>, <<"Col3">>, <<"Col4">>, <<"Col5">>]
    
**bs04:Disassemble an XML document without attributes**

Example:

    1> BinXML = <<"<start><item>Text1</item><item>Text2</item></start>">>.
    <<”<start><item>Text1</item><item>Text2</item></start>”>>
    2> bs04:decode_xml(BinXML).
    {<<"start">>, [], [
    {<<"item">>, [], [<<"Text1">>]},
    {<<"item">>, [], [<<"Text2">>]}
    ]}
