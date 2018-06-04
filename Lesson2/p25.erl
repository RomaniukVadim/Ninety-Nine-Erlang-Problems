-module(p25).
-author('Romaniuk Vadim <romaniuk.cv@gmail.com>').
-export([rnd_permu/1]).
-include_lib("eunit/include/eunit.hrl").

rnd_permu(List) ->
    rnd_select(List,len(List)).

%% rnd_select from p23
rnd_select(List, Number) when is_integer(Number) =:= true-> rnd_select(List,Number,[]).
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
len([]) -> 0.
%% Element at
element_at([H|_], 1 ) -> H;
element_at([_H|T], N) -> element_at(T, N-1);
element_at([],_) -> undefined.
%%
%% Test for rnd_permu() function   %%
%%rnd_permu_test() ->
%%    ?assertEqual([b,a,d,c,e,f], rnd_permu([a,b,c,d,e,f])),
%%    ok.
%% Test for rnd_permu() function   %%
