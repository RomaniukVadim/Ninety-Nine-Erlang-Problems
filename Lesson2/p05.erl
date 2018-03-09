-module(p05).

-export([reverse/1]).
-include_lib("eunit/include/eunit.hrl").

%%
%%    (*) Reverse a list.    %%
%%
%% 1> p05:reverse([1,2,3]).  %%
%% [3,2,1]                   %%
%%

reverse(L) ->
    reverse(L,[]).
reverse([],Tail) ->
    Tail;
reverse([H|T], Tail) ->
%% [reverse(T,Tail)|H]. Working,    %%
%% but not how I wanted. Like       %%
%%this [[[[3]2]1]0]. Shitty, right? %%
    reverse(T,[H|Tail]).



%%   Test for reverse() function    %%
reverse_test() ->
    ?assertEqual([3,2,1], reverse([1,2,3])),
    ?assertEqual([4,2.2,a], reverse([a,2.2,4])),
    ok.
%%   Test for reverse() function    %%
