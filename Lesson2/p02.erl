-module(p02).

-export([but_last/1]).

%% (*) Find the last but one box of a list. %%

but_last([_,_]=L) ->
    L;
but_last([_H|T]) ->
    but_last(T).
