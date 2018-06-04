-module(p31).
-author('Romaniuk Vadim <romaniuk.cv@gmail.com>').
-export([is_prime/1]).
-include_lib("eunit/include/eunit.hrl").

is_prime(0)-> false;
is_prime(1)-> false;
is_prime(2)-> true;

is_prime(Number) ->
    case (Number rem 2) =:= 0 of
        true -> false;
        _ -> true
    end.    

%% Test for is_prime() function   %%
is_prime_test() ->
    ?assertEqual(false, is_prime(8)),
    ?assertEqual(true, is_prime(7)),
    ?assertEqual(true, is_prime(104729)),
    ?assertEqual(false, is_prime(104730)),
    ?assertEqual(true, is_prime(101141)),
    ?assertEqual(true, is_prime(101107)),
    ?assertEqual(true, is_prime(95393)),
    ?assertEqual(true, is_prime(86293)),
    ?assertEqual(true, is_prime(83719)),
    ?assertEqual(true, is_prime(80747)),
    ?assertEqual(true, is_prime(78467)),
    ok.
%% Test for is_prime() function   %%
