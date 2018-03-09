-module(p04).

-export([len/1,len_tail/1]).
-include_lib("eunit/include/eunit.hrl").

%%
%% (*) Find the number of elements of a list. %%
%%
%% 1> p04:len([]).                            %%
%% 0                                          %%
%% 2> p04:len([a,b,c,d]).                     %%
%% 4                                          %%
%%

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
%% Another solution of this task %%




%%     Test for element_at() function       %%
len_tail_test() ->
    ?assertEqual(0, len([])),
    ?assertEqual(4, len([a,b,c,d])),
    ok.
%%     Test for element_at() function       %%
