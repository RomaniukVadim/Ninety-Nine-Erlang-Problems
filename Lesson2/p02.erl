-module(p02).

-export([but_last/1]).
-include_lib("eunit/include/eunit.hrl").

%%
%% (*) Find the last but one box of a list. %%
%%
%% 1> p02:but_last([a,b,c,d,e,f]).          %%
%% [e,f]                                    %%
%%

but_last([_,_]=L) ->
    L;
but_last([_H|T]) ->
    but_last(T);
but_last([]) ->
    empty_list.


%%       Test for but_last() function       %%
but_last_test() ->
    ?assertEqual([e,f], but_last([a,b,c,d,e,f])),
    ?assertEqual([1.2,12], but_last([a,3,5,1.2,12])),
    ?assertEqual(empty_list, but_last([])),
    ok.
%%       Test for but_last() function       %%
