-module(p32).
-author('Romaniuk Vadim <romaniuk.cv@gmail.com>').
-export([gcd/2]).
-include_lib("eunit/include/eunit.hrl").

gcd(First, Second) when First >= Second->
    case (First rem Second) >= 1 of
	true ->
	    gcd(Second, First rem Second);
	false ->
	    Second
    end;
gcd(First, Second) ->
    gcd(Second, First).


%% Test for gcd() function   %%
gcd_test() ->
    ?assertEqual(9, gcd(36,63)),
    ok.
%% Test for gcd() function   %%
