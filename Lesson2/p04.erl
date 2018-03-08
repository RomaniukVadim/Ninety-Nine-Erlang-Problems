-module(p04).

-export([len/1,len_tail/1]).

%% (*) Find the number of elements of a list. %%

len([_H|T]) -> 1+len(T);
len([]) ->
    0.

%% Another solution of this task %%
len_tail([H|T]) ->
    len_tail([H|T],0).
len_tail([_H|T],Num) ->
    len_tail(T, Num+1);
len_tail([],Num) ->
    Num.

