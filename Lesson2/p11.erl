-module(p11).
-author('Romaniuk Vadim <romaniuk.cv@gmail.com>').
-export([encode_modified/1]).
-include_lib("eunit/include/eunit.hrl").

%%
%% (*) Modified run-length encoding.                      %%
%% Modify the result of problem P10 in such a way that if %%
%% an element has no duplicates it is simply copied into  %%
%% the result list. Only elements with duplicates are     %%
%% transferred as (N E) lists.                            %%
%%
%% 1> p11:encode_modified([a,a,a,a,b,c,c,a,a,d,e,e,e,e]). %%
%% [{4,a},b,{2,c},{2,a},d,{4,e}]                          %%
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
encode_modified(L) ->
    encode_modified(L,[],[],0).
encode_modified([],[],[],_) -> [];
%% When no list is send to function 
encode_modified([H|T], [], TiL,0) ->
    encode_modified(T,[H],TiL,0);
%% Add first element of raw list to list of same elements
encode_modified([H|T], [H|Rest], TiL,_) ->
    encode_modified(T, [H,H|Rest], TiL,len([H,H|Rest]));
%% When first element of raw list match first element of
%% list of same elements, add H to list of same elements.
encode_modified([H|T], [Hd|_],TiL,1) ->
    encode_modified(T,[H],[Hd|TiL],1);
%% When len of same element don't create tuple,
%% just add element to list.
encode_modified([H|T], [Hd|Rest],TiL,_) ->
    encode_modified(T,[H],[{len([Hd|Rest]),Hd}|TiL],1);
%% When no same elements in raw list, create tuple of length
%% of same elements in second arg plus one of same element.
%% Append it to Tuples in List. 
encode_modified([],[H|_T],TiL,1) ->
    reverse([H|TiL]);
%% When length of last list of same element == 1,
%% just add element to list. 
encode_modified([],[H|T],TiL,_) ->
    reverse([{len([H|T]),H}|TiL]).
%%
%% When raw list is empty display final result.
%% Aslo in list of same elements we still have some data,
%% and we need to reverse list, because it displays in
%% wrong order.



%%   Test for encode_modified() function     %%
encode_modified_test() ->
    ?assertEqual([{4,a},b,{2,c},{2,a},d,{4,e}], encode_modified([a,a,a,a,b,c,c,a,a,d,e,e,e,e])),
    ?assertEqual([], encode_modified([])),
    ok.
%%   Test for encode_modified() function     %%
