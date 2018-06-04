-module(p20).
-author('Romaniuk Vadim <romaniuk.cv@gmail.com>').
-export([remove_at/2]).
-include_lib("eunit/include/eunit.hrl").

remove_at(List, Number) when is_integer(Number) =:= true ->
    case List of
	[] -> [];
	_ ->
	    case Number of
		0 ->
		    List;
		_ ->
		    remove_at(List, Number ,[])
	    end
    end.

remove_at(End,0,Result) ->
    case End of
	[] ->
	    reverse(Result);
	[H|[]] ->
	    remove_at([],0,[H|Result]);
	[H|T] ->
	    remove_at(T,0,[H|Result])
    end;

remove_at([H|T],Number,Result) ->
    case Number of
	1 ->
	    remove_at(T,0,Result);
	_ ->
	    remove_at(T,Number-1,[H|Result])  
    end.


%%%
reverse(L) ->
    reverse(L,[]).
reverse([],Tail) ->
    Tail;
reverse([H|T], Tail) ->
    reverse(T,[H|Tail]).
%%%

%% Test for remove_at() function   %%
remove_at_test() ->
    ?assertEqual([a,c,d], remove_at([a,b,c,d], 2)),
    ?assertEqual([], remove_at([], 4)),
    ok.
%% Test for remove_at() function   %%
