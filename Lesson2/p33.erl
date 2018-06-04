-module(p33).
-author('Romaniuk Vadim <romaniuk.cv@gmail.com>').
-export([coprime/2]).
-include_lib("eunit/include/eunit.hrl").

coprime(First, Second) when First > 0, Second > 0 ->
    case gcd(First, Second) == 1 of 
	true ->
	    true;
	_ ->
	    false
    end;
coprime(_First,_Second) ->
    error.


%% greatest common divisor
gcd(First, Second) when First >= Second->
    case (First rem Second) >= 1 of
	true ->
	    gcd(Second, First rem Second);
	false ->
	    Second
    end;
gcd(First, Second) ->
    gcd(Second, First).

%% Test for coprime() function   %%
coprime_test() ->
    ?assertEqual(true, coprime(35,64)),
    ?assertEqual(false, coprime(35,65)),
    ok.
%% Test for coprime() function   %%
