-module(p17).
-author('Romaniuk Vadim <romaniuk.cv@gmail.com>').
-export([split/2]).
-include_lib("eunit/include/eunit.hrl").

split(List, FirstPartNum)  when is_integer(FirstPartNum) =:= true ->
    case FirstPartNum of
	0 ->
	    List;
	_ ->
	    case List of
		[] -> [];
		_ ->
		    split(List, FirstPartNum, [])
	    end
    end.

split([H|T], FirstPartNum, FirstPartList) ->
    case FirstPartNum of
	1 ->
	    [reverse([H|FirstPartList]),T];
	_ ->
	    split(T, FirstPartNum - 1, [H|FirstPartList])
    end.

%%%
reverse(L) ->
    reverse(L,[]).
reverse([],Tail) ->
    Tail;
reverse([H|T], Tail) ->
    reverse(T,[H|Tail]).
%%%


%% Test for split() function   %%
split_test() ->
    ?assertEqual([[a,b,c], [d,e,f,g,h,i]], split([a,b,c,d,e,f,g,h,i], 3)),
    ?assertEqual([], split([], 3)),
    ?assertEqual([a,b,c], split([a,b,c], 0)),
    ok.
%% Test for split() function   %%
