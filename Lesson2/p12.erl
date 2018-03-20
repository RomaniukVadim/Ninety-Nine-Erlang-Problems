-module(p12).
-author('Romaniuk Vadim <romaniuk.cv@gmail.com>').
-export([decode_modified/1]).
-include_lib("eunit/include/eunit.hrl").

%%
%% (**) Decode a run-length encoded list.                 %%
%% Given a run-length code list generated as specified in %%
%% problem P11. Construct its uncompressed version.       %%
%%
%% 1> p12:decode_modified([{4,a},b,{2,c},{2,a},d,{4,e}]). %%
%% [a,a,a,a,b,c,c,a,a,d,e,e,e,e]                          %%
%%
%% reverse function from p05.erl                          %%
%%
reverse(L) ->
    reverse(L,[]).
reverse([],Tail) ->
    Tail;
reverse([H|T], Tail) ->
    reverse(T,[H|Tail]).
%%
%% flatten function from p07.erl                          %%
flatten(List) ->
    flatten(List, []). 
flatten([[]|T],FlattenList) ->
    flatten(T,FlattenList);
flatten([[_|_]=H|T],FlattenList) ->
    flatten(T,flatten(H,FlattenList));
flatten([H|T],FlattenList) ->
    flatten(T,FlattenList++[H]);
flatten([],FlattenList) ->
    FlattenList.
%%
%% replicate function from p15.erl                        %%
%%
replicate(Element,Num) ->
    replicate(Element,Num,[]).
replicate(_,0,L) ->
    L;
replicate(Element,Num,DupList) ->
   [Element|replicate(Element,Num-1,DupList)].
%%
%% Interface
decode_modified(L) ->
    decode_modified(L,{},[]).
decode_modified([],_,[]) -> [];
%% When Raw list and output list is empty, return empty list. %%
decode_modified([H|T],{},List) ->
    decode_modified(T,H,List);
%% When nothing in second argument, add Head element.         %%
decode_modified([H|T],{Num,Char},List) ->
    decode_modified(T,H,[replicate(Char,Num)|List]);
%% When Element match tuple of Num and char, add to output    %%
%% list replicated elements plus output list itself.          %%
decode_modified([H|T],_Element = Char,List) ->
    decode_modified(T,H,[Char|List]);

%% Output
decode_modified([],{Num,Char},List) ->
    flatten(reverse([replicate(Char,Num)|List]));
decode_modified([],Char,List) ->
    flatten(reverse([Char|List])).
%% Output
%%
%%   Test for decode_modified() function     %%
decode_modified_test() ->
    ?assertEqual([a,a,a,a,b,c,c,a,a,d,e,e,e,e], decode_modified([{4,a},b,{2,c},{2,a},d,{4,e}])),
    ?assertEqual([], decode_modified([])),
    ok.
%%   Test for decode_modified() function     %%

