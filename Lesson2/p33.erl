-module(p33).
-author('Romaniuk Vadim <romaniuk.cv@gmail.com>').
-export([coprime/2]).
-include_lib("eunit/include/eunit.hrl").


%% Test for coprime() function   %%
coprime_test() ->
    ?assertEqual(T, coprime(35,64)),
    ok.
%% Test for coprime() function   %%
