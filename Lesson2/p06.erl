-module(p06).

-export([is_polindrome/1]).
-include_lib("eunit/include/eunit.hrl").

%%
%% (*) Find out whether a list is a palindrome. %%
%%
%% A palindrome can be read forward or          %%
%% backward; e.g. (x a m a x).                  %%
%%
%% 1> p06:is_palindrome([1,2,3,2,1]).           %%
%% true                                         %%
%%


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


is_polindrome(L) ->
    L == reverse(L).


%%     Test for element_at() function       %%
is_polindrome_test() ->
    ?assertEqual(true, is_polindrome([x,a,m,a,x])),
    ?assertEqual(true, is_polindrome([1,2,3,2,1])),
    ?assertEqual(true, is_polindrome([])),
    ?assertEqual(false, is_polindrome([1,3,3,2,1])),
    ok.
%%     Test for element_at() function       %%
