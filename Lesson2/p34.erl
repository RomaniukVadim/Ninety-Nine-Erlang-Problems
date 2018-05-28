-module(p34).
-author('Romaniuk Vadim <romaniuk.cv@gmail.com>').
-export([totient_phi/1]).
-include_lib("eunit/include/eunit.hrl").


%% Test for totient_phi() function   %%
totient_phi_test() ->
    ?assertEqual(4, totient_phi(10)),
    ok.
%% Test for totient_phi() function   %%
