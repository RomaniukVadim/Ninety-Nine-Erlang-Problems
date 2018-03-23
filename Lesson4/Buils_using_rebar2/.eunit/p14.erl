-module(p14).
-author('Romaniuk Vadim <romaniuk.cv@gmail.com>').
-export([duplicate/1]).

-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").
-endif.
%%
%% (*) Duplicate the elements of a list. %%
%%
%% 1> p14:duplicate([a,b,c,c,d]). %%
%% [a,a,b,b,c,c,c,c,d,d]          %%
%%
%%
%% Reverse func from task p05.erl                  %%
%% Without reverse output will be in reverse order %%
reverse(L) ->
    reverse(L,[]).
reverse([],Tail) ->
    Tail;
reverse([H|T], Tail) ->
    reverse(T,[H|Tail]).
%% Reverse func from task p05.erl %%
%%
%% Interface                      %%
duplicate(L) ->
    duplicate(L,[]).
%% Receive head, add to DupList two same elements %%
duplicate([H|T],DupList) ->
    duplicate(T,[H,H|DupList]);
%% When raw list is empty, send duplicate List    %%
duplicate([],L) ->
    reverse(L).

-ifdef(TEST).
%%   Test for duplicate() function     %%
duplicate_test() ->
    ?assertEqual([a,a,b,b,c,c,c,c,d,d], duplicate([a,b,c,c,d])),
    ?assertEqual([], duplicate([])),
    ok.
%%   Test for duplicate() function     %%
-endif.
