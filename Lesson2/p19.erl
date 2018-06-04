-module(p19).
-author('Romaniuk Vadim <romaniuk.cv@gmail.com>').
-export([rotate/2]).
-include_lib("eunit/include/eunit.hrl").

rotate(List, Number) when is_integer(Number) =:= true ->
    case List of
	[] -> [];
	_ ->
	    case Number of
		0 ->
		    List;
		_ ->
		    rotate(List, Number ,[])
	    end
    end.

rotate([], _, Result) ->    
    Result;

rotate(List, Number ,Result) ->
    .



%%%
reverse(L) ->
    reverse(L,[]).
reverse([],Tail) ->
    Tail;
reverse([H|T], Tail) ->
    reverse(T,[H|Tail]).
%%%

%% Test for rotate() function   %%
rotate_test() ->
    ?assertEqual([d,e,f,g,h,a,b,c], rotate([a,b,c,d,e,f,g,h], 3).),
    ?assertEqual([g,h,a,b,c,d,e,f], rotate([a,b,c,d,e,f,g,h], -2)),
    ?assertEqual([], rotate([], 2)),
    ok.
%% Test for rotate() function   %%
