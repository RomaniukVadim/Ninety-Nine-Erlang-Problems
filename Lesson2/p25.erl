-module(p25).
-author('Romaniuk Vadim <romaniuk.cv@gmail.com>').
-export([rnd_permu/2]).
-include_lib("eunit/include/eunit.hrl").


%% Test for rnd_permu() function   %%
rnd_permu_test() ->
    ?assertEqual([b,a,d,c,e,f], rnd_permu([a,b,c,d,e,f])),
    ok.
%% Test for rnd_permu() function   %%
