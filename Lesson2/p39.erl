-module(p39).
-author('Romaniuk Vadim <romaniuk.cv@gmail.com>').
-export([prime_list/2]).
-include_lib("eunit/include/eunit.hrl").

prime_list(MinNumber,MaxNumber)->
    [ X || X <- lists:seq(MinNumber,MaxNumber), is_prime(X) == true ]. 

is_prime(Number) when Number =< 1 ->
    false;
is_prime(Number) ->
    is_prime(Number,2).

is_prime(Number,Count) when Count < Number ->
    case Number rem Count =:= 0 of
        true ->
	    false;
        false ->
	    is_prime(Number,Count+1)
    end;
is_prime(Number,Count) when Count >= Number -> 
    true.
