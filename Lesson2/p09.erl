-module(p09).

-export([pack/1]).
-include_lib("eunit/include/eunit.hrl").

%%
%%(**) Pack consecutive duplicates of list elements into sublists. %%
%% If a list contains repeated elements they should be placed in   %%
%% separate sublists.                                              %%
%%
%% 1> p09:pack([a,a,a,a,b,c,c,a,a,d,e,e,e,e]).                     %%
%% [[a,a,a,a],[b],[c,c],[a,a],[d],[e,e,e,e]]                       %%
%%
%% Reverse func from p05.erl                                       %%
%%
reverse(L) ->
    reverse(L,[]).
reverse([],Tail) ->
    Tail;
reverse([H|T], Tail) ->
    reverse(T,[H|Tail]).
%%
%% Interface %%
pack(L) ->
     %% raw list, list with same elements, list in list %%
    pack(L,[],[]).
pack([],[],[]) -> []; %% when no element send to function %%
pack([H|T],[],LiL) ->
    pack(T,[H],LiL);
pack([H|T],[H|Rest],LiL) ->
    pack(T,[H,H|Rest],LiL);
pack([H|T], L, LiL) ->
    pack(T,[H],[L|LiL]);
pack([],L,LiL) ->
    reverse([L|LiL]).
%% Return list of lists when raw list empty


%%   Test for pack() function     %%
pack_test() ->
    ?assertEqual([[a,a,a,a],[b],[c,c],[a,a],[d],[e,e,e,e]], pack([a,a,a,a,b,c,c,a,a,d,e,e,e,e])),
    ?assertEqual([], pack([])),
    ok.
%%   Test for pack() function     %%
