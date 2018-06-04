-module(p22).
-author('Romaniuk Vadim <romaniuk.cv@gmail.com>').
-export([range/2]).
-include_lib("eunit/include/eunit.hrl").

range(Start,End) when is_integer(Start) =:= true, is_integer(End) =:= true ->
    range(Start,End,[]).

range(Start,End, Result) ->
    if
	Start =:= End ->
	    [Start|Result];
	Start > End ->
	    range(Start,End+1,[End|Result]);
	Start < End ->
	    range(Start,End-1,[End|Result])
    end.
	
%% Test for range() function   %%
range_test() ->
    ?assertEqual([4,5,6,7,8,9], range(4,9)),
    ?assertEqual([9,8,7,6,5,4], range(9,4)),
    ok.
%% Test for range() function   %%
