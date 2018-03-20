-module(p04).
-author('Romaniuk Vadim <romaniuk.cv@gmail.com>').
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
len_tail(L) ->
    len_tail(L,0).
len_tail([_H|T],Num) ->
    len_tail(T, Num+1);
len_tail([],Num) ->
    Num.
%% Another solution of this task %%




%%     Test for len() function       %%
len_test() ->
    ?assertEqual(0, len([])),
    ?assertEqual(4, len([a,b,c,d])),
    ok.
%%     Test for len() function       %%

%%     Test for len_tail() function       %%
len_tail_test() ->
    ?assertEqual(0, len_tail([])),
    ?assertEqual(4, len_tail([a,b,c,d])),
    ok.
%%     Test for len_tail() function       %%
