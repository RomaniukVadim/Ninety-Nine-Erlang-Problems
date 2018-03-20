-module(p10).
-author('Romaniuk Vadim <romaniuk.cv@gmail.com>').
-export([encode/1]).
-include_lib("eunit/include/eunit.hrl").

%%
%%  (*) Run-length encoding of a list.           %%
%%
%% Use the result of problem P09 to implement    %%
%% the so-called run-length encoding data        %%
%% compression method. Consecutive duplicates of %%
%% elements are encoded as lists (N E) where N   %%
%% is the number of duplicates of the element E. %%
%%
%% 1> p10:encode([a,a,a,a,b,c,c,a,a,d,e,e,e,e]). %%
%% [{4,a},{1,b},{2,c},{2,a},{1,d},{4,e}]         %%
%%
%% len function from p04.erl                     %%
%%
len([_H|T]) -> 1+len(T);
len([]) ->
    0.
%%
%% reverse function from p05.erl                 %%
%%
reverse(L) ->
    reverse(L,[]).
reverse([],Tail) ->
    Tail;
reverse([H|T], Tail) ->
    reverse(T,[H|Tail]).
%%
%% Interface
encode(L) ->
    encode(L,[],[]).
%%
encode([],[],[]) -> [];
%% When no list is send to function 
encode([H|T], [], TiL) ->
    encode(T,[H],TiL);
%% Add first element of raw list to list of same elements
encode([H|T], [H|Rest], TiL) ->
    encode(T, [H,H|Rest], TiL);
%% When first element of raw list match first element of
%% list of same elements, add H to list of same elements.
encode([H|T], [Hd|Rest],TiL) ->
    encode(T,[H],[{len([Hd|Rest]),Hd}|TiL]);
%% When no same elements in raw list, create tuple of length
%% of same elements in second arg plus one of same element.
%% Append it to Tuples in List. 
encode([],[H|T],TiL) ->
    reverse([{len([H|T]),H}|TiL]).
%% When raw list is empty display final result.
%% Aslo in list of same elements we still have some data,
%% and we need to reverse list, because it displays in
%% wrong order.


%%   Test for encode() function     %%
encode_test() ->
    ?assertEqual([{4,a},{1,b},{2,c},{2,a},{1,d},{4,e}], encode([a,a,a,a,b,c,c,a,a,d,e,e,e,e])),
    ?assertEqual([], encode([])),
    ok.
%%   Test for encode() function     %%
