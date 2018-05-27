-module(p20).
-author('Romaniuk Vadim <romaniuk.cv@gmail.com>').
-export([remove_at/2]).
-include_lib("eunit/include/eunit.hrl").


%% Test for remove_at() function   %%
remove_at_test() ->
    ?assertEqual([a,c,d], remove_at([a,b,c,d], 2)),
    ?assertEqual([], remove_at([], 4)),
    ok.
%% Test for remove_at() function   %%
