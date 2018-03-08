-module(p05).

-export([reverse/1]).

%% (*) Reverse a list. %%

reverse(L) ->
    reverse(L,[]).
reverse([],Tail) ->
    Tail;
reverse([H|T], Tail) ->
%% [reverse(T,Tail)|H]. Working, but not how I wanted. Like this [[[[3]2]1]0]. Shitty, right? %%
    reverse(T,[H|Tail]).
