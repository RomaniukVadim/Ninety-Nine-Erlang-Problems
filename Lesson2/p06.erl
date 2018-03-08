-module(p06).

-export([is_polindrome/1]).

%% (*) Find out whether a list is a palindrome.                    %%
%% A palindrome can be read forward or backward; e.g. (x a m a x). %%
%% Reverse function from p05.erl

reverse(L) ->
    reverse(L,[]).
reverse([],Tail) ->
    Tail;
reverse([H|T], Tail) ->
    reverse(T,[H|Tail]).

%% Reverse function from p05.erl                          %%
%% Reason why not simply use import                       %%
%% https://github.com/inaka/erlang_guidelines#dont-import %%


is_polindrome(_List = []) ->
    true;
is_polindrome([H|T]) ->
    [H|T] == reverse([H|T]).
