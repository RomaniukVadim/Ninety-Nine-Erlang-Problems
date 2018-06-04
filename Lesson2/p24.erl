-module(p24).
-author('Romaniuk Vadim <romaniuk.cv@gmail.com>').
-export([lotto_select/2]).
-include_lib("eunit/include/eunit.hrl").

lotto_select(ListLength,MaxNumber) ->
    rnd_select(range(1,MaxNumber),ListLength).
    




%% range
range(Start,End) when is_integer(Start) =:= true, is_integer(End) =:= true ->range(Start,End,[]).
range(Start,End, Result) ->
    if
	Start =:= End ->
	    [Start|Result];
	Start > End ->
	    range(Start,End+1,[End|Result]);
	Start < End ->
	    range(Start,End-1,[End|Result])
    end.	
%% random select
rnd_select(List, Number) when is_integer(Number) =:= true->
    rnd_select(List,Number,[]).
rnd_select(List,Number,Result) ->
    Random_number = rand:uniform(len(List)),
    case len(Result) of
	Number ->
	    Result;
	_ ->
	    rnd_select(List,Number,[element_at(List,Random_number)|Result])
    end.
%% List len
len([_H|T]) -> 1+len(T);
len([]) ->0.
%% Element at
element_at([H|_], 1 ) ->H;
element_at([_H|T], N) ->element_at(T, N-1);
element_at([],_) -> undefined.
%%
%% Test for lotto_select() function   %%
%%lotto_select_test() ->
%%    ?assertEqual([23,1,17,33,21,37], lotto_select(6,49)),
%%    ok.
%% Test for lotto_select() function   %%
