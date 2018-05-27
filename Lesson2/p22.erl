-module(p22).
-author('Romaniuk Vadim <romaniuk.cv@gmail.com>').
-export([range/2]).
-include_lib("eunit/include/eunit.hrl").


%% Test for range() function   %%
range_test() ->
    ?assertEqual([4,5,6,7,8,9], range(4,9)),
    ?assertEqual([9,8,7,6,5,4], range(9,4)),
    ok.
%% Test for range() function   %%
