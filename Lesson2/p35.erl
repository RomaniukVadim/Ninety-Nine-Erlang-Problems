-module(p35).
-author('Romaniuk Vadim <romaniuk.cv@gmail.com>').
-export([prime_factor/1]).
-include_lib("eunit/include/eunit.hrl").


%% Test for prime_factor() function   %%
prime_factor_test() ->
    ?assertEqual([3,3,5,7], prime_factors(315)),
    ok.
%% Test for prime_factor() function   %%
