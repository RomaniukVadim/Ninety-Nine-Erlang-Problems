-module(p24).
-author('Romaniuk Vadim <romaniuk.cv@gmail.com>').
-export([lotto_select/2]).
-include_lib("eunit/include/eunit.hrl").


%% Test for lotto_select() function   %%
lotto_select_test() ->
    ?assertEqual([23,1,17,33,21,37], lotto_select(6,49)),
    ok.
%% Test for lotto_select() function   %%
