-module(p01).

-export([last/1]).
-include_lib("eunit/include/eunit.hrl").

%%
%% (*) Find the last box of a list. %%
%%
%% 1> p01:last([a,b,c,d,e,f]).      %%
%% f                                %%
%%

last([H|[]]) -> 
    H;
last([_H|T]) ->
    last(T);
last([]) ->
    empty_list.

%%     Test for last() function    %%
last_test() ->
    ?assertEqual(f, last([a,b,c,d,e,f])),
    ?assertEqual(empty_list, last([])),
    ?assertEqual(1, last([a,e,1])),
    ok.
%%     Test for last() function    %%
