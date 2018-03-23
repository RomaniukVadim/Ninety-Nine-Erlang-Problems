-module(p01).
-author('Romaniuk Vadim <romaniuk.cv@gmail.com>').
-export([last/1]).

-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").
-endif.
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
-ifdef(TEST).
last_test() ->
    ?assertEqual(f, last([a,b,c,d,e,f])),
    ?assertEqual(empty_list, last([])),
    ?assertEqual(1, last([a,e,1])),
    ok.
-endif.
%%     Test for last() function    %%
