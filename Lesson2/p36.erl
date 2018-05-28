-module(p36).
-author('Romaniuk Vadim <romaniuk.cv@gmail.com>').
-export([prime_factors_mult/1]).
-include_lib("eunit/include/eunit.hrl").


%% Test for prime_factors_mult() function   %%
prime_factors_mult_test() ->
    ?assertEqual([[3,2], [5,1], [7,1]], prime_factors_mult(315)),
    ok.
%% Test for prime_factors_mult() function   %%
