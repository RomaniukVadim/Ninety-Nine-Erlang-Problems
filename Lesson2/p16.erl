-module(p16).
-author('Romaniuk Vadim <romaniuk.cv@gmail.com>').
-export([drop/2]).
-include_lib("eunit/include/eunit.hrl").
%% Example:
%% 1> p16:drop([a,b,c,d,e,f,g,h,i,k], 3).
%% [a,b,d,e,g,h,k]

drop(List, DropElement) when is_integer(DropElement) =:= true ->
    case DropElement of
	0 ->
	    List;
	_ ->
	    drop(List, DropElement, DropElement, [])
    end.

drop([_|T], DropElement, 1, Result) ->
    drop(T, DropElement, DropElement, Result);

drop([H|T], DropElement, NumberOfIteration, Result) ->
    drop(T, DropElement, NumberOfIteration -1, [H|Result]);

drop([],_,_, Result) ->
    reverse(Result).


%%%
reverse(L) ->
    reverse(L,[]).
reverse([],Tail) ->
    Tail;
reverse([H|T], Tail) ->
    reverse(T,[H|Tail]).
%%%

%% Test for drop() function   %%
drop_test() ->
    ?assertEqual([a,b,d,e,g,h,k], drop([a,b,c,d,e,f,g,h,i,k], 3)),
    ?assertEqual([a,b,c], drop([a,b,c], 0)),
    ok.
%% Test for drop() function   %%
