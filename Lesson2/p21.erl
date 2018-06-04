-module(p21).
-author('Romaniuk Vadim <romaniuk.cv@gmail.com>').
-export([insert_at/3]).
-include_lib("eunit/include/eunit.hrl").

insert_at(List, Element, Position) when is_integer(Position) =:= true ->
    case List of
	[] ->
	    [Element];
	_ ->
	    insert_at(List, Element, Position, [])
    end.

insert_at(List,Element,0,Result) ->
    case List of
	[] ->
	    reverse(Result);
	[H|[]] ->
	    insert_at([],Element,0,[H|Result]);
	[H|T] ->
	    insert_at(T,Element,0,[H|Result])
    end;


insert_at([H|T], Element, Position, Result) ->
    case Position of
	1 ->
	    insert_at([H|T], Element, Position-1, [Element|Result]);
	_ when Position > 0 ->
	    insert_at(T, Element, Position-1, [H|Result])
    end.


%%%
reverse(L) ->
    reverse(L,[]).
reverse([],Tail) ->
    Tail;
reverse([H|T], Tail) ->
    reverse(T,[H|Tail]).
%%%

%% Test for insert_at() function   %%
insert_at_test() ->
    ?assertEqual([a,alfa,b,c,d], insert_at([a,b,c,d], alfa, 2)),
    ?assertEqual([alfa], insert_at([],alfa, 2)),
    ok.
%% Test for insert_at() function   %%
