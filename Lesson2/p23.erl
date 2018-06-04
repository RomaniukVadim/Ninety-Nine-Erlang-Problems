-module(p23).
-author('Romaniuk Vadim <romaniuk.cv@gmail.com>').
-export([rnd_select/2]).
-include_lib("eunit/include/eunit.hrl").

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
len([]) ->
    0.

%% Element at
element_at([H|_], 1 ) ->
    H;
element_at([_H|T], N) ->
    element_at(T, N-1);
element_at([],_) -> undefined.
%%

%% Test for rnd_select() function   %%
%%rnd_select_test() ->
%%    ?assertEqual([e,d,a], rnd_select([a,b,c,d,e,f,g,h], 3)),
%%    ok.
%% Test for rnd_select() function   %%
