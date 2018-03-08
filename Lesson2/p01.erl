-module(p01).

-export([last/1]).

%% (*) Find the last box of a list. %%

last([H|[]]) -> 
    H;
last([_H|T]) ->
    last(T).
