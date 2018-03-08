-module(p03).

-export([element_at/2]).

%% (*) Find the K'th element of a list.       %%
%% The first element in the list is number 1. %%

element_at([H|_], 1 ) ->
    H;
element_at([_H|T], N) ->
    element_at(T, N-1);
element_at([],_) -> undefined.
