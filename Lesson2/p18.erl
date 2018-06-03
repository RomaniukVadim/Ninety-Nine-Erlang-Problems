-module(p18).
-author('Romaniuk Vadim <romaniuk.cv@gmail.com>').
-export([slice/3]).
-include_lib("eunit/include/eunit.hrl").

slice(List, Start, End) when is_integer(Start) =:= true , is_integer(End) =:= true ->
    case List of
	[] -> [];
	_ ->
	    case End of
		0 ->
		    [];
		_ ->
		    case Start of
			0 ->
			    slice(List,0,End,[]);
			_ ->
			    slice(List,Start,End,[])
		    end
	    end
    end.
 slice([H|T], 0, End,Result) ->
    case End of
	1 ->
	    reverse([H|Result]);
	_ ->
	    slice(T,0, End-1, [H|Result])
    end;

slice([H|T], Start, End, Result) ->
    case Start of
	1 ->
	    slice(T,0, End -1, [H|Result]);
	_ ->
	    slice(T,Start-1, End-1, Result)
    end.


%%%
reverse(L) ->
    reverse(L,[]).
reverse([],Tail) ->
    Tail;
reverse([H|T], Tail) ->
    reverse(T,[H|Tail]).
%%%


%% Test for replicate() function   %%
replicate_test() ->
    ?assertEqual([c,d,e,f,g], slice([a,b,c,d,e,f,g,h,i,k],3,7)),
    ?assertEqual([a,b,c,d,e,f,g,h,i,k], slice([a,b,c,d,e,f,g,h,i,k],1,10)),
    ?assertEqual([], slice([], 2,4)),
    ok.
%% Test for replicate() function   %%
