-module(p32).
-author('Romaniuk Vadim <romaniuk.cv@gmail.com>').
-export([is_prime/1]).
-include_lib("eunit/include/eunit.hrl").


%% Test for is_prime() function   %%
is_prime_test() ->
    ?assertEqual(T, is_prime(7)),
    ok.
%% Test for is_prime() function   %%
