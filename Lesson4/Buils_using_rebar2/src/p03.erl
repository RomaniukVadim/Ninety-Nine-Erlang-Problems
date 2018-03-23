-module(p03).
-author('Romaniuk Vadim <romaniuk.cv@gmail.com>').
-export([element_at/2]).

-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").
-endif.
%%
%% (*) Find the K'th element of a list.       %%
%% The first element in the list is number 1. %%
%%
%% 1> p03:element_at([a,b,c,d,e,f], 4).       %%
%% d                                          %%
%% 2> p03:element_at([a,b,c,d,e,f], 10).      %%
%% undefined                                  %%
%%

element_at([H|_], 1 ) ->
    H;
element_at([_H|T], N) ->
    element_at(T, N-1);
element_at([],_) -> undefined.


%%        Test for element_at() function      %%
-ifdef(TEST).
element_at_test() ->
    ?assertEqual(d, element_at([a,b,c,d,e,f], 4)),
    ?assertEqual(undefined, element_at([a,b,c,d,e,f], 10)),
    ?assertEqual(undefined, element_at([], 4)),
    ok.
-endif.
%%        Test for element_at() function      %%
